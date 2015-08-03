class Admin::TrainingController < ApplicationController
  before_filter :require_authorization, only: [:index, :holy_spirit]

  def index
    @page = {:title => 'Training', :head_title => 'Training'}
  end
  
  def holy_spirit
    @page = {:title => 'Holy Spirit', :head_title => 'Holy Spirit'}
  end

  private
    def require_authorization
      redirect_to admin_log_in_path, :notice => "You must be logged in for access." unless session[:user_id]
    end
end
