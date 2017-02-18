class CreateCharities < ActiveRecord::Migration[5.0]
  def change
    create_table :charities do |t|
      t.belongs_to :community, index: true
      t.string :title
      t.string :image
      t.string :description
      t.float  :balance
      t.timestamps
    end
  end
end
