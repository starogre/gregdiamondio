require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "should get about" do
    get :index
    assert_response :success
  end
end
