class SchoolRepresentativesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_school_representative, only: [:show, :edit, :update, :destroy]

  # GET /school_representatives
  # GET /school_representatives.json
  def index
    @school_representatives = SchoolRepresentative.all
  end

  # GET /school_representatives/1
  # GET /school_representatives/1.json
  def show
  end

  # GET /school_representatives/new
  def new
    @school_representative = SchoolRepresentative.new
  end

  # GET /school_representatives/1/edit
  def edit
  end

  # POST /school_representatives
  # POST /school_representatives.json
  def create
    @school_representative = SchoolRepresentative.new(school_representative_params)

    respond_to do |format|
      if @school_representative.save
        format.html { redirect_to @school_representative, notice: 'School representative was successfully created.' }
        format.json { render :show, status: :created, location: @school_representative }
      else
        format.html { render :new }
        format.json { render json: @school_representative.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /school_representatives/1
  # PATCH/PUT /school_representatives/1.json
  def update
    respond_to do |format|
      if @school_representative.update(school_representative_params)
        format.html { redirect_to @school_representative, notice: 'School representative was successfully updated.' }
        format.json { render :show, status: :ok, location: @school_representative }
      else
        format.html { render :edit }
        format.json { render json: @school_representative.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /school_representatives/1
  # DELETE /school_representatives/1.json
  def destroy
    @school_representative.destroy
    respond_to do |format|
      format.html { redirect_to school_representatives_url, notice: 'School representative was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_representative
      @school_representative = SchoolRepresentative.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_representative_params
      params.require(:school_representative).permit(:name, :position, :details)
    end
end
