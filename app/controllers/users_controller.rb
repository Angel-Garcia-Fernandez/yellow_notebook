class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [ :edit, :edit_password, :edit_teacher_user, :update, :destroy]
  before_action :set_select_collections, only: [:edit, :new, :update, :create]


  # GET /users
  # GET /users.json
  def index
    @users = User.all.order( :login ).page(params[:page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
    @user.teacher_user || @user.build_teacher_user
  end

  # GET /users/1/edit
  def edit
    render :edit
  end

  # GET /users/1/edit_password
  def edit_password
    render :edit_password
  end

  def edit_teacher_user
    render :edit_teacher_user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        add_model_error_to_flash @user
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    # if params[:user][:password].blank?
    #   params[:user].delete(:password)
    #   params[:user].delete(:password_confirmation)
    # end

    respond_to do |format|
      if @user.update(user_params)
        if params[:user][:password].present?
          if current_user == @user
            bypass_sign_in @user
          else

          end
        end
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        add_model_error_to_flash @user
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
    @user.teacher_user || @user.build_teacher_user
  end

  def set_select_collections
    @teachers = Teacher.all
  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:login, :email, :password, :password_confirmation, :role, teacher_user_attributes: :teacher_id )
  end
end
