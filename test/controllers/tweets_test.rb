require 'test_helper'

class TweetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get "/tweets"
    assert_response :success
    assert_select "h1", "Tweets"
  end
end