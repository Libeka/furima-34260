class OrderForm < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :destination, :purchase_record, :postal_code,:prefecture_id, :city, :addresses, :phone_number,:card_number, :card_exp_month, :card_exp_year, :card_cvc

  with_options presence: true do
    validates :card_number
    validates :card_exp_month
    validates :card_exp_year
    validates :card_cvc
    validates :destination
    validates :purchase_record
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :addresses
    validates_length_of :phone_number, maximum: 11
    validates :prefecture_id, presence: true, numericality: { other_than: 1 }
  
  end

  def save
    Destination.create(destination: destination)
    Purchase_record.create(purchase_record: purchase_record)
  end

end

