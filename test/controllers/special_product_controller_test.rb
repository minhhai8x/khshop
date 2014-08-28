require 'test_helper'

class SpecialProductControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
