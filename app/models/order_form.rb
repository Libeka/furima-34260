class OrderForm < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :destination, :purchase_record, :postal_code,:prefecture_id, :city, :addresses, :phone_number

  validates :destination,:purchase_record,:postal_code,:city,:addresses,:phone_number, presence: true

  validates :prefecture_id, presence: true, numericality: { other_than: 1 }
  

  def save
    Destination.create(destination: destination)
    Purchase_record.create(purchase_record: purchase_record)
  end

end

