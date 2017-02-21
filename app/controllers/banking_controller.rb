class BankingController < ApplicationController
  def index
    @account_balance = current_user.get_bank_details["balance"]
    @balance = current_user.balance
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
