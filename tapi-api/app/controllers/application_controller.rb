class ApplicationController < ActionController::API

  before_action :api_authenticate
  before_action :user_authenticate

  private

  def user_authenticate
    api_authenticate
    authenticate_user_token
  end

  def api_authenticate
    request_api_key = request.headers[:HTTP_API_KEY]
    unless request_api_key == ENV['API_KEY']
      render_unauthorized
    end
  end

  def authenticate_user_token
    request_user_token = request.headers[:HTTP_USER_TOKEN]
    unless User.exists?(:user_token => request_user_token)
      render_unauthorized
    end
  end

  def render_unauthorized
    render json:{ message: "failed authenticate" }
  end

end
