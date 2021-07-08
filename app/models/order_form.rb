class OrderForm < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :destination, :purchase_record, :postal_code,:prefecture_id, :city, :addresses, :phone_number,:card_number, :card_exp_month, :card_exp_year, :card_cvc

  validates :card_number, :card_exp_month, :card_exp_year, :card_cvc, :destination,:purchase_record,:postal_code,:city,:addresses,:phone_number, presence: true

  validates :prefecture_id, presence: true, numericality: { other_than: 1 }
  

  def save
    Destination.create(destination: destination)
    Purchase_record.create(purchase_record: purchase_record)
  end

end

