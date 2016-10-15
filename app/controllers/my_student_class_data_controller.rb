class MyStudentClassDataController < ApplicationController
  before_action :authenticate_user!
  before_action :set_teacher, only: [:edit, :show, :update, :destroy]
  before_action :set_activity_class, only: [:edit, :show, :update, :destroy]
  before_action :set_student_class_datum, only: [:edit, :show, :update, :destroy]


  # GET /student_class_data/1
  # GET /student_class_data/1.json
  def show
  end

  # GET /student_class_data/1/edit
  def edit
  end

  # PATCH/PUT /student_class_data/1
  # PATCH/PUT /student_class_data/1.json
  def update
    respond_to do |format|
      if @student_class_datum.update(student_class_datum_params)
        format.html { redirect_to [ @teacher, @student_class_datum ], notice: 'Student class datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_class_datum }
      else
        format.html { render :edit }
        format.json { render json: @student_class_datum.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /student_class_data/1
  # DELETE /student_class_data/1.json
  def destroy
    @student_class_datum.destroy
    respond_to do |format|
      format.html { redirect_to show_student_class_data_teacher_activity_class_path( @teacher, @activity_class ), notice: 'Student class datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_teacher
    @teacher = Teacher.find( params[ :teacher_id ] )
  end

  def set_activity_class
    @activity_class = ActivityClass.find( params[ :activity_class_id ] )
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_student_class_datum
    @student_class_datum = StudentClassDatum.find(params[:id])
  end

  def set_collection_for_select
    @student_activity_sign_ups = StudentActivitySignUp.signed_for( @activity_class.activity, @activity_class.started_at )
    @activity_classes = @teacher.activity_classes
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def student_class_datum_params
    params.require(:student_class_datum).permit(:student_activity_sign_up_id, :activity_class_id, :attended, :paid)
  end

end
