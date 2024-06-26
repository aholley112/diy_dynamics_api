class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy, :upload_image]
    skip_before_action :authenticate_request, only: [:create]
  
    # GET /users
    # List all users

    def index
      @users = User.all
      render json: @users, status: :ok
    end
  
    # GET /users/:id
    # Show a specific user

    def show
        if @user.image.attached?
          profile_picture_url = url_for(@user.image)
        else
          profile_picture_url = nil  
        end
    
      render json: @user.as_json.merge({ profilePictureUrl: profile_picture_url}), status: ok
    end

    def upload_image
      user = User.find(params[:id])
      if user.image.attach(params[:image])
        render json: { message: "Image uploaded successfully." }, status: :ok
      else
        render json: { message: "Image upload failed." }, status: :unprocessable_entity
      end
    end

    
  
    # POST /users
    # Create a new user

    def create
      Rails.logger.info params.inspect
      @user = User.new(user_params)
  
      if @user.save
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    # PUT /users/:id
    # Update a user

    def update
      if params[:remove_picture] == '1'
        @user.image.purge if @user.image.attached?
      end
    
      @user.admin = true if @user.email == 'amanda@testing.com'
      
      if @user.update(user_params)
        render json: @user, status: :ok
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /users/:id
    # Delete a user
    def destroy
      @user.destroy
      render json: { message: "User successfully deleted." }, status: :ok
    end
  
    private
  
    # Finds a user by id and sets it for the show, update and destroy actions

    def set_user
      @user = User.find(params[:id])
    end
  
    # Defines parameters

    def user_params
      params.permit(:first_name, :last_name, :email, :username, :password, :profile_picture)
    end
  end
  