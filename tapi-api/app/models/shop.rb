class Shop < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  def self.fetch_shop_list(search_words)
    if search_words.blank?
      #fetch 10 latest record
      shop_list = Shop.order('created_at desc').limit(10)
    else
      #fetch shop list
      shop_list = shops_search_with(search_words)
      p shop_list
    end

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

  private

  def self.fetch_images_url_list(shop_list)
    images_url_list = []
    unless shop_list.images.attached?
      images_url_list << "/img/noimage.png"
    end
    
    images_url_list
  end

  def self.shops_search_with(search_words)
    shop_list = []
    search_words.each do |search_word|
      shop_list += Shop.where(
        'name LIKE(?) or address LIKE(?) or details LIKE(?)',
        "%#{search_word}%",
        "%#{search_word}%",
        "%#{search_word}%")
    end
    shop_list.uniq!

    shop_list
  end
end
