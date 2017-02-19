class StaticPagesController < ApplicationController
	def index
		if user_signed_in?
			redirect_to(communities_url)
		end
	end

	def join_communities

	end
end
