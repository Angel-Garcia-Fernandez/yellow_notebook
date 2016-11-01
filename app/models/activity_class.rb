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

  before_validation :build_students_signed_up

  validates_presence_of :activity, :started_at, :ended_at
  validate :end_after_start
  validate :activity_must_start
  validate :in_date?
  #validate :no_overlapping
  #validates_associated :student_class_data

  delegate :teacher_in_charge, to: :activity

  scope :starts_before, -> ( date = DateTime.current ) { where( "activity_classes.started_at <= ?", date ) }
  scope :ends_after, -> ( date = DateTime.current ) { where( "activity_classes.ended_at >= ?", date ) }
  scope :attendance_incompleted, -> {
    joins( :student_class_data ).
      merge( StudentClassDatum.attendance_incompleted )
  }

  scope :attendance_completed, -> {
    where.not( id: self.attendance_incompleted.pluck( :id ) )
  }


  def to_s short = false
    "#{I18n.l started_at.to_date} #{ started_at.strftime "%H:%M" } - #{ ended_at.strftime "%H:%M" } #{"(#{activity})" if not short}"
  end

  def attendance_completed?
    self.student_class_data.length == self.student_class_data.attendance_complete.length
  end

  def number_of_students_signed date = DateTime.current
    StudentActivitySignUp.signed_for( self.activity, date ).length
  end

  def build_students_signed_up
    StudentActivitySignUp.signed_for( self.activity, self.started_at ).each do |s|
      if self.student_class_data.find_by( activity_class: self, student_activity_sign_up: s ).blank?
        #if self.student_class_data.find_by( student_activity_sign_up: s ).blank?
        s = self.student_class_data.build( activity_class: self, student_activity_sign_up: s )
        #self.student_class_data.build( student_activity_sign_up: s )
        puts( s.to_s )
      end
    end
  end

  private
  def in_date?
    invalid = false
    if self.activity.starts?
      if self.started_at < self.activity.started_at or
        ( self.activity.ends? and self.ended_at > self.activity.ended_at )
        errors.add( :base, :date_time_out_of_range )
        invalid = true
      end
    end
    invalid
  end

  def activity_must_start
    invalid = false
    if not self.activity.starts?
      errors.add( :base, :activity_has_not_started)
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

  def no_overlapping
    invalid = false
    if started_at.present? and activity.present?
      last_class_before = ActivityClass.where.not( id: self ).where( activity: self.activity ).starts_before( self.ended_at ).order( :ended_at ).last
      if last_class_before.present? and not last_class_before.ended_at <= self.started_at
        errors.add( :started_at, :overlapped )
        invalid = true
      else
        first_class_after = ActivityClass.where.not( id: self ).where( activity: self.activity ).ends_after( self.started_at ).order( :started_at ).first
        if first_class_after.present? and not first_class_after.started_at <= self.ended_at
          errors.add(:ended_at, :overlapped )
          invalid = true
        end
      end
    end
    invalid
  end

end
