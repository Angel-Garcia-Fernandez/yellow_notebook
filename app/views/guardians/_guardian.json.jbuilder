json.extract! guardian, :id, :nic, :name, :surname, :phone_number, :address, :town, :province, :zip_code, :created_at, :updated_at
json.url guardian_url(guardian, format: :json)