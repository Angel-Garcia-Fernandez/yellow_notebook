json.extract! activity, :id, :name, :classification, :started_at, :ended_at, :default_price, :created_at, :updated_at
json.url activity_url(activity, format: :json)