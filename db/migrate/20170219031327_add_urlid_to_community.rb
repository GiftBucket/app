class AddUrlidToCommunity < ActiveRecord::Migration[5.0]
  def change
    add_column :communities, :urlId, :string
  end
end
