# == Schema Information
#
# Table name: time_week_cycles
#
#  id                       :integer          not null, primary key
#  activity_class_starts_at :datetime         not null
#  activity_class_ends_at   :datetime         not null
#  period_started_at        :date
#  period_ended_at          :date
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  activity_id              :integer          not null
#

class TimeWeekCycle < ActiveRecord::Base

  belongs_to :activity

  validates_presence_of :activity_class_ends_at, :activity_class_starts_at, :activity
  validate :activity_class_ends_after_start, :period_ended_after_start

  private
  def activity_class_ends_after_start
    invalid = false
    if activity_class_starts_at > activity_class_ends_at
      errors.add( :activity_class_ends_at, :ends_before_start )
      invalid = true
    end
    invalid
  end

  def period_ended_after_start
    invalid = false
    if period_started_at.present? and period_ended_at.present? and period_ended_at > period_started_at
      errors.add( :period_ended_at, :ended_before_start )
      invalid = true
    end
    invalid
  end

end
