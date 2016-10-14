class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_activity, only: [:show, :show_students, :edit, :edit_students, :update, :update_students, :destroy]
  before_action :new_activity, only: :new
  before_action :set_select_collections, only: [:edit, :new, :update, :create]
  before_action :set_select_collections_students, only: [ :edit_students, :update_students ]


  # GET /activities
  # GET /activities.json
  def index
    @activities = Activity.all
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
  end

  # GET /activities/1/show_students
  def show_students
  end

  # GET /activities/new
  def new
  end

  # GET /activities/1/edit
  def edit
  end

  # GET /teachers/1/edit_students
  def edit_students
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = Activity.new(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: 'Activity was successfully created.' }
        format.json { render :show, status: :created, location: @activity }
      else
        add_model_error_to_flash @activity
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        add_model_error_to_flash @activity
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1
  def update_students
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { render :show_students, status: :ok, location: @activity }
      else
        add_model_error_to_flash @activity
        format.html { render :edit_students }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

  def new_activity
    @activity = Activity.new
  end

  def set_select_collections
    @schools = School.all
    @teachers = Teacher.all
  end

  def set_select_collections_students
    @students = Student.all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit( :name, :classification, :started_at, :ended_at, :default_price, :details, :school_id,
                                        student_activity_sign_ups_attributes: [ :id, :_destroy, :student_id,
                                                                                :started_at, :ended_at,
                                                                                :activity_discount, :payment_type ],
                                        teacher_activities_attributes: [ :id, :_destroy, :teacher_id, :attendance_management, :collection_management, :teacher_in_charge ])
    end
end
