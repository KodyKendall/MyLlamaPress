class Page < ApplicationRecord
  include Rails.application.routes.url_helpers

  extend FriendlyId
  belongs_to :site
  belongs_to :organization
  has_many :page_histories, dependent: :destroy

  before_validation :ensure_site, on: :create
  after_initialize :set_default_html_content, if: :new_record?

  friendly_id :slug, use: :slugged

  def render_content
    content = self.content
    content = render_snippets(content)
    return content
  end

  def render_snippets(content)
    # a snippet is something like {{snippet:header}} or {{snippet:footer}}
    # for each {{ in the content, see if there is a matching snippet
    # if so, replace the {{snippet:name}} with the snippet content

    # make this work by snippet id, and by snippet name
    # if the snippet name is not found, then don't replace it
    # if the snippet id is not found, then don't replace it
    # if the snippet id is found, then replace it
    # if the snippet name is found, then replace it

    content.gsub!(/\{\{snippet_id:(.*?)\}\}/) do |match|
      snippet_identifier = $1
      snippet = Snippet.find_by(id: snippet_identifier)
      snippet.content if snippet.present?
    end

    content.gsub!(/\{\{snippet_name:(.*?)\}\}/) do |match|
      snippet_identifier = $1&.strip
      snippet = Snippet.find_by(name: snippet_identifier)
      snippet.content if snippet.present?
    end

    return content
  end

  def inject_chat_partial
    render_to_string(partial: 'shared/llama_bot/chat')
  end

  def inject_analytics_partial
    render_to_string(partial: 'shared/llama_bot/analytics')
  end

  # Ensure the web page has a web site. If not, create one so the user doesn't have to.
  def ensure_site
    return if site.present?
    return unless organization.present?

    self.site = organization.sites.first || create_new_site
  end

  def restore(page_history)
    self.save_history
    self.content = page_history.content
    self.save
  end

  def save_history()
    page_history = self.page_histories.create(content: self.content, user_message: "Restore to previous version")
  end

  # Set the default html content for the web page
  def set_default_html_content
    if self.content.blank?
      self.content = PagesHelper.starting_html_content()
    end
  end

  private

  # Create a new web site for the organization
  def create_new_site
    name = generate_unique_name
    organization.sites.create!(name: name)
  end

  # Generate a unique name for the web site
  def generate_unique_name
    base_name = organization.name.presence || self.slug || 'LlamaPress Site'
    name = base_name
    index = 1

    while organization.sites.exists?(name: name)
      name = "#{base_name} #{index}"
      index += 1
    end

    name
  end

  def controller
    @controller ||= ActionController::Base.new
  end
end
