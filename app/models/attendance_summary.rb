class AttendanceSummary < ActiveRecord::Base
  belongs_to :activity
  belongs_to :school
  belongs_to :student
  belongs_to :student_class_datum
  belongs_to :activity_class

  attr_accessor :period_started_at, :period_ended_at

  validates_presence_of :period_started_at, :period_ended_at
  validate :period_starts_before_ends

  def group_for_attendance_sum
    merge_table = ActivityClass.all
    merge_table = merge_table.starts_after( @period_started_at ) if @period_started_at.present?
    merge_table = merge_table.starts_before( @period_ended_at ) if @period_ended_at.present?
    AttendanceSummary.joins( :activity_class ).merge( merge_table ).
      select( 'attendance_summaries.activity_id, attendance_summaries.school_id, attendance_summaries.student_id, sum(attendance_summaries.attended) as attendance_sum, count(attendance_summaries.activity_class_id) as activity_classes_count' ).
      group( :activity_id, :school_id, :student_id )
  end

  private
  def period_starts_before_ends
    invalid = false
  end

end
