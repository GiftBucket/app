class CreateBuckets < ActiveRecord::Migration[5.0]
  def change
    create_table :buckets do |t|
      t.datetime  :expires
      t.belongs_to :charity, index: true
      t.float       :amount
      t.timestamps
    end
  end
end
