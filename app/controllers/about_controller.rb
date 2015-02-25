class AboutController < ApplicationController
  def index
    @page = {:title => 'Who Is SkarLett?', :head_title => 'About Us'}
  end
end
