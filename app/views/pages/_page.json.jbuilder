json.extract! page, :id, :site_id, :content, :slug, :created_at, :updated_at
json.url page_url(page, format: :json)
