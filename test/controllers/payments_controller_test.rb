require 'test_helper'

class PaymentsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:roman)
  end


  test "should get new" do
    log_in_as(@user)
    get deposit_path
    assert_response :success
  end

  

end
