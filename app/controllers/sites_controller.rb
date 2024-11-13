class SitesController < ApplicationController
  before_action :set_site, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token, only: [:get_signed_s3_url_for_uploading_images]
  
  
  # GET /sites or /sites.json
  def index
    @sites = current_organization.sites
  end

  # GET /sites/1 or /sites/1.json
  def show
    @posts = @site.pages.flat_map(&:posts)
  end

  # GET /sites/new
  def new
    @site = current_user.organization.sites.new
  end

  # GET /sites/1/edit
  def edit
  end

  # POST /sites or /sites.json
  def create
    @site = current_user.organization.sites.new(site_params)

    respond_to do |format|
      if @site.save
        format.html { redirect_to site_url(@site), notice: "web site was successfully created." }
        format.json { render :show, status: :created, location: @site }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sites/1 or /sites/1.json
  def update
    respond_to do |format|
      begin
        if @site.update(site_params)
          format.html { redirect_to site_url(@site), notice: "Web site was successfully updated." }
          format.json { render :show, status: :ok, location: @site }
        else
          format.html { 
            flash.now[:alert] = @site.errors.full_messages.to_sentence
            render :edit, status: :unprocessable_entity 
          }
          format.json { render json: @site.errors, status: :unprocessable_entity }
        end
      rescue ActiveRecord::RecordNotUnique => e
        format.html {
          flash.now[:alert] = "This slug is already taken. Please choose a different one."
          render :edit, status: :unprocessable_entity
        }
        format.json { render json: { error: "Slug already taken" }, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1 or /sites/1.json
  def destroy
    @site.destroy!

    respond_to do |format|
      format.html { redirect_to sites_url, notice: "web site was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  def attach_pre_uploaded_s3_blob_to_site
    @site = current_site
    Rails.logger.info("Receiving a a request to attach an uploaded s3 file to site")

    if @site.images.attach(params[:signed_id])
      @blob = ActiveStorage::Blob.find_signed(params[:signed_id])
      @attachment = @blob.attachments&.first
      render json: { key: params[:key], image: @site.extract_image_data(@attachment) }, status: 200 
    else
      render json: { error: "error"}, status: 500 
    end
  end 


  def attach_multiple_pre_uploaded_s3_blobs_to_sites
    # params: images: []
    # has_many_attached :images
    
    # imges include blob IDS and attach to this model sites.rb

    if params[:site_slug].present?
      slug = params[:site_slug]
      @page = current_user.organization.pages.find_by(slug: slug) || current_user.organization.pages.find(slug)
      @site = @page.site || current_site
    else
      render json: { error: "No site slug provided" }, status: 400
    end
    
    attached_images = []

    if params[:image_blob_ids].present?
      params[:image_blob_ids].each do |blob_id|
        if blob = ActiveStorage::Blob.find_signed(blob_id)
          @site = @site || current_site
          @site.images.attach(blob.signed_id)
          # Get the most recently attached image
          attached_images << @site.images.last
        end
      end
      
      #Send image data back to the client so we can display them in the UI
      images_json = attached_images.compact.map { |img|
        {
          attachment_id: img.id,
          blob_id: img.blob_id,
          url: img.service.send(:object_for, img.key).public_url,
          image: @site.extract_image_data(img)
        }
      }

      render json: { message: "Images attached to site successfully", images: images_json }, status: 200
    else
      render json: { error: "No image blob IDs provided" }, status: 400
    end
  end
  
  def get_signed_s3_url_for_uploading_images #TODO:! Duplicate code in job_requests_controller
    @blob = ActiveStorage::Blob.create_before_direct_upload!(
      filename: params[:filename],
      byte_size: params[:byte_size],
      checksum: params[:checksum],
      content_type: params[:content_type]
    )

    render json: { url: @blob.service_url_for_direct_upload(expires_in: 30.minutes), headers: @blob.service_headers_for_direct_upload, signed_id: @blob.signed_id, key: @blob.key, blob_url: rails_blob_url(@blob, host: request.base_url)}, status: 200
  end

  def list_images #error -- this keeps getting hit 
    if params[:site_slug].present?
      page = params[:page] || 1
      per_page = 10
      offset = (page.to_i - 1) * per_page
      slug = params[:site_slug]
      @page = current_user.organization.pages.find_by(slug: slug) || current_user.organization.pages.find(slug)
      @site = @page.site || current_site
      @images = @site.images.order(created_at: :desc).offset(offset).limit(per_page)
      json_response = @images.map { |img|
          {
            attachment_id: img.id,
            blob_id: img.blob_id,
            url: img.service.send(:object_for, img.key).public_url,
            image: @site.extract_image_data(img)
          }
      }
      render json: json_response
    else
      render json: { error: "No site slug provided" }, status: 400
    end

  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = current_user.organization.sites.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def site_params
      params.require(:site).permit(:organization_id, :name, :slug, :home_page_id, :wordpress_api_encoded_token)
    end
end
