json.extract! account_detail, :id, :IBAN, :created_at, :updated_at
json.url account_detail_url(account_detail, format: :json)