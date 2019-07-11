module Api
  class ShopsController < ApplicationController
    skip_before_action :user_authenticate , only: [:show]

    def show
      search_words_list = shape_request_parameter(params[:search_words])
      shop_list = Shop.fetch_shop_list(search_words_list)
      render json: shop_list
    end

    def create
      Shop.create!(shop_params)
      render json:{ message: "success create" }
    rescue => e
      render json:{ message: "failed create" }
    end

    private

    def shop_params
      params.require(:shop).permit(:name, :address, :details, :user_id, :user_name, images: [] )
    end

    def shape_request_parameter(search_words_list)
      unless search_words_list.present?
        return nil
      end
      p search_words_list
      search_words_list.split(/[[:blank:]]+/)
    end
  end
end