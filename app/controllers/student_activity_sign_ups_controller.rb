class StudentActivitySignUpsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_student_activity_sign_up, only: [:show, :edit, :update, :destroy]
  before_action :set_select_collections, only: [:edit, :new, :update, :create]


  # GET /student_activity_sign_ups
  # GET /student_activity_sign_ups.json
  def index
    @student_activity_sign_ups = StudentActivitySignUp.all
  end

  # GET /student_activity_sign_ups/1
  # GET /student_activity_sign_ups/1.json
  def show
  end

  # GET /student_activity_sign_ups/new
  def new
    @student_activity_sign_up = StudentActivitySignUp.new
  end

  # GET /student_activity_sign_ups/1/edit
  def edit
  end

  # POST /student_activity_sign_ups
  # POST /student_activity_sign_ups.json
  def create
    @student_activity_sign_up = StudentActivitySignUp.new(student_activity_sign_up_params)

    respond_to do |format|
      if @student_activity_sign_up.save
        format.html { redirect_to @student_activity_sign_up, notice: 'Student activity sign up was successfully created.' }
        format.json { render :show, status: :created, location: @student_activity_sign_up }
      else
        add_model_error_to_flash @student_activity_sign_up
        format.html { render :new }
        format.json { render json: @student_activity_sign_up.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_activity_sign_ups/1
  # PATCH/PUT /student_activity_sign_ups/1.json
  def update
    respond_to do |format|
      if @student_activity_sign_up.update(student_activity_sign_up_params)
        format.html { redirect_to @student_activity_sign_up, notice: 'Student activity sign up was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_activity_sign_up }
      else
        add_model_error_to_flash @student_activity_sign_up
        format.html { render :edit }
        format.json { render json: @student_activity_sign_up.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_activity_sign_ups/1
  # DELETE /student_activity_sign_ups/1.json
  def destroy
    @student_activity_sign_up.destroy
    respond_to do |format|
      format.html { redirect_to student_activity_sign_ups_url, notice: 'Student activity sign up was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_activity_sign_up
      @student_activity_sign_up = StudentActivitySignUp.find(params[:id])
    end

  def set_select_collections
    @students = Student.all
    @activities = Activity.all
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_activity_sign_up_params
      params.require(:student_activity_sign_up).permit( :activity_id, :student_id, :started_at, :ended_at, :activity_discount, :payment_type)
    end
end
