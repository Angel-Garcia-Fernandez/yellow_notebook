# == Schema Information
#
# Table name: activity_classes
#
#  id          :integer          not null, primary key
#  started_at  :datetime         not null
#  ended_at    :datetime         not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  activity_id :integer          not null
#

class ActivityClass < ActiveRecord::Base

  belongs_to :activity
  has_many :teachers, through: :activity
  has_many :student_class_data

  accepts_nested_attributes_for :student_class_data

  validates_presence_of :activity, :started_at, :ended_at
  validate :end_after_start
  validate :in_date?
  validates_associated :student_class_data

  delegate :teacher_in_charge, to: :activity

  def number_of_students_signed date = DateTime.current
    StudentActivitySignUp.signed_for( self.activity, date ).count
  end

  private
  def in_date?
    invalid = false
    if self.activity.starts? and self.started_at >= self.activity.started_at and
        ( not self.activity.ends? or self.activity.ended_at > self.ended_at )
      errors.add( :base, :date_time_out_of_range )
      invalid = true
    end
    invalid
  end

  def end_after_start
    invalid = false
    if started_at.present? and ended_at.present? and started_at > ended_at
      errors.add( :ended_at, :end_before_start )
      invalid = true
    end
    invalid
  end

end
