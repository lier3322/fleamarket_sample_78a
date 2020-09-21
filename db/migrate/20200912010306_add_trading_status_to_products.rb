class AddTradingStatusToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :category, :integer
    add_column :products, :trading_status, :integer, null: false, default: "1"
  end
end
