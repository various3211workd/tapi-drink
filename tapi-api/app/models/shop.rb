class Shop < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  validates :name, presence: true, length: { maximum: 100 }
  validates :address, presence: true, length: { maximum: 255 }
  validates :details, presence: true

  def self.fetch_shop_list(search_words)
    if search_words.blank?
      #fetch 10 latest record
      Shop.order('created_at desc').limit(10)
    else
      #fetch shop list
      shops_search_with(search_words)
    end
  end

  private

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
