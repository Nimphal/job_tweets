require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get "/"
    assert_response :success
    assert_select "h1", "Search"
  end

  test "should post search with correct param" do
    get "/"
    fill_in "search_q", with: "testquery"
    submit_form!
    assert_equal params[:search][:q], "testquery"
  end
end