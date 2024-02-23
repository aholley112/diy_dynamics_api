class ProfilesController < ApplicationController
before_action :set_user
before_action :set_profile, only: [:show, :update, :destroy]

# GET /users/:user_id/profile
def show
    profile = @user.profile
    if profile.present?
        render json: profile
    else
        render json: { error: "Profile not found" }, status: :not_found
    end
    end
    
# POST /users/:user_id/profile
def create
    profile = @user.build_profile(profile_params)
    if profile.save
    render json: profile, status: :created
    else
    render json: profile.errors, status: :unprocessable_entity
    end
end

# PUT /users/:user_id/profile
def update
    profile = @user.profile
    if profile.update(profile_params)
    render json: profile
    else
    render json: profile.errors, status: :unprocessable_entity
    end
end

# DELETE /users/:user_id/profile
def destroy
    unless @profile
        return render json: { error: "Profile not found" }, status: :not_found
    end
 
# Destroy the profile
    @profile.destroy
    head :no_content
    end

private

def set_user
    @user = User.find_by(id: params[:user_id])
    unless @user
        render json: { error: "User not found" }, status: :not_found
    end
    end

    
    def set_profile
    @profile = @user&.profile
    unless @profile
        render json: { error: "Profile not found" }, status: :not_found
    end
    end

def profile_params
    params.require(:profile).permit(:bio)
end
end
