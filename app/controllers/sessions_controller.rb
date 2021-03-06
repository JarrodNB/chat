class SessionsController < ApplicationController
    
    # Post /sessions
    def create
        user_password = params[:session][:password]
        user_email = params[:session][:email]
        user = user_email.present? && User.find_by(email: user_email)
        if user.nil?
            render json: { errors: "Invalid email or password" }, status: 422
        end
        if user.valid_password? user_password
            sign_in user, store: false
            user.generate_authentication_token!
            user.save
            render json: user, status: 201
        else
            render json: { errors: "Invalid email or password" }, status: 422
        end
    end
    
    # destory /destory
    def destroy
        user = User.find_by(auth_token: params[:auth_token])
        user.generate_authentication_token!
        user.save
        head 204
    end
end
