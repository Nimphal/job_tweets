Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "home#home" 
  get "/tweets" => "tweets#tweets"
  post "/tweets/search" => "tweets/search"
end
