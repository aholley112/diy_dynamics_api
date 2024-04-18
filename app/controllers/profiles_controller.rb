class ProfilesController < ApplicationController
  include Rails.application.routes.url_helpers  
  before_action :authenticate_request
  before_action :set_profile, only: [:update, :destroy]

  # GET /profiles
  # Show the current user's profile
  def show_current_user
    profile = @current_user.profile || create_default_profile_for(@current_user)
    render_profile_json(profile)
  end

  # PUT /profiles
  # Update the current user's profile
  def update
    if profile_params[:remove_profile_picture] == '1'
      @profile.profile_picture.purge if @profile.profile_picture.attached?
    end
    if profile_params[:profile_picture].present?
      @profile.profile_picture.attach(profile_params[:profile_picture])
    end
    if @profile.update(profile_params.except(:profile_picture, :remove_profile_picture))
      render_profile_json(@profile)
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  # POST /profiles
  # Create a new profile for the current user
  def create
    profile = @current_user.build_profile(profile_params)
    if profile.save
      render_profile_json(profile)
    else
      render json: profile.errors, status: :unprocessable_entity
    end
  end

  # DELETE /profiles
  # Delete the current user's profile
  def destroy
    @profile.destroy
    render json: { message: "Profile successfully deleted." }, status: :ok
  end

  private

  # Sets the current user's profile
  def set_profile
    @profile = @current_user.profile
    render(json: { error: "Profile not found" }, status: :not_found) unless @profile
  end

  # Parameters
  def profile_params
    params.require(:profile).permit(:bio, :profile_picture, :remove_profile_picture)
  end

  # Renders a profile as JSON
  def render_profile_json(profile)
    render json: {
      id: profile.id,
      bio: profile.bio,
      user: {
        firstName: @current_user.first_name,
        lastName: @current_user.last_name
      },
      userId: @current_user.id,
      profilePictureUrl: profile.profile_picture.attached? ? url_for(profile.profile_picture) : nil
    }
  end

  # Creates a default profile for a user
  def create_default_profile_for(user)
    user.create_profile(bio: "This is a default profile bio.")
  end
end