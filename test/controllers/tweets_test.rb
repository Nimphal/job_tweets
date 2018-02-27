require 'test_helper'
require 'minitest/mock'

class TweetsControllerTest < ActionDispatch::IntegrationTest
  test "should contain search parameter" do
  	Tweet = Struct.new(:text, :uri)
  	test_tweet = Tweet.new("This is a test tweet", "example.com")

  	twitter_search_stub = MiniTest::Mock.new
  	twitter_search_stub.expect :search, [test_tweet], ["testquery"]

    TwitterSearch.stub :new, twitter_search_stub do
	    get "/tweets/search", params: {q: "testquery"}
	    assert_response :success
	    assert_select "p", "This is a test tweet"
	    assert_select "a", "example.com"
	  end

  end
end