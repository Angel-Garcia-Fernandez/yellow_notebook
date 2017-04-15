class ReFeedingsController < ApplicationController
  before_action :authenticate_user!
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
        format.html { redirect_to redirect_to xls_file_parse_path( @xls_file, @parse ) }
        format.json { render json: @parse.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_parse
    @orig_parse = Parse.find(params[:parse_id])
    @parse = Parse.new course: @orig_parse.course, xls_file: @orig_parse.xls_file
  end

end
