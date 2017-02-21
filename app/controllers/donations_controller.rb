class DonationsController < ApplicationController

  before_action :authenticate_user!

  def create
    if user_signed_in?
      amount = params[:amount]
      bucket_id = params[:bucket_id]
      bucket = Bucket.find(bucket_id)
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
      puts("success should happen")
    else
      render json: {"error" => 1, "msg" => "Error: user not signed in"}
    end
  end

end
