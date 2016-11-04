class StudentClassDataController < ApplicationController
  before_action :authenticate_user!
  before_action :set_activity, only: [:index, :show, :edit, :update, :destroy]# :new, :create,
  before_action :set_activity_class, only: [:index, :show, :edit, :update, :destroy]# :new, :create,
  before_action :set_student_class_datum, only: [:show, :edit, :update, :destroy]

  # GET /student_class_data
  # GET /student_class_data.json
  def index
    @student_class_data = @activity_class.student_class_data.joins( :student ).merge( Student.order( :surname ) )
  end

  # GET /student_class_data/1
  # GET /student_class_data/1.json
  def show
  end

  # GET /student_class_data/new
  # def new
  #   @student_class_datum = StudentClassDatum.new
  # end

  # GET /student_class_data/1/edit
  def edit
  end

  # POST /student_class_data
  # POST /student_class_data.json
  # def create
  #   @student_class_datum = StudentClassDatum.new(student_class_datum_params)
  #
  #   respond_to do |format|
  #     if @student_class_datum.save
  #       format.html { redirect_to activity_activity_class_student_class_data_path( @activity, @activity_class), notice: 'Student class datum was successfully created.' }
  #       format.json { render :show, status: :created, location: @student_class_datum }
  #     else
  #       add_model_error_to_flash @student_class_datum
  #       format.html { render :new }
  #       format.json { render json: @student_class_datum.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /student_class_data/1
  # PATCH/PUT /student_class_data/1.json
  def update
    respond_to do |format|
      if @student_class_datum.update(student_class_datum_params)
        format.html { redirect_to activity_activity_class_student_class_data_path( @activity, @activity_class), notice: 'Student class datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_class_datum }
      else
        add_model_error_to_flash @student_class_datum
        format.html { render :edit }
        format.json { render json: @student_class_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_class_data/1
  # DELETE /student_class_data/1.json
  def destroy
    @student_class_datum.destroy
    @activity_class.save #esto es para que vuelvan a salir los que tienen que salir, y sólo borrar los duplicados.
    respond_to do |format|
      format.html { redirect_to activity_activity_class_student_class_data_path( @activity, @activity_class), notice: 'Student class datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_activity
    @activity = Activity.find( params[:activity_id] )
  end

  def set_activity_class
    @activity_class = ActivityClass.find( params[:activity_class_id] )
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_student_class_datum
      @student_class_datum = StudentClassDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_class_datum_params
      params.require(:student_class_datum).permit(:attended, :paid)
    end
end
