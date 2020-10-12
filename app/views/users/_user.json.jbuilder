json.extract! user, :id, :user_id, :ps, :name, :authority, :created_at, :updated_at
json.url user_url(user, format: :json)
