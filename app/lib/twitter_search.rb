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

	def search(query)
		results = client.search("#{query}", result_type: "recent").take(3).collect
	end
end
