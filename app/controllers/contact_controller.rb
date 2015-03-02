class ContactController < ApplicationController
  def index
    @page = {:title => 'Contact SkarLett', :head_title => 'Contact Us'}
    @message = Message.new
  end
  
  def create
    if is_human?
      @message = Message.new(message_params)
      respond_to do |format|
        if @message.save
          #MessageMailer.contact_email(@message).deliver_now
          #MessageMailer.thankyou_email(@message).deliver_now
          format.html { redirect_to '/contact/finished/' + is_human?.to_s }
          format.json { render :show, status: :created, location: @message }
        else
          format.html { render :index }
          format.json { render json: @message.errors, status: :unprocessable_entity }
        end
      end
    else
      @message = Message.new(message_params)
      respond_to do |format|
        @msg = "The answer to the challenge question is not #{params[:challenge]}"
        format.html { render :index}
      end
    end
  end
  
  def finished
    if params[:data] == 'nosend'
      @page = {:title => 'Error Sending', :head_title => 'Error Sending'}
      @msg = '<p data-alert class="alert-box alert radius">We had a problem saving your information!<a href="#" class="close">&times;</a></p><p class="text-center"><a class="button" href="/contact">Please Try Again</a></p>'
    elsif params[:data] == "true"
      @page = {:title => 'Thank You For Contacting SkarLett', :head_title => 'Thank You!'}
      @msg = '<p data-alert class="alert-box success radius">We have received your message and will get back to you as soon as possible.<a href="#" class="close">&times;</a></p>'
    end
  end
  
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:name, :email, :subject, :memo)
    end
    
    def is_human?
      if params[:challenge].downcase! == "red" or params[:challenge] == "red"
        a = true
      elsif params[:challenge] == ""
        a = false
      else
        a = false
      end
    end

end
