class Charity < ApplicationRecord
  has_many :buckets
  belongs_to :community
end
