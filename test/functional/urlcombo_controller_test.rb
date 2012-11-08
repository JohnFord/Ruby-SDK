require 'test_helper'

class UrlcomboControllerTest < ActionController::TestCase
  test "should get _urlcombo" do
    get :_urlcombo
    assert_response :success
  end

end
