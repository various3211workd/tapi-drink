module Api
  class UsersController < ApplicationController

    def create
      @user = User.new(user_params)
      p user_params
      @user.save!
      render json:{message:'success!!'}
    rescue => e
      render json:{error:"failed save"}
    end

    def login
      input_user_login_data = login_params
      if !input_user_login_data[:email] || !input_user_login_data[:password]
        render json:{params_error:"the email or password is incorrect"} and return
      end

      user = User.find_by(email: input_user_login_data[:email])
      if user && user.authenticate(input_user_login_data[:password])
        render json:{success_message:'succesful login',user_token:user.user_token} and return
      else
        render json:{failure_message:'failed login'} and return
      end

    end

    private

    def user_params
      params.fetch(:user, {}).permit(:name, :email, :password)
    end

    def login_params
      params.fetch(:login, {}).permit(:email, :password)
    end

    end
end