class Product < ApplicationRecord
extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :category
belongs_to :prefecture
belongs_to :scheduled_delivery
belongs_to :shipping_fee_status
belongs_to :status
belongs_to :user
has_one_attached :image

#def images_presence
  #if images.attached?
    # inputに保持されているimagesがあるかを確認
    #if images.length > 1
      #errors.add(:image, '1枚まで投稿できます')
    #end
  #else
    #errors.add(:image, '画像がありません')
  #end
#end


validates :item_name, :item_info,:item_price, :image, presence: true


validates :category_id, :status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, numericality: { other_than: 1 }
end