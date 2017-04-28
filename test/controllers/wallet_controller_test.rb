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

end
