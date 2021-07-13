class OrderForm 
  include ActiveModel::Model
  attr_accessor :zip_code,:prefecture_id, :city, :address, :phone_number, :token, :building_name, :product_id, :user_id, :purchase_record_id

  with_options presence: true do
    
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :token
    validates_length_of :phone_number, maximum: 11
    validates :prefecture_id, presence: true, numericality: { other_than: 1 }

  end

  def save

    # 購入情報を保存
    purchase_record = PurchaseRecord.create(product_id: product_id, user_id: user_id)
    # 配送先の情報を保存
    Destination.create(prefecture_id: prefecture_id, city: city, phone_number: phone_number, zip_code: zip_code, building_name: building_name, address: address, purchase_record_id: purchase_record.id )
    
  end

  #def destination
  #end

end

