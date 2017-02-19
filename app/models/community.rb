class Community < ApplicationRecord
  has_many :users, through: :memberships
  has_many :memberships
  has_many :charities

  def get_active_buckets()
    active_buckets = []
    self.charities.each do |charity|
      if charity.get_active_bucket != nil
        active_buckets.push(charity.get_active_bucket)
      end
    end
    return active_buckets
  end
end
