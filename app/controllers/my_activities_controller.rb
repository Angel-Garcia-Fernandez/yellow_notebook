class MyActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_teacher, only: [:index, :show_activity_classes]
  before_action :set_activity, only: [:show_activity_classes]


  # GET /activities
  # GET /activities.json
  def index
    @activities = Activity.all.order( :name )
  end

  def show_activity_classes
    @activity_classes = @activity.activity_classes.order( :started_at )
    @completed = @activity_classes.attendance_completed
    @incompleted = @activity_classes.attendance_incompleted.starts_before( DateTime.current ).group('activity_classes.id')
    @pending = @activity_classes.attendance_incompleted.ends_after( DateTime.current ).group('activity_classes.id')
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_teacher
    @teacher = Teacher.find( params[ :teacher_id ] )
  end

  def set_activity
    @activity = Activity.find( params[ :id ] )
  end
end
