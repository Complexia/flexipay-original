class AddBitcoinToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :bitcoin, :string
    add_column :users, :money, :string
  end
end
