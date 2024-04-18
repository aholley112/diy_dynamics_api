class SessionsController < ApplicationController
  skip_before_action :authenticate_request, only: [:login]

  # Action to handle user login
  def login
    user = User.find_by(username: params[:username])

    # Authenticates the user if the user is found and the password is correct
    if user&.authenticate(params[:password])
      token = jwt_encode(user_id: user.id)
      user_data = {
        id: user.id,
        username: user.username,
        email: user.email,
        isAdmin: user.admin || false
      }
      render json: { token: token, user: user_data }, status: :ok
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end

    private
  
    # Helper method to encode a JWT token
    def jwt_encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, Rails.application.credentials.secret_key_base)
    end
  end
