class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.text :product_name, null:false
      t.string :brand
      t.string :delivery_area
      t.integer :price, null:false
      t.integer :size, null:false
      t.integer :product_status, null:false
      t.integer :delivery_fee, null:false
      t.integer :delivery_time, null:false
      t.integer :user_id, null:false, foreign_key: true
      t.timestamps
    end
  end
end
