class TeachersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_teacher, only: [ :edit, :update, :destroy]
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
      @teacher.teacher_user || @teacher.build_teacher_user
    end

  def set_select_collections
    @users = User.all
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_params
      params.require(:teacher).permit(:photo, :name, :surname, :default_attendance_management, :default_collection_management, :details, teacher_user_attributes: :user_id )
    end
end
