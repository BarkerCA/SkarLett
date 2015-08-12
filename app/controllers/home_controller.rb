class HomeController < ApplicationController
  
  def index
    @page = {:title => 'SkarLett Welcomes You', :head_title => 'Welcome'}
  end
  
  def special
    @page = {:title => 'SkarLett Welcomes You', :head_title => 'Welcome'}
  end
  
end