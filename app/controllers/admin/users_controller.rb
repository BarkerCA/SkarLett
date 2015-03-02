class Admin::UsersController < ApplicationController
  before_filter :require_authorization, only: [:index, :show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @page = {:title => 'Users Listing', :head_title => 'Users Listing'}
    @users = User.all
  end

  # GET /nuggets/1
  # GET /nuggets/1.json
  def show
    @page = {:title => 'Display User', :head_title => 'Display User'}
  end

  def new
    @page = {:title => 'Add A User', :head_title => 'Add A User'}
    @user = User.new
  end
  
  # GET /users/1/edit
  def edit
  end
  
  def create
    new_user = user_params
    if user_params[:email] == ENV['ADMIN_EMAIL']
      new_user[:enabled] = true
    else
      new_user[:enabled] = false
    end
    
    @user = User.new(new_user)

    if @user.save
      redirect_to admin_users_path, :notice => "New user created."
    else
      render "new"
    end

  end
  
  # PATCH/PUT /nuggets/1
  # PATCH/PUT /nuggets/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_users_url, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /nuggets/1
  # DELETE /nuggets/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :enabled)
  end
    
  def require_authorization
    redirect_to admin_log_in_path, :notice => "You must be logged in for access." unless session[:user_id]
  end
  
end