class Charity < ApplicationRecord
  has_many :buckets
  belongs_to :community

  def get_active_bucket()
    return self.buckets.where("expires > ?",DateTime.current).first
  end

end
