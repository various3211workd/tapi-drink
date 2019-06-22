module Api
  class UsersController < ApplicationController

    def create
      @user = User.new(user_params)
      @user.save!
      render json:{message:'success!!'}
    rescue => e
      render json:{error:"failed save"}
    end

    private

    def user_params
      params.require(:user).permit(:name,:password)
    end
  end
end