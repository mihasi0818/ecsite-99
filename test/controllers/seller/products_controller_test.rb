require "test_helper"

class Seller::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get seller_products_index_url
    assert_response :success
  end

  test "should get show" do
    get seller_products_show_url
    assert_response :success
  end

  test "should get new" do
    get seller_products_new_url
    assert_response :success
  end

  test "should get edit" do
    get seller_products_edit_url
    assert_response :success
  end
end
