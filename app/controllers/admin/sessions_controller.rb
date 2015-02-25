class Admin::SessionsController < ApplicationController

  def new
    @page = {:title => 'Administration Login', :head_title => 'Administration Login'}
  end
  
  def create
    @page = {:title => 'Administration Login', :head_title => 'Administration Login'}
    user = User.authenticate(params[:email], params[:password])
    if user && user.enabled == true
      session[:user_id] = user.id
      redirect_to admin_path, :notice => "You have successfully logged in."
    elsif user.enabled == false
      flash.now.alert = "Your account is disabled"
      render "new"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to admin_log_in_path, :notice => "You have successfully logged out."
  end

end