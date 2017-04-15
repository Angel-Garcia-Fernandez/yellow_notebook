json.extract! parse, :id, :xls_file, :output, :status, :course, :statuses, :csv_conversion_started_at, :csv_conversion_ended_at,
              :parsed_csv, :parsing_started_at, :parsing_ended_at, :created_at, :updated_at
json.url parse_url(parse, format: :json)

