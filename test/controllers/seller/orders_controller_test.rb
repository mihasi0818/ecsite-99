require "test_helper"

class Seller::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get seller_orders_show_url
    assert_response :success
  end
end
