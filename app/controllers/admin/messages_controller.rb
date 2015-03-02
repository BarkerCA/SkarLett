class Admin::MessagesController < ApplicationController
  before_filter :require_authorization, only: [:index, :new, :show, :edit, :update, :destroy]
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @page = {:title => 'Messages', :head_title => 'Messages'}
    @messages = Message.all
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @page = {:title => 'New Message', :head_title => 'Messages'}
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @page = {:title => 'New Message', :head_title => 'Messages'}
    if is_human?
      @message = Message.new(message_params)
      respond_to do |format|
        if @message.save
          MessageMailer.contact_email(@message).deliver_now
          MessageMailer.thankyou_email(@message).deliver_now
          format.html { redirect_to admin_messages_path, notice: 'Message was successfully created.' }
          format.json { render :show, status: :created, location: @message }
        else
          format.html { render :new }
          format.json { render json: @message.errors, status: :unprocessable_entity }
        end
      end
    else
      @message = Message.new(message_params)
      respond_to do |format|
        @msg = "The answer to the challenge question is not #{params[:challenge]}"
        format.html { render :new}
      end  
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to admin_messages_path, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to admin_messages_url, notice: 'Message was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:name, :email, :subject, :memo)
    end
    
    def require_authorization
      redirect_to admin_log_in_path, :notice => "You must be logged in for access." unless session[:user_id]
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
