class Admin::HomeController < ApplicationController
  before_filter :require_authorization
  
  def index
    @page = {:title => 'Site Administration', :head_title => 'Admin'}
  end
  
  private
  def require_authorization
    redirect_to admin_log_in_path, :notice => "You must be logged in for access." unless session[:user_id]
  end
end