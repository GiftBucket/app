require 'capital_one'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :donations
  has_many :memberships
  has_many :communities, through: :memberships

  Config.apiKey = "0e44feb4f2208d592e19b514f943edde"

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

  def get_total_donated()
    return Donation.where(:user_id => self.id ).sum(:amount)
  end

  def get_bank_details()
    account = Account.getAllByCustomerId(self.bank_id).first
    return account
  end

  def generate_donations()
    35.times do
      d = Donation.new
      b = Bucket.first(:order => "RANDOM()")
      d.bucket = b
      d.user = current_user
      d.amount = rand(5...100)
      randomMonth = rand(0...12)
      d.save!
      d.created_at = randomMonth.months.ago
      d.save!
    end
  end

  def donation_for_months()
    self.donations.each do |donation|

    end
    for m in 0...11

    end
  end

  def get_communities_str
    str = ""
    self.communities.each do |community|
      str += community.title + ','
    end
    str = str[0...-1]
    return str
  end

  def add_to_balance(amount)
    wd = withdrawal(amount)
    self.balance += amount
    self.save!
  end

  def withdrawal(amount)
    account = self.get_bank_details
    withdrawalHash = {
      "medium": "balance",
      "amount": amount,
      "desciption": "donation"
    }
    withdrawalToCreate = withdrawalHash.to_json
    url = "http://api.reimaginebanking.com/accounts/" + account["_id"] + "/withdrawals?key=" + Config.apiKey
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri, initheader = {'Content-Type' => 'application/json'})
    request.body = withdrawalToCreate
    resp = http.request(request)
    data = JSON.parse(resp.body)
    return data
  end



end
