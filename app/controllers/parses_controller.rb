class ParsesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_xls_file
  before_action :set_parse, only: [:show, :edit, :update, :destroy]
  before_action :set_parses, only: :index
  before_action :set_form_collections, only: [:edit, :new]

  # GET /parses
  # GET /parses.json
  def index
  end

  # GET /parses/1
  # GET /parses/1.json
  def show
  end

  # GET /parses/new
  def new
    @parse = @xls_file.parses.build
  end

  # GET /parses/1/edit
  def edit
  end

  # POST /parses
  # POST /parses.json
  def create
    @parse = @xls_file.parses.build(parse_params)
    @parse.status = :initial

    respond_to do |format|
      if @parse.save
        format.html { redirect_to [@xls_file, @parse], notice: 'Parse was successfully created.' }
        format.json { render :show, status: :created, location: @parse }
      else
        add_model_error_to_flash @parse
        format.html { set_form_collections; render :new }
        format.json { render json: @parse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parses/1
  # PATCH/PUT /parses/1.json
  def update
    respond_to do |format|
      if @parse.update(parse_params)
        format.html { redirect_to [@xls_file, @parse], notice: 'Parse was successfully updated.' }
        format.json { render json: @parse, status: :ok, location: @parse }
      else
        add_model_error_to_flash @parse
        format.html { set_form_collections; render :edit }
        format.json { render json: @parse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parses/1
  # DELETE /parses/1.json
  def destroy
    @parse.destroy
    respond_to do |format|
      format.html { redirect_to xls_file_parses_url(@xls_file), notice: 'Parse was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_parse
    @parse = Parse.find(params[:id])
  end

  def set_parses
    @parses = @xls_file.parses
  end

  def set_xls_file
    @xls_file = XlsFile.find( params[:xls_file_id] )
  end

  def set_form_collections
    @courses = Course.all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def parse_params
    params.require(:parse).permit( :course_id )
  end
end
