class LeaderboardsController < ApplicationController
  def show
    url_id = params[:id]
    @community = Community.find_by(urlId: url_id)
    @leaderboard = @community.get_leaderboard
  end
end
