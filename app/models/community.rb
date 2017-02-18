class Community < ApplicationRecord
  has_many :users, through: :memberships
  has_many :charities
end
