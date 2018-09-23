json.extract! story, :id, :user_id, :title, :body, :tags, :created_at, :updated_at
json.url story_url(story, format: :json)
