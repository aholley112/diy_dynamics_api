class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]
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
      render json: @user, status: :ok
    end
  
    # POST /users
    # Create a new user

    def create
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
      if @user.update(user_params)
        render json: @user, status: :ok
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /users/:id
    # Delete a user
    def destroy
      if @user.destroy
        head :no_content
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    # Finds a user by id and sets it for the show, update and destroy actions

    def set_user
      @user = User.find(params[:id])
    end
  
    # Defines parameters

    def user_params
      params.permit(:first_name, :last_name, :email, :username, :password)
    end
  end
  