class LeaderboardsController < ApplicationController

before_action :authenticate_user!

  def show
    url_id = params[:id]
    @community = Community.find_by(urlId: url_id)
    @leaderboard = @community.get_leaderboard
  end
end
