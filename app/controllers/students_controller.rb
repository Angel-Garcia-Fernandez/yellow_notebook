class StudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_student, only: [:show, :show_activities, :edit, :edit_activities, :update, :update_activities, :destroy]
  before_action :set_select_collections, only: [:edit, :new, :update, :create]
  before_action :set_select_collections_activities, only: [ :edit_activities, :update_activities ]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/1/show_activities
  def show_activities
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # GET /students/1/edit_activities
  def edit_activities
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        add_model_error_to_flash @student
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        add_model_error_to_flash @student
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1/activities
  def update_activities
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to show_activities_student_path(@student), notice: 'Student was successfully updated.' }
        format.json { render :show_activities, status: :ok, location: @student }
      else
        add_model_error_to_flash @student
        format.html { render :edit_activities }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

  def set_select_collections
    @schools = School.all
  end

  def set_select_collections_activities
    @activities = Activity.all
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:nic, :name, :surname, :default_discount, :default_payment_type,
                                      :scholar_phone_number, :phone_number, :address, :town, :province, :zip_code,
                                      :details, :iban, :account_holder,
                                      student_activity_sign_ups_attributes: [ :id, :_destroy, :activity_id,
                                                                              :started_at, :ended_at,
                                                                              :activity_discount, :payment_type ] )
    end
end
