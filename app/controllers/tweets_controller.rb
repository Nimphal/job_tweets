class TweetsController < ActionController::Base	
	layout 'application'
	
	def search
		# TODO don't accept the request location if latitude and longitude are 0.0
		# latitude = request.location.latitude || "51.4882023"
		# longitude = request.location.longitude || "-3.1638941"

		latitude = "51.4787817"
		longitude = "-3.1785712"
		radius = "10mi"
		@results = TwitterSearch.new.search(params[:q], location="#{latitude},#{longitude},#{radius}")	
		render "tweets"
	end	
end
