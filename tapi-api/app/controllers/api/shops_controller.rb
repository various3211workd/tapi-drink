module Api
  class ShopsController < ApplicationController
    skip_before_action :user_authenticate , only: [:show]

    def show
      shop_list = Shop.where(created_at:)
    end
  end
end