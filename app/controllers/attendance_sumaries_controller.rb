class AttendanceSumariesController < ApplicationController
  before_action :authenticate_user!
  #before_action :set_attendance_sumary, only: [:show, :edit, :update, :destroy]

  # GET /attendance_sumaries
  # GET /attendance_sumaries.json
  def index
    @attendance_sumaries = AttendanceSumary.all
  end

  # GET /database_exploitations/get_attendance_summary
  def get_attendance_summary
    @database_exploitation = DatabaseExploitation.new
  end


  # POST /database_exploitations/attendance_summary
  def attendance_summary
    @database_exploitation = DatabaseExploitation.new(database_exploitation_params)

    if @database_exploitation.save
      format.axlsx { render format: :axlsx,  @database_exploitation. }
    else
      format.html { render :get_attendance_summary }
    end

  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def database_exploitation_params
    params.require( :database_exploitation ).permit( :period_started_at, :period_ended_at )
  end
end
