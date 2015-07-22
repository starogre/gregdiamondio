require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "should get about" do
    get :about
    assert_response :success
  end

end
