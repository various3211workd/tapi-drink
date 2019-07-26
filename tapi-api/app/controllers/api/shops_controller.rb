module Api
  class ShopsController < ApplicationController
    skip_before_action :user_authenticate , only: [:show]

    def show
      search_words_list = shape_request_parameter(params[:search_words])
      shop_list = Shop.fetch_shop_list(search_words_list)
      render json: make_shop_list_json(shop_list)
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
      search_words_list.split(/[[:blank:]]+/)
    end

    def make_shop_list_json(shop_list)
      shop_list_json = []

      shop_list.each do |item|
        shop_list_json << {
          name: item.name,
          address: item.address,
          details: item.details,
          user_id: item.user_id,
          user_name: item.user_name,
          images_url: fetch_images_url_list(item)
        }
      end
      
      shop_list_json
    end

    def fetch_images_url_list(shop_list)
      images_url_list = []
      if shop_list.images.attached?
        shop_list.images.each do |image|
          images_url_list << url_for(image)
        end  
      else
        images_url_list << "/img/noimage.png"
      end
      
      images_url_list
    end
  end
end
