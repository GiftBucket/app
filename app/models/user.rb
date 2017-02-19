require 'capital_one'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :donations
  has_many :memberships
  has_many :communities, through: :memberships

  Config.apiKey = ""

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

  def get_bank_details()
    account = Account.getAllByCustomerId(self.bank_id).first
    return account
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
    url = "http://api.reimaginebanking.com/accounts/" + account["_id"] + "/withdrawals?key=0e44feb4f2208d592e19b514f943edde"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri, initheader = {'Content-Type' => 'application/json'})
    request.body = withdrawalToCreate
    resp = http.request(request)
    data = JSON.parse(resp.body)
    return data
  end



end
