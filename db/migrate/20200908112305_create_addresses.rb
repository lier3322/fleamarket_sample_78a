class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postnumber, null: false
      t.string :prefecture, null: false
      t.string :city, null: false
      t.string :house_number, null: false
      t.string :building
      t.string :phone_number
      t.integer :user_id, null:false, foreign_key: true
      t.timestamps
    end
  end
end
