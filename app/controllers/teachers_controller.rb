class TeachersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_teacher, only: [ :show, :edit, :edit_activities, :update, :update_activities, :destroy]
  before_action :construct_teacher_user, only: [:show, :edit, :update]
  before_action :set_select_collections_activities, only: [ :edit_activities, :update_activities]
  before_action :set_select_collections, only: [:edit, :new, :update, :create]


  # GET /teachers
  # GET /teachers.json
  def index
    @teachers = Teacher.all
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
    @teacher = Teacher.find( params[:id] )
  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new
    @teacher.teacher_user || @teacher.build_teacher_user
  end

  # GET /teachers/1/edit
  def edit
  end

  # GET /teachers/1/edit_acctivities
  def edit_activities
  end

  # POST /teachers
  # POST /teachers.json
  def create
    @teacher = Teacher.new(teacher_params)

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to @teacher, notice: 'Teacher was successfully created.' }
        format.json { render :show, status: :created, location: @teacher }
      else
        add_model_error_to_flash @teacher
        format.html { render :new }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers/1
  # PATCH/PUT /teachers/1.json
  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to @teacher, notice: 'Teacher was successfully updated.' }
        format.json { render :show, status: :ok, location: @teacher }
      else
        add_model_error_to_flash @teacher
        format.html { render :edit }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers/1
  # PATCH/PUT /teachers/1.json
  def update_activities
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to @teacher, notice: 'Teacher was successfully updated.' }
        format.json { render :show, status: :ok, location: @teacher }
      else
        add_model_error_to_flash @teacher
        format.html { render :edit_activities }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: 'Teacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def set_select_collections
    @users = User.all
  end

  def set_select_collections_activities
    @activities = Activity.all
  end

  def construct_teacher_user
    @teacher.teacher_user || @teacher.build_teacher_user
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def teacher_params
    params.require(:teacher).permit(:photo, :name, :surname, :work_email, :nic, :mobile_phone_number, :phone_number, :address,
                                    :town, :province, :zip_code, :iban, :default_collection_management, :default_attendance_management,
                                    :studies, :details,
                                    teacher_user_attributes: :user_id,
                                    teacher_activities_attributes: [ :id, :_destroy, :activity_id, :attendance_management, :collection_management,
                                                                     :teacher_in_charge ] )
  end
end
