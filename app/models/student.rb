# == Schema Information
#
# Table name: students
#
#  id                       :integer          not null, primary key
#  name                     :string(255)      default("")
#  surname                  :string(255)      default("")
#  NIC                      :string(255)
#  default_discount         :decimal(5, 4)    default(0.0), not null
#  default_payment_type_eid :integer          default(0), not null
#  scholar_phone_number     :string(255)
#  phone_number             :string(255)
#  address                  :string(255)
#  town                     :string(255)
#  province                 :string(255)
#  zip_code                 :string(255)
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

class Student < ActiveRecord::Base

  has_many :student_activity_sign_ups
  has_many :guardians
  has_many :account_details

  validates_length_of :name, :surname, :NIC, :scholar_phone_number, :phone_number, :address, :town,
                      :province, :zip_code, maximum: 255
  validates_presence_of :default_discount, :default_payment_type_eid
  validates_numericality_of  :default_discount, greater_than_or_equal_to: 0.0, less_than_or_equal_to: 1.0, allow_nil: true
  validates_uniqueness_of :name, scope: [ :surname ]
  validates_uniqueness_of :NIC, allow_blank: true, allow_nil: true

end
