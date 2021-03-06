class Product < ApplicationRecord
extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :category
belongs_to :prefecture
belongs_to :scheduled_delivery
belongs_to :shipping_fee_status
belongs_to :status
belongs_to :user
has_one :purchase_record
has_one_attached :image


validates :item_name, :item_info,:item_price, :image, presence: true


validates :category_id, :status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, numericality: { other_than: 1 }


validates_inclusion_of :item_price, in: 300..9999999
end