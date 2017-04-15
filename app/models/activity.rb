# == Schema Information
#
# Table name: activities
#
#  id             :integer          not null, primary key
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

  #Relations
  belongs_to :course
  belongs_to :school
  has_many :time_week_cycles
  has_many :activity_classes
  has_many :student_activity_sign_ups
  has_many :students, through: :student_activity_sign_ups
  has_many :teacher_activities
  has_many :teachers, through: :teacher_activities

  accepts_nested_attributes_for :teacher_activities, allow_destroy: true, reject_if: proc { |attributes| attributes['teacher_id'].blank? }
  accepts_nested_attributes_for :student_activity_sign_ups, allow_destroy: true, reject_if: proc { |attributes| attributes['student_id'].blank? }
  accepts_nested_attributes_for :time_week_cycles, allow_destroy: true#, reject_if: proc { |attributes| attributes['student_id'].blank? }
  accepts_nested_attributes_for :activity_classes, allow_destroy: true#, reject_if: proc { |attributes| attributes['student_id'].blank? }

  validates_presence_of :name, :school, :course
  validates_uniqueness_of :name, scope: [:school_id, :course_id]
  validates_length_of :name, :classification, maximum: 255
  validates_associated :teacher_activities
  validate :end_after_start, if: :starts?
  validates_absence_of :ended_at, unless: :starts?
  validates_associated :student_activity_sign_ups, :teacher_activities, :activity_classes, :time_week_cycles


  scope :starts, -> () { where.not( started_at: nil ) }
  scope :ends, -> () { where.not( ended_at: nil ) }
  scope :on_going, -> ( date = DateTime.current ) { starts.where( "activities.ended_at is null or activities.ended_at >= ?", date )}
  scope :teacher_in_charge, -> () { joins( :teacher_activities ).merge( TeacherActivity.teacher_in_charge ) }


  def to_s large=true
    large ? "#{name} - #{classification} - #{school} - #{course}" : "#{name}"
  end

  def starts?
    started_at.present?
  end

  def on_going? date = DateTime.current
    starts? and date > started_at and ( not ends? or date < ended_at )
  end

  def ends?
    ended_at.present?
  end

  def total_num_of_students
    self.student_activity_sign_ups.count
  end

  def current_num_of_students date = DateTime.current
    self.student_activity_sign_ups.currently( date ).count
  end

  def total_num_of_classes
    self.activity_classes.count
  end

  def teacher_in_charge
    t = self.teacher_activities.teacher_in_charge.first
    t && t.teacher
  end

  def time_week_cycles?
    self.time_week_cycles.any?
  end

  def create_classes_from_time_week_cycles
    transaction do
      if self.started_at.present? and self.ended_at.present?
        self.time_week_cycles.each do |twc|
          starting_time = twc.period_started_at.present? ? [self.started_at, twc.period_started_at].max : self.started_at
          ending_time = twc.period_ended_at.present? ? [self.ended_at, twc.period_ended_at].min : self.ended_at

          (starting_time..ending_time).to_a.select{ |k| k.wday == twc.week_day_number }.each do |d|
            started_at = d.beginning_of_day.change hour: twc.activity_class_starts_at.hour, min: twc.activity_class_starts_at.min
            ended_at = d.beginning_of_day.change hour: twc.activity_class_ends_at.hour, min: twc.activity_class_ends_at.min
            if twc.activity_class_ends_at.seconds_since_midnight < twc.activity_class_starts_at.seconds_since_midnight
              ended_at = ended_at.advance( days: 1 )
            end
            ActivityClass.find_or_create_by activity: self, started_at: started_at, ended_at: ended_at
          end
        end
      end
    end
  end

  private
  def end_after_start
    invalid = false
    if started_at.present? and ended_at.present? and started_at > ended_at
      errors.add( :ended_at, :end_before_start )
      invalid = true
    end
    invalid
  end
end
