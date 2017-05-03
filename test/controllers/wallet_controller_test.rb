require 'test_helper'

class WalletControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:roman)

  end


  test "should get new" do

    log_in_as(@user)
    get wallet_path
    assert_response :success
  end

  test "try to view wallet while not logged in" do

    get wallet_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url

  end


end
