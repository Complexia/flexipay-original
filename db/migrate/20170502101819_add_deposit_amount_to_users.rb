class AddDepositAmountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :deposit_amount, :money
  end
end
