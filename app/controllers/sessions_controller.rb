class SessionsController < ApplicationController
  skip_before_action :authenticate_request, only: [:login]

    def login
      user = User.find_by(username: params[:username])
      
      if user&.authenticate(params[:password])
        token = jwt_encode(user_id: user.id)
        Rails.logger.info "Generated Token: #{token}"  
        render json: { token: token }, status: :ok
      else
        render json: { error: 'Invalid username or password' }, status: :unauthorized
      end
    end
  
    private
  
    def jwt_encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, Rails.application.credentials.secret_key_base)
    end
  end
