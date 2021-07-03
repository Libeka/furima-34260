class Card < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :item_price, :user_id

  validates :price, presence: true
  belongs_to :user,optional: true

end
