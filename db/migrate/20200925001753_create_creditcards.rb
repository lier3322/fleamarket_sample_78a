class CreateCreditcards < ActiveRecord::Migration[6.0]
  def change
    create_table :creditcards do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.string :customer_id
      t.string :card_id, null: false
      t.timestamps
    end
  end
end
