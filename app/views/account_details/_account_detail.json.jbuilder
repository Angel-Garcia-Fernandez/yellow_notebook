json.extract! account_detail, :id, :iban, :created_at, :updated_at
json.url account_detail_url(account_detail, format: :json)