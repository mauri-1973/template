json.extract! job, :id, :title, :description, created_by_id, :created_at, :updated_at
json.url member_url(job, format: :json)
