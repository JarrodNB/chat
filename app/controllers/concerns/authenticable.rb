module Authenticable

  # Devise methods overwrites
  def current_user
    @current_user ||= User.find_by(auth_token: params[:auth_token])
  end
  
  def authenticate_with_token!
    render json: { errors: "Not authenticated" },
                status: :unauthorized unless user_signed_in?
  end
  
  def user_signed_in?
    current_user.present?
  end
end
