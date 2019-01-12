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
            render json: @user
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end
    
    #Get /users/:id
    def show
        render json: User.find(params[:id])
    end
    
    private
    
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
