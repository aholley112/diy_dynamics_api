class ProfilesController < ApplicationController
before_action :set_user
before_action :set_profile, only: [:show, :update, :destroy]

# GET /users/:user_id/profile
# Shows a specific profile 

def show
    profile = @user.profile
    if profile.present?
        render json: profile
    else
        render json: { error: "Profile not found" }, status: :not_found
    end
    end
    
# POST /users/:user_id/profile
# Creates a new profile

def create
    @profile = @user.build_profile(profile_params)
    if @profile.save
    render json: @profile, status: :created
    else
    render json: @profile.errors, status: :unprocessable_entity
    end
end

# PUT /users/:user_id/profile
# Updates a profile

def update
    if @profile.nil?
      render json: { error: "Profile not found" }, status: :not_found
      return
    end
  
    if @profile.update(profile_params)
      render json: @profile
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end
  

# DELETE /users/:user_id/profile
# Deletes a profile

def destroy
    if @profile
        @profile.destroy
        head :no_content
    else
        render json: { error: "Profile not found" }, status: :not_found
    end
end

private

# Finds a user by id and sets it for the show, update and destroy actions

def set_user
    @user = User.find_by(id: params[:user_id])
    render(json: { error: "User not found" }, status: :not_found) and return unless @user
end

# Finds a profile by user id and sets it for the show, update and destroy actions

def set_profile
    @profile = @user&.profile
end

# Defines parameters

def profile_params
    params.permit(:bio)
end
end
