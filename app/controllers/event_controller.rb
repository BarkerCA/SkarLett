class EventController < ApplicationController

  def index
    @page = {:title => 'Events', :head_title => 'Events'}
    @events = Event.all.order('date ASC')
  end

end
