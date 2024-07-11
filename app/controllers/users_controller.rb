class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :check_user_status, only: [:create]
  load_and_authorize_resource


  # GET /users or /users.json
  # def index
  #   @users = User.all
  #   # @event.update_status_if_expired
  # end
  def index
    if params[:role_id].present?
      @users = User.where(role_id: params[:role_id])
    else
      @users = User.all
    end
  end

  # GET /users/1 or /users/1.json
  def show
    @event = Event.find(params[:id])
    @event.update_status_if_expired
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit

  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def check_user_status
    user = User.find_by(email: params[:user][:email])

    if user && user.status == 0
      sign_out user # Ensure user is signed out if already signed in
      redirect_to new_user_session_path, alert: "Your account has been banned. Please contact support."
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  # def update
  #   respond_to do |format|
  #     if @user.update(user_params)
  #       format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
  #       format.json { render :show, status: :ok, location: @user }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    if @user.update(user_params)
      redirect_to root_path, notice: "User was successfully updated."
    else
      render :edit
    end
  end


  def ban
    @user = User.find(params[:id])
    @user.update(status: 0)

    respond_to do |format|
      format.html { redirect_to users_list_url, notice: 'User was successfully banned.' }
      format.json { head :no_content }
    end
  end

  def unban
    @user = User.find(params[:id])
    @user.update(status: 1)

    respond_to do |format|
      format.html { redirect_to users_list_url, notice: 'User was successfully banned.' }
      format.json { head :no_content }
    end
  end

  def toadmin
    @user = User.find(params[:id])
    @user.update(role_id: 1)

    respond_to do |format|
      format.html { redirect_to users_list_url, notice: 'User was successfully authorize to admin.' }
      format.json { head :no_content }
    end
  end
  def toguest
    @user = User.find(params[:id])
    @user.update(role_id: 2)

    respond_to do |format|
      format.html { redirect_to users_list_url, notice: 'User was successfully authorize to guest.' }
      format.json { head :no_content }
    end
  end
  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def destroy
  #   sign_out(current_user) if user_signed_in?
  #   redirect_to root_path, notice: 'Đã đăng xuất thành công.'
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      # @user = User.find(params[:id])
      @user = current_user
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.fetch(:user, {})
      params.require(:user).permit(:name, :phone, :company, :birthday, :gender)
    end
end
