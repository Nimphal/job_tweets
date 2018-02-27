class TweetsController < ActionController::Base	
	layout 'application'
	
	def search
		@results = TwitterSearch.new.search(params[:q])	
		render "tweets"
	end	
end
