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

  test "should not be able to see deposit page unless logged in" do

    get deposit_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url

  end




end
