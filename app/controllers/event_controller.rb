class EventController < ApplicationController

  def index
    @page = {:title => 'Upcoming Events', :head_title => 'Upcoming Events'}
    @events = Event.all.order('date ASC')
  end

  def past
    @page = {:title => 'Past Events', :head_title => 'Past Events'}
    @events = Event.all.order('date ASC')
  end

end
