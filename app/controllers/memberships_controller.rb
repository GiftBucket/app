class MembershipsController < ApplicationController

  before_action :authenticate_user!

  def index
    #show page with all the things to join
  end

  def create
    url_id = params[:id]
    community = Community.find_by(urlId: url_id)
    membership = Membership.new
    membership.user = current_user
    membership.community = community
    membership.save!
    render json: {"error" => 0, "msg" => "Success"}
  end

end
