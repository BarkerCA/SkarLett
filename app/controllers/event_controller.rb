class EventController < ApplicationController

  def index
    @page = {:title => 'Upcoming Events', :head_title => 'Upcoming Events'}
    @events = Event.all.order('date ASC')
  end

  def past
    @page = {:title => 'Past Events', :head_title => 'Past Events'}
    @events = Event.all.order('date ASC')
  end
  
  def honduras
    @page = {:title => "Good Shepherd Children's Home Honduras", :head_title => "GSCH Honduras"}
  end

end
