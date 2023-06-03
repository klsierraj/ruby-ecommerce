require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "render a list of products" do
    get products_path

    assert_response :success
    assert_select ".product", 2
  end

  test "render a detailed product page" do
    get product_path(products(:iphone))
    assert_response :success
    assert_select ".title", "Iphone 13"
    assert_select ".description", "Esta joyita el iphone"
    assert_select ".price", "5000000"
  end

  test "render a new product form" do
    get new_product_path
    assert_response :success
    assert_select "form"
  end

  test "allow to create a new product" do
    post products_path, params: {
      product: {
        title: 'product_dummy',
        description: 'description_dummy',
        price: 1000,
      }
    }
    assert_redirected_to products_path
  end
end
