class CreateCreditcards < ActiveRecord::Migration[6.0]
  def change
    create_table :creditcards do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.string :customer_id
      t.string :card_id, null: false
      t.string :exp_year, null: false, default: ""
      t.string :exp_month, null: false, default: ""
      t.string :cvc, null: false, default: ""
      t.timestamps
    end
  end
end
