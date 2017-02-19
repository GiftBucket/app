class Bucket < ApplicationRecord
  belongs_to :charity

  def is_active
    return DateTime.current < self.expires
  end
end
