class UsersController < ApplicationController
    
    #Post /users
    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user, status: 201
        else
            render json: @user.errors.full_messages, status: 422
        end
    end
    
    private
    
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :username)
    end
end
