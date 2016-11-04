class AttendanceSumary < ActiveRecord::Base
  belongs_to :activity
  belongs_to :school
  belongs_to :student
  belongs_to :student_class_datum
  belongs_to :activity_class

  attr_accessor :period_started_at, :period_ended_at

  scope :attendance_sum, -> {
    merge_table = ActivityClass.all
    merge_table = mergeTable.starts_after( @period_started_at ) if @period_started_at.present?
    merge_table = mergeTable.starts_before( @period_ended_at ) if @period_ended_at.present?
    joins( :activity_class ).merge( merge_table ).
      select( 'attendance_sumaries.activity_id, attendance_sumaries.school_id, attendance_sumaries.student_id, sum(attendance_sumaries.attended)' ).
      group( :activity_id, :school_id, :student_id )
  }

end
