require "test_helper"

class Seller::PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get seller_pages_home_url
    assert_response :success
  end
end
