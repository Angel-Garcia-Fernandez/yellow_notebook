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

  validates_presence_of :name
  validates_length_of :name, :classification, maximum: 255
  #validates_uniqueness_of :code

  def to_s
    "#{name} - #{classification}"
  end

  def total_num_of_students
    self.student_activity_sign_ups.count
  end

  def current_num_of_students date = DateTime.current
    self.student_activity_sign_ups.currently( date ).count
  end
end
