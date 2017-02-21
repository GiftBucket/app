class Bucket < ApplicationRecord
  belongs_to :charity

  def is_active
    return DateTime.current < self.expires
  end

  def get_total_raised
    return Donation.where(:bucket_id => self.id ).sum(:amount)
  end

  def get_donor_count
    return Donation.where(:bucket_id => self.id ).count
  end
end
