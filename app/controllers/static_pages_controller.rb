class StaticPagesController < ApplicationController
	def index
		if user_signed_in?
			redirect_to(communities_url)
		else
			render :layout => false
		end
	end
end
