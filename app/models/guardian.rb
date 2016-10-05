# == Schema Information
#
# Table name: guardians
#
#  id           :integer          not null, primary key
#  nic          :string(255)      default(""), not null
#  name         :string(255)      default(""), not null
#  surname      :string(255)      default(""), not null
#  phone_number :string(255)
#  address      :string(255)
#  town         :string(255)
#  province     :string(255)
#  zip_code     :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  student_id   :integer          not null
#

class Guardian < ActiveRecord::Base

  has_many :account_details
  belongs_to :student

  validates_presence_of :student
  validates_uniqueness_of :name, scope: [ :nic, :surname ]
  validates_length_of :nic, :name, :surname, :phone_number, :address, :town, :province, :zip_code, maximum: 255

end
