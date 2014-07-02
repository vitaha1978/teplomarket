require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select '.entry .price', minimum: 3
    assert_select 'h1', 1
    assert_select '.price', /[,\d]+\.\d\d/
  end

end
