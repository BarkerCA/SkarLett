class ResponsesController < ApplicationController
  def index
    @page = {:title => 'Responses To SkarLett', :head_title => 'Responses'}
  end
end
