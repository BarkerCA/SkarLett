module ApplicationHelper
  def head_page_title
    title_separator = " :: "
    begin
      if @page[:head_title].length > 0
        title = "#{title_separator}#{@page[:head_title]}"
      else
        title = "#{title_separator}#{page_title}"
      end
    rescue
      title = "#{title_separator}#{page_title}"
    end
  end
  
  def page_title
    begin
      @page[:title]
    rescue
      "#{params[:controller]} #{params[:action]}".titleize
    end
  end
  
  def active(location)
    if params[:controller] + params[:action] == location
      return " class='active'"
    end
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  # Amazon Web Services Link
  def aws_link(type)
    if type == "s3_https"
      "https://s3-us-west-1.amazonaws.com/skar-lett.com"
    elsif type == "s3_http"
      "http://skar-lett.com.s3.amazonaws.com"
    elsif type == "cloudfront"
      "https://d1nvel87k8rw67.cloudfront.net"
    end
  end

end