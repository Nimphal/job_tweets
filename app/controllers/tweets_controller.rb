class TweetsController < ActionController::Base	
	layout 'application'

	def initialize
		@client = Twitter::REST::Client.new do |config|
		  config.consumer_key        = ENV["CONSUMER_KEY"]
		  config.consumer_secret     = ENV["CONSUMER_SECRET"]
		  config.access_token        = ENV["ACCESS_TOKEN"]
		  config.access_token_secret = ENV["ACCESS_SECRET"]
		end
	end

	def search
		search_term = params[:q]
		@results = []
		if search_term
			@client.search("#{search_term}", result_type: "recent").take(3).collect do |tweet|
	  			@results << tweet
			end
		end
		render "tweets"
	end
end
