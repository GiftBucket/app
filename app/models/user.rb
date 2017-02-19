class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :donations
  has_many :memberships

  after_initialize :init

  def init
    self.balance = 0.00
  end

  def get_communities()
    communities = []
    self.memberships.each do |membership|
      communities.push(membership.community)
    end
    return communities
  end

  def get_balance()

  end
end
