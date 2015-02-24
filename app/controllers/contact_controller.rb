class ContactController < ApplicationController
  def index
    @page = {:title => 'Contact SkarLett', :head_title => 'Contact Us'}
  end
end
