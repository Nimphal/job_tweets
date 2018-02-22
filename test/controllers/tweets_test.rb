require 'test_helper'

class TweetsControllerTest < ActionDispatch::IntegrationTest
  test "should show results page" do
    get "/tweets/search"
    assert_response :success
    assert_select "h1", "Tweets"
  end

  test "should contain search parameter" do
    get "/tweets/search", params: {q: "testquery"}
    assert_response :success
    assert_select "p", "testquery"
  end
end