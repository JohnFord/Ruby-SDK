require 'test_helper'

class GetinfoControllerTest < ActionController::TestCase
  test "should get getinfo" do
    get :getinfo
    assert_response :success
  end

end
