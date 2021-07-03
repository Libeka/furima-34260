class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|

      t.integer :prefecture_id, null:false
      t.string  :city,          null:false
      t.string  :address,       null:false
      t.string  :building_name, null:false
      t.string  :phone_number,  null:false
      t.references  :purchase_record,  null:false
      t.string  :zip_code,      null:false
      t.timestamps
    end
  end
end