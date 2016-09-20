json.extract! student_class_datum, :id, :attended, :paid, :created_at, :updated_at
json.url student_class_datum_url(student_class_datum, format: :json)