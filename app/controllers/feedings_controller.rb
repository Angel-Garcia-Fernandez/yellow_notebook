class FeedingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_xls_file
  before_action :set_parse

  # POST /parses
  # POST /parses.json
  def create
    FeedingDomain.feed @parse

    respond_to do |format|
      if @parse.save
        format.html { redirect_to xls_file_parse_path( @xls_file, @parse ), notice: 'FeedingProcess was successfully created.' }
        format.json { render xls_file_parse_path( @parse.xls_file, @parse ), status: :updated, location: @parse }
      else
        add_model_error_to_flash @parse
        format.html { redirect_to xls_file_parse_path( @xls_file, @parse ) }
        format.json { render json: @parse.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_parse
    @parse = Parse.find(params[:parse_id])
  end

  def set_xls_file
    @xls_file = XlsFile.find params[ :xls_file_id ]
  end
end
