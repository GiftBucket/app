class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :donations
  has_many :memberships
  has_many :communities, through: :memberships

  def get_communities()
    communities = []
    self.memberships.each do |membership|
      communities.push(membership.community)
    end
    return communities
  end

  def get_largest_donation()
    if self.donations.count == 0
      return 0
    end
    return self.donations.maximum('amount')
  end

  def get_number_of_donations()
    return self.donations.count
  end

end
