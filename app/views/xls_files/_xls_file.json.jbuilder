json.extract! xls_file, :id, :file, :file_file_name, :file_file_size, :file_content_type, :tile_updated_at, :created_at, :updated_at
json.url xls_file_url(xls_file, format: :json)