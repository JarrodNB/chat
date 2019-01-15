class UsersController < ApplicationController
    
    #Get /users
    def index
        @users = User.all
        render json: @users
    end
    
    #Post /users
    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user, status: 201
        else
            render json: @user.errors.full_messages, status: 422
        end
    end
    
=begin
    #Get /users/:id
    def show
        render json: User.find(params[:id])
    end
=end
    private
    
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :username)
    end
end
