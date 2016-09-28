class TeacherActivitiesController < ApplicationController
  before_action :set_teacher_activity, only: [:show, :edit, :update, :destroy]

  # GET /teacher_activities
  # GET /teacher_activities.json
  def index
    @teacher_activities = TeacherActivity.all
  end

  # GET /teacher_activities/1
  # GET /teacher_activities/1.json
  def show
  end

  # GET /teacher_activities/new
  def new
    @teacher_activity = TeacherActivity.new
  end

  # GET /teacher_activities/1/edit
  def edit
  end

  # POST /teacher_activities
  # POST /teacher_activities.json
  def create
    @teacher_activity = TeacherActivity.new(teacher_activity_params)

    respond_to do |format|
      if @teacher_activity.save
        format.html { redirect_to @teacher_activity, notice: 'Teacher activity was successfully created.' }
        format.json { render :show, status: :created, location: @teacher_activity }
      else
        format.html { render :new }
        format.json { render json: @teacher_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teacher_activities/1
  # PATCH/PUT /teacher_activities/1.json
  def update
    respond_to do |format|
      if @teacher_activity.update(teacher_activity_params)
        format.html { redirect_to @teacher_activity, notice: 'Teacher activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @teacher_activity }
      else
        format.html { render :edit }
        format.json { render json: @teacher_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teacher_activities/1
  # DELETE /teacher_activities/1.json
  def destroy
    @teacher_activity.destroy
    respond_to do |format|
      format.html { redirect_to teacher_activities_url, notice: 'Teacher activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher_activity
      @teacher_activity = TeacherActivity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_activity_params
      params.require(:teacher_activity).permit(:attendance_management, :collection_management)
    end
end
