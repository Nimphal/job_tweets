require 'test_helper'
require 'minitest/mock'

class TweetsControllerTest < ActionDispatch::IntegrationTest
  test "should contain search parameter" do
  	twitter_search_stub = MiniTest::Mock.new
  	twitter_search_stub.expect :search, "testquery", [{text: "This is a test tweet"}]
    TwitterSearch.stub :new, twitter_search_stub do
	    get "/tweets/search"
	    assert_response :success
	    assert_select "p", "This is a test tweet"
	  end
  end
end