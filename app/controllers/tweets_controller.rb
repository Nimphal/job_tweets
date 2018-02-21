class TweetsController < ActionController::Base	
	layout 'application'

	def tweets
		@tweets_list = params[:results]
	end

	def search
		results=[{title: params[:search][:q]}, {title: "tweet2"}]
		redirect_to action: 'tweets', results: results
	end
end
