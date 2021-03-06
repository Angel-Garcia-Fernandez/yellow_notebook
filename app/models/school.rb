# == Schema Information
#
# Table name: schools
#
#  id         :integer          not null, primary key
#  name       :string(255)      default(""), not null
#  address    :string(255)
#  town       :string(255)
#  province   :string(255)
#  zip_code   :string(255)
#  email      :string(255)
#  phone      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class School < ActiveRecord::Base

  #Relations
  has_many :activities
  has_many :school_representatives
  has_many :students
  has_many :courses, through: :activities, inverse_of: :schools
  has_many :school_excel_names

  accepts_nested_attributes_for :school_excel_names

  #Validations
  validates_length_of :name, :address, :town, :province, :zip_code, :email, :phone, maximum: 255
  validates_presence_of :name
  validates_associated :school_excel_names

  def to_s large = false
    "#{name}#{" (#{town})" if town.present? and large }"
  end
end
