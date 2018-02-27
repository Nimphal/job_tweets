class TweetsController < ActionController::Base	
	layout 'application'
	
	def search
		search_term = params[:q]
		begin
			@results = TwitterSearch.new.search(search_term)						
		rescue
			@results=[]
		end
		puts "these are the results"
		puts @results
		render "tweets"
	end	
end
