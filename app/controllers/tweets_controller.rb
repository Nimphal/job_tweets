class TweetsController < ActionController::Base	
	layout 'application'

	def tweets
		render "tweets"
	end

	def search
		redirect_to action: 'tweets'
	end
end
