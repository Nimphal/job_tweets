class TweetsController < ActionController::Base	
	layout 'application'

	def search
		search_term = params[:q]
		if search_term
			@results=[{title: search_term}, {title: "tweet2"}]
		else
			@results = []
		end
		render "tweets"
	end
end
