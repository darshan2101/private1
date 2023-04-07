class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  # before_action :set_user, only: %i[download]

  # GET /users or /users.json
  def index

    @q = User.ransack(params[:q])
    @users = @q.result.page(params[:page])
    respond_to do |format|
      format.html
      format.pdf do

        render pdf: "Users: #{@users.count}", # filename
               template: "users/index",
               formats: [:html],
               disposition: 'attachment',
               layout: 'pdf'
      end
    end
  end

  # GET /users/1 or /users/1.json
  def show
    @joined_on = @user.created_at.to_formatted_s(:short)

    if @user.current_sign_in_at
      @last_login = @user.current_sign_in_at.to_formatted_s(:short)
    else
      @last_login = 'never'
    end
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "User:#{@user.id}",
               template: "users/download",
               formats: [:html],
               disposition: 'attachment',
               layout: 'pdf'
      end
    end
    
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
        ReportJob.perform_in( 1.minutes.from_now,@user.id)
        # AdminMailer.with(user: @user).pdf_profile.deliver_later(wait: 30.seconds)

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end

    successfully_updated = if needs_password?(@user, user_params)
                             @user.update(user_params)
                           else
                             @user.update_without_password(user_params)
                           end

    if successfully_updated
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def download
    @user = User.find(params[:id])
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def needs_password?(_user, params)
      params[:password].present?
    end
    
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:role_id,:user_id,:fName, :password,:password_confirmation,
        :lName,:contact,:dateOfBirth,:gender,:email,
        :expertise_ids => [],
        :addresses_attributes => %i[ id country state city local pincode _destroy])
    end
end
