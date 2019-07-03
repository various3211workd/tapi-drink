module Api
  class ShopsController < ApplicationController
    skip_before_action :user_authenticate , only: [:show]

    def show
      number_of_shops = set_value_in_number_of_shops(params[:number].to_i)
      shop_list = Shop.order('created_at desc').limit(number_of_shops)
      images_url_list = fetch_images_url_list(shop_list)
      p images_url_list
      render json:{
                    shop_list_data: shop_list,
                    images_url: images_url_list
                  }
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

    def set_value_in_number_of_shops(number)
      if number < 0 || number > 50
        50
      elsif number.blank?
        10
      else
        number
      end
    end

    def fetch_images_url_list(shop_list)
      images_url_list = []
      shop_list.each do |item|
        unless item.images.attached?
          images_url_list << "/img/noimage.png"
          break
        end
      end

      images_url_list
    end

  end
end