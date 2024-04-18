class ApplicationController < ActionController::API
  include Rails.application.routes.url_helpers 
  before_action :authenticate_request
  attr_reader :current_user
  
  private

  # Authenticate incoming requests using JWT
  def authenticate_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      # Decode a token and set a current user.
      @decoded = jwt_decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound, JWT::DecodeError
      # Handle unauthorized access
      render json: { errors: 'Unauthorized' }, status: :unauthorized
    end
  end
  
  # Decode JWT token
  def jwt_decode(token)
    decoded = JWT.decode(token, Rails.application.credentials.secret_key_base)[0]
    HashWithIndifferentAccess.new decoded
  end

  # Method to check if the current user is an admin
  def authenticate_admin
    render json: { error: 'Not authorized' }, status: :unauthorized unless @current_user&.admin?
  end
end