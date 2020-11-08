class RemoveExpYearExpMonthCvcFromCreditcards < ActiveRecord::Migration[6.0]
  def change
    remove_column :creditcards, :exp_year, :string
    remove_column :creditcards, :exp_month, :string
    remove_column :creditcards, :cvc, :string
  end
end
