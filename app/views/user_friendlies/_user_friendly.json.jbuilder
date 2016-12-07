json.extract! user_friendly, :id, :name, :slug, :created_at, :updated_at
json.url user_friendly_url(user_friendly, format: :json)