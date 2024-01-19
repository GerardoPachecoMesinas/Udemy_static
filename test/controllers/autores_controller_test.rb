require "test_helper"

class AutoresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get autores_index_url
    assert_response :success
  end

  test "should get new" do
    get autores_new_url
    assert_response :success
  end
end
