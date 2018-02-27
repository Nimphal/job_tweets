class TweetsController < ActionController::Base	
	layout 'application'
	
	def search
		#FIXME this is brittle
		latitude = request.location.latitude unless request.location.latitude == 0.0
		longitude = request.location.longitude unless request.location.longitude == 0.0
		radius = ""

		@results = TwitterSearch.new.search(params[:q], {latitude: latitude, longitude: longitude, radius: radius})	
		render "tweets"
	end	
end
