class OrderForm < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :destination, :purchase_recor

  validates :destination, presence: true
  validates :purchase_recor, presence: true


  def save
    Destination.create(destination: destination)
    Purchase_recor.create(purchase_recor: purchase_recor)
  end
  
end

