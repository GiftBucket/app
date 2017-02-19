class AddBankIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :bank_id, :string
  end
end
