json.extract! teacher, :id, :name, :surname, :default_attendance_management, :default_collection_management, :details, :created_at, :updated_at
json.url teacher_url(teacher, format: :json)