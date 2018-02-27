class TweetsController < ActionController::Base	
	layout 'application'
	
	def search
		search_term = params[:q]
		begin
			@results = TwitterSearch.new.search(search_term)						
		rescue
			@results=[]
		end
		render "tweets"
	end	
end
