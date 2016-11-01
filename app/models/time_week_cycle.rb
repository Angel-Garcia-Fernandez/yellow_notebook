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
#  week_day                 :integer
#

class TimeWeekCycle < ActiveRecord::Base

  include Enum_I18n
  enum week_day: [ :sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday ]

  belongs_to :activity

  validates_presence_of :activity_class_ends_at, :activity_class_starts_at, :activity, :week_day
  validate :period_ended_after_start
  validates_inclusion_of :week_day, in: week_days.keys

  def to_s
    "#{ self.class.human_enum_name( :week_day, week_day ) } #{activity_class_starts_at.try(:strftime, '%H:%M')}-#{activity_class_ends_at.try(:strftime, '%H:%M')}"
  end

  def week_day_number
    TimeWeekCycle.week_days[ week_day ]
  end


  private
  # def activity_class_ends_after_start
  #   invalid = false
  #   if activity_class_starts_at > activity_class_ends_at
  #     errors.add( :activity_class_ends_at, :end_before_start )
  #     invalid = true
  #   end
  #   invalid
  # end

  def period_ended_after_start
    invalid = false
    if period_started_at.present? and period_ended_at.present? and period_ended_at > period_started_at
      errors.add( :period_ended_at, :end_before_start )
      invalid = true
    end
    invalid
  end

end
