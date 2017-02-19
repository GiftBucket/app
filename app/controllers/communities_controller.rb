class CommunitiesController < ApplicationController
  def index
    if current_user.get_communities.count == 0
      redirect_to(memberships_url)
    end
    @communities = current_user.get_communities
  end
  def display
    commmunity = params[:id]
    if community == "environment"
      
    end
  end
end
