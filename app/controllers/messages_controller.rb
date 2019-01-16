class MessagesController < ApplicationController
    
    #skip_before_filter :verify_authenticity_token
    before_action :authenticate_with_token!, only: [:index, :create]
    
    #Get /messages
    def index
        @messages = Message.order(created_at: :asc)
        render json: @messages, status: 200
    end
    
    #Post /messages
    def create
        @message = Message.new(message_params)
        @message.user_id = current_user.id
        @message.username = current_user.username
        if @message.save
            render json: @message, status: 201
        else
            render json: @message.errors, status: 422
        end
    end
    
    private
    
    def message_params
        params.require(:message).permit(:body)
    end
    
end
