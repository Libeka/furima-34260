class OrderForm < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :destination, :purchase_record

  validates :destination, presence: true
  validates :purchase_record, presence: true


  def save
    Destination.create(destination: destination)
    Purchase_record.create(purchase_record: purchase_record)
  end

end

