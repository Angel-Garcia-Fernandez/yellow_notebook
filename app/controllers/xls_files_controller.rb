class XlsFilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_xls_file, only: [:download, :show, :edit, :update, :destroy]
  before_action :set_xls_files, only: [:index]

  # GET /xls_files
  # GET /xls_files.json
  def index
  end

  # GET /xls_files/1
  # GET /xls_files/1.json
  def show
  end

  # GET /xls_files/new
  def new
    @xls_file = XlsFile.new
  end

  # GET /xls_files/1/edit
  def edit
  end

  # POST /xls_files
  # POST /xls_files.json
  def create
    @xls_file = XlsFile.new(xls_file_params)

    respond_to do |format|
      if @xls_file.save
        format.html { redirect_to @xls_file, notice: 'Xls file was successfully created.' }
        format.json { render :show, status: :created, location: @xls_file }
      else
        add_model_error_to_flash @xls_file
        format.html { render :new }
        format.json { render json: @xls_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /xls_files/1
  # PATCH/PUT /xls_files/1.json
  def update
    respond_to do |format|
      if @xls_file.update(xls_file_params)
        format.html { redirect_to @xls_file, notice: 'Xls file was successfully updated.' }
        format.json { render :show, status: :ok, location: @xls_file }
      else
        add_model_error_to_flash @xls_file
        format.html { render :edit }
        format.json { render json: @xls_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /xls_files/1
  # DELETE /xls_files/1.json
  def destroy
    @xls_file.destroy
    respond_to do |format|
      format.html { redirect_to xls_files_url, notice: 'Xls file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def download
    send_file @xls_file.file.path,
              filename: @xls_file.file_file_name,
              type: @xls_file.file_content_type,
              disposition: 'attachment'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_xls_file
    @xls_file = XlsFile.find(params[:id])
  end

  def set_xls_files
    @xls_files = XlsFile.all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def xls_file_params
    params.require(:xls_file).permit( :file )
  end
end
