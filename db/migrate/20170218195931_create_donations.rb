class CreateDonations < ActiveRecord::Migration[5.0]
  def change
    create_table :donations do |t|
      t.belongs_to :user, index: true
      t.belongs_to :bucket, index: true
      t.float      :amount
      t.timestamps
    end
  end
end
