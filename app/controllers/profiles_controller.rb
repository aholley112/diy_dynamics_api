class ProfilesController < ApplicationController
  before_action :authenticate_request
  before_action :set_profile, only: [:update, :destroy]

  # Shows the current user's profile or creates a default one if not present
  def show_current_user
    profile = @current_user.profile || create_default_profile_for(@current_user)
    render_profile_json(profile)
  end

  # Updates the current user's profile
  def update
    if @profile.update(profile_params)
      render_profile_json(@profile)
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  # Creates a new profile for the user
  def create
    profile = @current_user.build_profile(profile_params)
    if profile.save
      render_profile_json(profile)
    else
      render json: profile.errors, status: :unprocessable_entity
    end
  end

  # Deletes the current user's profile
  def destroy
    @profile.destroy
    render json: { message: "Profile successfully deleted." }, status: :ok
  end

  private

  def set_profile
    @profile = @current_user.profile
    render(json: { error: "Profile not found" }, status: :not_found) unless @profile
  end

  def profile_params
    params.require(:profile).permit(:bio)
  end

  def render_profile_json(profile)
    render json: {
      id: profile.id,
      bio: profile.bio,
      user: {
        firstName: @current_user.first_name, # Ensure these fields exist in your User model
        lastName: @current_user.last_name
      },
      userId: @current_user.id
    }
  end

  def create_default_profile_for(user)
    user.create_profile(bio: "This is a default profile bio.")
  end
end
