# == Schema Information
#
# Table name: activities
#
#  id             :integer          not null, primary key
#  code           :string(255)      not null
#  name           :string(255)      not null
#  classification :string(255)
#  started_at     :date
#  ended_at       :date
#  default_price  :decimal(8, 2)
#  details        :text(65535)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  school_id      :integer
#

class Activity < ActiveRecord::Base

  belongs_to :school
  has_many :activity_classes
  has_many :student_activity_sign_ups
  has_many :time_week_cycles
  has_many :teacher_activities

  validates_presence_of :code, :name
  validates_length_of :code, :name, :classification, maximum: 255
  #validates_uniqueness_of :code

end
