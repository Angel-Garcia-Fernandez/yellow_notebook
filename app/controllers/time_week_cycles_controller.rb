class TimeWeekCyclesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_time_week_cycle, only: [:show, :edit, :update, :destroy]

  # GET /time_week_cycles
  # GET /time_week_cycles.json
  def index
    @time_week_cycles = TimeWeekCycle.all
  end

  # GET /time_week_cycles/1
  # GET /time_week_cycles/1.json
  def show
  end

  # GET /time_week_cycles/new
  def new
    @time_week_cycle = TimeWeekCycle.new
  end

  # GET /time_week_cycles/1/edit
  def edit
  end

  # POST /time_week_cycles
  # POST /time_week_cycles.json
  def create
    @time_week_cycle = TimeWeekCycle.new(time_week_cycle_params)

    respond_to do |format|
      if @time_week_cycle.save
        format.html { redirect_to @time_week_cycle, notice: 'Time week cycle was successfully created.' }
        format.json { render :show, status: :created, location: @time_week_cycle }
      else
        format.html { render :new }
        format.json { render json: @time_week_cycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_week_cycles/1
  # PATCH/PUT /time_week_cycles/1.json
  def update
    respond_to do |format|
      if @time_week_cycle.update(time_week_cycle_params)
        format.html { redirect_to @time_week_cycle, notice: 'Time week cycle was successfully updated.' }
        format.json { render :show, status: :ok, location: @time_week_cycle }
      else
        format.html { render :edit }
        format.json { render json: @time_week_cycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_week_cycles/1
  # DELETE /time_week_cycles/1.json
  def destroy
    @time_week_cycle.destroy
    respond_to do |format|
      format.html { redirect_to time_week_cycles_url, notice: 'Time week cycle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_week_cycle
      @time_week_cycle = TimeWeekCycle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def time_week_cycle_params
      params.require(:time_week_cycle).permit(:period_started_at, :period_ended_at, :activity_started_at, :activity_ended_at)
    end
end
