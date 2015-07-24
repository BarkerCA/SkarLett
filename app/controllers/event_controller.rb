class EventController < ApplicationController

  def index
    @page = {:title => 'Events', :head_title => 'Events'}
    @events = Event.all
  end

end
