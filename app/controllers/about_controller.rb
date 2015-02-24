class AboutController < ApplicationController
  def index
    @page = {:title => 'About SkarLett', :head_title => 'About Us'}
  end
end
