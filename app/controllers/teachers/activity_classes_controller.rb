class Teachers::ActivityClassesController < TeachersControllerController
  before_action :authenticate_user!
  before_action :set_activity_class, only: [:show, :edit, :update, :destroy]

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

  end

  # POST /activity_classes
  # POST /activity_classes.json
  def create
    @activity_class = ActivityClass.new(activity_class_params)

    respond_to do |format|
      if @activity_class.save
        format.html { redirect_to @activity_class, notice: 'Activity class was successfully created.' }
        format.json { render :show, status: :created, location: @activity_class }
      else
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
        format.html { redirect_to @activity_class, notice: 'Activity class was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity_class }
      else
        format.html { render :edit }
        format.json { render json: @activity_class.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_student_class_data
    respond_to do |format|
      if @activity_class.update(activity_class_params)
        format.html { redirect_to @activity_class, notice: 'Activity class was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity_class }
      else
        format.html { render :edit }
        format.json { render json: @activity_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_classes/1
  # DELETE /activity_classes/1.json
  def destroy
    @activity_class.destroy
    respond_to do |format|
      format.html { redirect_to activity_classes_url, notice: 'Activity class was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity_class
      @activity_class = ActivityClass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_class_params
      params.require(:activity_class).permit(:started_at, :ended_at)
    end
end
