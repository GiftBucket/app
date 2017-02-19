class ProfilesController < ApplicationController

  def index
    redirect_to('/profiles/' + current_user.id.to_s)
  end

  def show
    @user = User.find(params[:id])
  end
end
