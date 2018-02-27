class TwitterSearch
	attr_reader :latitude, :longitude, :radius, :client

	def initialize
		@latitude = ENV["DEFAULT_LATITUDE"]
		@longitude = ENV["DEFAULT_LONGITUDE"]
		@radius = ENV["DEFAULT_RADIUS_IN_MILES"]
		
		@client ||= Twitter::REST::Client.new do |config|
		  config.consumer_key        = ENV["CONSUMER_KEY"]
		  config.consumer_secret     = ENV["CONSUMER_SECRET"]
		  config.access_token        = ENV["ACCESS_TOKEN"]
		  config.access_token_secret = ENV["ACCESS_SECRET"]
		end
	end

	# TODO needs testing
	def search(query, location)
		if location.fetch(:latitude, nil) && location.fetch(:longitude, nil)
			latitude = location[:latitude]
			longitude = location[:longitude]
		end

		if location.fetch(:radius, nil)
			radius = location[:radius]
		end

		begin
			results = client.search("#{query}", result_type: "recent", geocode: "#{latitude},#{longitude},#{radius}mi").take(3).collect
		rescue Exception => e
			puts "There was an error"
			puts e
			results = []
		end
	end
end
