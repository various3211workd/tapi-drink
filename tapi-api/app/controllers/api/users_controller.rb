module Api
  class UsersController < ApplicationController
    skip_before_action :user_authenticate , only: [:create, :login, :delete_user]

    def create
      user = User.new(user_params)
      user.save!
      render json:{ message: "success!!" }
    rescue => e
      render json:{ message: "failed save" }
    end

    def login
      input_user_login_data = login_params
      if !input_user_login_data[:email] || !input_user_login_data[:password]
        render json:{ params_error: "the email or password is incorrect" } and return
      end
      user = User.find_by(email: input_user_login_data[:email])
      if user && user.authenticate(input_user_login_data[:password])
        return_user_data = fetch_user_data_to_json(user)
        render json: return_user_data and return
      else
        render json:{ 
                      message: "failed login",
                    } and return
      end
    end

    # ///////////////////////////////////////////////
    # delete_user function
    # @header user_token
    #
    # render json{ message: "complete" }
    #           or
    # render json{ message: "error" }
    # ///////////////////////////////////////////////
    def delete_user
      user_token = request.headers[:HTTP_USER_TOKEN]
      user = User.find_by(user_token: user_token)
      p user_token
      user.destroy!
      render json:{ message: "complete" }
    rescue => e
      render json:{ message: "error" }
    end

    private
    def user_params
      params.fetch(:user, {}).permit(:email, :name, :password, :password_confirmation, :image)
    end

    def login_params
      params.fetch(:user, {}).permit(:email, :password)
    end

    def fetch_user_data_to_json(user)

      unless user.image.attached?
        user_image_url = "/img/noimage.png"
      end

      user_data = { 
        message: "succesful login",
        user_token: user.user_token ,
        user_name: user.name ,
        user_id: user.id ,
        user_image_url: user_image_url
      }

      user_data
    end
  end
end
