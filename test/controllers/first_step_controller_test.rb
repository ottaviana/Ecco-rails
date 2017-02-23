require 'test_helper'

class FirstStepControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get first_step_index_url
    assert_response :success
  end

end
