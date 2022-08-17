class UsersController < ApplicationController
  before_action :set_user, only: %w[new]
  before_action :create_user, only: %w[create]

  def new
  end

  def create
    if (@user.save)
      redirect_to root_path, notice: "Check your email for confirmation instructions."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def set_user
      @user = User.new
    end

    def create_user
      @user = User.new(user_params)
    end

    def user_params
      params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end
end
