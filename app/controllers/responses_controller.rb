class ResponsesController < ApplicationController
  def index
    @page = {:title => 'SkarLett Buzz', :head_title => 'Responses'}
  end
end
