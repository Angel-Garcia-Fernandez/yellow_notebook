class AttendanceSummariesController < ApplicationController
  before_action :authenticate_user!
  #before_action :set_attendance_summary, only: [:show, :edit, :update, :destroy]


  # GET /database_exploitations/get_attendance_summary
  def new
    @attendance_summary = AttendanceSummary.new
  end


  # POST /database_exploitations/attendance_summary
  def create
    respond_to do |format|

      @attendance_summary = AttendanceSummary.new( attendance_summary_params )

      if @attendance_summary.valid?
        @attendance_sum = @attendance_summary.in_period.group_for_attendance_sum#.eager_load( :activity, :school, :student )
        format.xlsx { render xlsx: 'show' } #, filename: I18n.t( '.bookname', time: I18n.l( DateTime.current ) }
      else
        add_model_error_to_flash @attendance_summary
        format.html { render :new }
      end
    end
  end


  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def attendance_summary_params
    params.require( :attendance_summary ).permit( :period_started_at, :period_ended_at )
  end
end
