json.extract! school, :id, :name, :address, :town, :province, :zip_code, :created_at, :updated_at
json.url school_url(school, format: :json)