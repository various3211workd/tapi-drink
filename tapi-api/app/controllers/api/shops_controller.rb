module Api
  class ShopsController < ApplicationController
    skip_before_action :user_authenticate , only: [:show]

    def show
      number_of_shops = set_value_in_number_of_shops(params[:number].to_i)
      shop_list = User.fetch_shop_list(number_of_shops)
      render json:{ shop_list_data: shop_list }
    end

    private

    def set_value_in_number_of_shops(number)
      if number < 0 || number > 50
        50
      elsif number.blank?
        10
      else
        number
      end
    end

  end
end