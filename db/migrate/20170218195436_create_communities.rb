class CreateCommunities < ActiveRecord::Migration[5.0]
  def change
    create_table :communities do |t|
      t.string  :title
      t.timestamps
    end
    create_table :memberships do |t|
      t.belongs_to :community, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
