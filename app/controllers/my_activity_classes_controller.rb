class MyActivityClassesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_activity_class, only: [:show, :show_student_class_data, :edit, :edit_student_class_data, :update, :update_student_class_data, :add_all_student_to_class, :destroy]
  before_action :set_teacher, only: [:index, :new, :show, :show_student_class_data, :edit, :edit_student_class_data, :create, :update, :update_student_class_data, :add_all_student_to_class, :destroy]
  before_action :set_select_collections, only: [:edit, :new, :update, :create]
  before_action :set_select_collections_student_class_data, only: [ :edit_student_class_data, :update_student_class_data]


  # GET /activity_classes
  # GET /activity_classes.json
  def index
    @activity_classes = ActivityClass.all
  end

  # GET /activity_classes/1
  # GET /activity_classes/1.json
  def show
  end

  def show_student_class_data

  end

  # GET /activity_classes/new
  def new
    @activity_class = ActivityClass.new
  end

  # GET /activity_classes/1/edit
  def edit
  end

  def edit_student_class_data
    puts "hola"
    puts "hola"
  end

  # POST /activity_classes
  # POST /activity_classes.json
  def create
    @activity_class = ActivityClass.new(activity_class_params)

    respond_to do |format|
      if @activity_class.save
        format.html { redirect_to [@teacher, @activity_class], notice: 'Activity class was successfully created.' }
        format.json { render :show, status: :created, location: @activity_class }
      else
        add_model_error_to_flash @activity_class
        format.html { render :new }
        format.json { render json: @activity_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activity_classes/1
  # PATCH/PUT /activity_classes/1.json
  def update
    respond_to do |format|
      if @activity_class.update(activity_class_params)
        format.html { redirect_to [@teacher, @activity_class], notice: 'Activity class was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity_class }
      else
        add_model_error_to_flash @activity_class
        format.html { render :edit }
        format.json { render json: @activity_class.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_student_class_data
    respond_to do |format|
      if @activity_class.update(activity_class_params)
        format.html { redirect_to [@teacher, @activity_class], notice: 'Activity class was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity_class }
      else
        add_model_error_to_flash @activity_class
        format.html { render :edit }
        format.json { render json: @activity_class.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_all_student_to_class

  end

  # DELETE /activity_classes/1
  # DELETE /activity_classes/1.json
  def destroy
    @activity_class.destroy
    respond_to do |format|
      format.html { redirect_to teacher_activity_classes_path( @teacher ), notice: 'Activity class was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_teacher
    @teacher = Teacher.find( params[:teacher_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_activity_class
    #@teacher.activities.find_by id: params[:id] #si este nil, se dice que pelo
    @activity_class = ActivityClass.find(params[:id])
  end

  def set_select_collections
    @activities = @teacher.activities
  end

  def set_select_collections_student_class_data
    @activity_class.destroy
    respond_to do |format|
      format.html { redirect_to teacher_activity_classes_path( @teacher ), notice: 'Activity class was successfully destroyed.' }
      format.json { head :no_content }
      end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def activity_class_params
    params.require(:activity_class).permit(:activity_id, :started_at, :ended_at,
                                           student_class_data_attributes: [ ] )
  end
end
