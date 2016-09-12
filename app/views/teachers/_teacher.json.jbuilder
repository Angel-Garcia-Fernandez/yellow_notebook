json.extract! teacher, :id, :name, :surname, :manage_attendance_default, :manage_collection_default, :details, :created_at, :updated_at
json.url teacher_url(teacher, format: :json)