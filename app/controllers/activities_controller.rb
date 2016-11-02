class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_activity, only: [:show, :show_students, :show_time_week_cycles, :show_activity_classes,
                                      :edit, :edit_students, :edit_time_week_cycles, :edit_activity_classes,
                                      :create_activity_classes,
                                      :update, :update_students, :update_time_week_cycles, :update_activity_classes,
                                      :destroy]
  before_action :set_activity_class, only: :destroy_activity_class
  before_action :new_activity, only: :new
  before_action :set_select_collections, only: [:edit, :new, :update, :create]
  before_action :set_select_collections_students, only: [ :edit_students, :update_students ]
  before_action :set_select_collections_time_week_cycles, only: [ :edit_time_week_cycles, :update_time_week_cycles ]
  before_action :set_select_collections_activity_classes, only: [ :edit_activity_classes, :update_activity_classes ]


  # GET /activities
  # GET /activities.json
  def index
    @activities = Activity.all.order( :name )
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
  end

  # GET /activities/1/show_students
  def show_students
    @students = @activity.student_activity_sign_ups.joins( :student ).merge( Student.order( :surname ) )
  end

  def show_time_week_cycles
  end

  def show_activity_classes
    @activity_classes = @activity.activity_classes.order started_at: :desc
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

  def edit_time_week_cycles
  end

  def edit_activity_classes
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

  def create_activity_classes
    if @activity.create_classes_from_time_week_cycles
      redirect_to @activity, notice: 'Activity was successfully created.'
    else
      add_model_error_to_flash @activity
      render :show
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

  def update_time_week_cycles
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { render :show_time_week_cycles, status: :ok, location: @activity }
      else
        add_model_error_to_flash @activity
        format.html { render :edit_time_week_cycles }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_activity_classes
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { render :show_activity_classes, status: :ok, location: @activity }
      else
        add_model_error_to_flash @activity
        format.html { render :edit_activity_classes }
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

  def destroy_activity_class
    @activity_class.destroy
    respond_to do |format|
      format.html { redirect_to show_activity_classes_activity_url( @activity ), notice: 'Activity Class was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_activity
    @activity = Activity.find(params[:id])
  end

  def set_activity_class
    @activity = Activity.find( params[:activity_id] )
    @activity_class = @activity.activity_classes.find( params[:id])
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

  def set_select_collections_time_week_cycles
  end

  def set_select_collections_activity_classes
  end

  # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit( :name, :classification, :started_at, :ended_at, :default_price, :details, :school_id,
                                        student_activity_sign_ups_attributes: [ :id, :_destroy, :student_id,
                                                                                :started_at, :ended_at,
                                                                                :activity_discount, :payment_type ],
                                        teacher_activities_attributes: [ :id, :_destroy, :teacher_id, :attendance_management,
                                                                         :collection_management, :teacher_in_charge ],
                                        time_week_cycles_attributes: [ :id, :_destroy, :activity_class_starts_at, :activity_class_ends_at,
                                                                       :period_started_at, :period_ended_at, :week_day ],
                                        activity_classes_attributes: [ :id, :_destroy, :started_at, :ended_at ] )
    end
end
