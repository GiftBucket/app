class DonationsController < ApplicationController

  before_action :authenticate_user!

  def create
    if user_signed_in
      amount = params[:amount]
      bucket_id = params[:bucket_id]
      bucket = Bucket.find(:bucket_id)
      donation = Donation.new
      donation.user = current_user
      donation.bucket = bucket
      if current_user.balance < amount.to_f
        render json: {"error" => 1, "msg" => "Error: not enough funds"}
        return
      end
      donation.amount = amount.to_f
      current_user.balance -= amount.to_f
      current_user.save!
      donation.save!
      render json: {"error" => 0, "msg" => "Success"}
    else
      render json: {"error" => 1, "msg" => "Error: user not signed in"}
    end
  end

  def account
    acc = current_user.get_bank_details
    render json: acc
  end

  def add_balance
    amount = params[:amount].to_f
    addtobal = current_user.add_to_balance(amount)
    render json: {"error" => 0, "msg" => "Success", "balance" => current_user.balance}
  end
end
