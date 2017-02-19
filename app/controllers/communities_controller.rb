class CommunitiesController < ApplicationController
  def index
    if current_user.get_communities.count == 0
      redirect_to(memberships_url)
    end
    @communities = current_user.get_communities
  end
  def display
    url_id = params[:id]
    @community = Community.find_by(urlId: url_id)
  end
end
