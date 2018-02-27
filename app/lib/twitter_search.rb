class TwitterSearch
	attr_reader :query

	def client
		@client ||= Twitter::REST::Client.new do |config|
		  config.consumer_key        = ENV["CONSUMER_KEY"]
		  config.consumer_secret     = ENV["CONSUMER_SECRET"]
		  config.access_token        = ENV["ACCESS_TOKEN"]
		  config.access_token_secret = ENV["ACCESS_SECRET"]
		end
	end

	def search(query, location="")
		begin
			results = client.search("#{query}", result_type: "recent", geocode: location).take(3).collect
		rescue Exception => e
			puts "There was an error"
			puts e
			results = []
		end
	end
end
