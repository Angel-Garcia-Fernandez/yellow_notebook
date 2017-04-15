class Parse < ActiveRecord::Base
  #inclusions
  include Enum_I18n

  #Relations
  belongs_to :xls_file
  belongs_to :course
  enum status: [ :initial, :converting, :convert_succeed, :convert_failed, :parsing, :parse_succeed, :parse_failed ]

  #validations
  validates_presence_of :xls_file, :course, :status
  # validates_absence_of :csv_conversion_started_at, :csv_conversion_ended_at, :parsing_started_at, :parsing_ended_at, if: :initial?
  # validates_absence_of :csv_conversion_ended_at, :parsing_started_at, :parsing_ended_at, if: :converting?
  # validates_presence_of :csv_conversion_started_at, if: :converting?
  #   ...

end
