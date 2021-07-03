class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|

      t.string :customer_id,     null: false
      t.string :city,            null: false 
      t.integer :house_number,   null: false 
      t.string :building_name,   null: false 
      t.integer :prefecture_id , null: false 

      t.timestamps
    end
  end
end

#t.integer :price ,null: false
#t.references :user ,foreign_key: true, null: false
#t.string :customer_id, null: false
#t.string :card_id, null: false