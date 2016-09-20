class StudentClassDataController < ApplicationController
  before_action :set_student_class_datum, only: [:show, :edit, :update, :destroy]

  # GET /student_class_data
  # GET /student_class_data.json
  def index
    @student_class_data = StudentClassDatum.all
  end

  # GET /student_class_data/1
  # GET /student_class_data/1.json
  def show
  end

  # GET /student_class_data/new
  def new
    @student_class_datum = StudentClassDatum.new
  end

  # GET /student_class_data/1/edit
  def edit
  end

  # POST /student_class_data
  # POST /student_class_data.json
  def create
    @student_class_datum = StudentClassDatum.new(student_class_datum_params)

    respond_to do |format|
      if @student_class_datum.save
        format.html { redirect_to @student_class_datum, notice: 'Student class datum was successfully created.' }
        format.json { render :show, status: :created, location: @student_class_datum }
      else
        format.html { render :new }
        format.json { render json: @student_class_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_class_data/1
  # PATCH/PUT /student_class_data/1.json
  def update
    respond_to do |format|
      if @student_class_datum.update(student_class_datum_params)
        format.html { redirect_to @student_class_datum, notice: 'Student class datum was successfully updated.' }
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
      format.html { redirect_to student_class_data_url, notice: 'Student class datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_class_datum
      @student_class_datum = StudentClassDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_class_datum_params
      params.require(:student_class_datum).permit(:attended, :paid)
    end
end
