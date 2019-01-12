class MessagesController < ApplicationController
    
    skip_before_filter :verify_authenticity_token
    
    #Get /messages
    def index
        @messages = Message.order(created_at: :asc)
        render json: @messages
    end
    
    #Post /messages
    def create
        @message = Message.new(message_params)
        if @message.save
            render json: @message
        else
            render json: @message.errors, status: :unprocessable_entity
        end
    end
    
    private
    
    def message_params
        params.require(:message).permit(:body)
    end
    
end
