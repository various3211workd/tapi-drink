class Shop < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  def self.fetch_shop_list(number)
    shop_list = Shop.order('created_at desc').limit(number)
    shop_list_json = []
    #images_url_list = fetch_images_url_list(shop_list)
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

  private

  def self.fetch_images_url_list(shop_list)
    images_url_list = []
    unless shop_list.images.attached?
      images_url_list << "/img/noimage.png"
    end
    
    images_url_list
  end

end