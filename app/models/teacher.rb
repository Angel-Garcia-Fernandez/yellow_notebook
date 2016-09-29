# == Schema Information
#
# Table name: teachers
#
#  id                            :integer          not null, primary key
#  name                          :string(255)      default("")
#  surname                       :string(255)      default("")
#  work_email                    :string(255)      default("")
#  NIC                           :string(255)
#  mobile_phone_number           :string(255)
#  phone_number                  :string(255)
#  address                       :string(255)
#  town                          :string(255)
#  province                      :string(255)
#  zip_code                      :string(255)
#  IBAN                          :string(255)
#  photo_file_name               :string(255)
#  photo_content_type            :string(255)
#  photo_file_size               :integer
#  photo_updated_at              :datetime
#  default_collection_management :boolean          default(FALSE), not null
#  default_attendance_management :boolean          default(FALSE), not null
#  studies                       :text(65535)
#  details                       :text(65535)
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  user_id                       :integer
#

class Teacher < ActiveRecord::Base

  has_one :teacher_user
  has_one :user, through: :teacher_user
  has_many :teacher_activities

  accepts_nested_attributes_for :teacher_user

  validates_uniqueness_of :name , scope: :surname#, conditions: { status: :active}
  #validates_presence_of :default_attendance_management, :default_collection_management
  validates_inclusion_of :default_attendance_management, :default_collection_management, in: [ true, false ]
  validates_length_of :IBAN, maximum: 75
  validates_length_of :name, :surname, :work_email, :NIC, :mobile_phone_number, :phone_number,
                      :address, :town, :province, :zip_code, maximum: 255
  validates_associated :teacher_user

  def to_s
    "#{surname}, #{name}"
  end

end
