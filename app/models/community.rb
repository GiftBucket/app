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

  def get_all_buckets()
    buckets = []
    self.charities.each do |charity|
      charity.buckets.each do |bucket|
        buckets.push(bucket)
      end
    end
    return buckets
  end

  def get_leaderboard()
    leaderboard = []
    self.users.each do |user|
      scoreItem = {:donations => user.get_number_of_donations, :max => user.get_largest_donation, :user => user}
      leaderboard.push(scoreItem)
      leaderboard.reverse
    end
    sortedLeaderboard = leaderboard.sort_by { |hsh| hsh[:max] }
    return sortedLeaderboard
  end
end
