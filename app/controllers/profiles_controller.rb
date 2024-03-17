class ProfilesController < ApplicationController
  include Rails.application.routes.url_helpers  
  before_action :authenticate_request
  before_action :set_profile, only: [:update, :destroy]

  def show_current_user
    profile = @current_user.profile || create_default_profile_for(@current_user)
    render_profile_json(profile)
  end

  def update
    if @profile.update(profile_params)
      @profile.profile_picture.attach(profile_params[:profile_picture]) if profile_params[:profile_picture]
      render_profile_json(@profile)
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  def create
    profile = @current_user.build_profile(profile_params)
    if profile.save
      render_profile_json(profile)
    else
      render json: profile.errors, status: :unprocessable_entity
    end
  end

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
    params.require(:profile).permit(:bio, :profile_picture)
  end

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

  def create_default_profile_for(user)
    user.create_profile(bio: "This is a default profile bio.")
  end
end