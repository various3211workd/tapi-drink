module Api
  class ShopsController < ApplicationController
    skip_before_action :user_authenticate , only: [:show]

    def show
      
    end

    def create
      #message = Shop.create!(shop_params)
      p params[:images]
      render json: { debug_message: "test" }
    rescue => e
      render json:{ message: "failed create" }
    end

    private

    def shop_params
      params.require(:shop).permit(:name, :address, :details, :user_id, images: [] )
    end
  end
end