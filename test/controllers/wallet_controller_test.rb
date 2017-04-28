require 'test_helper'

class WalletControllerTest < ActionDispatch::IntegrationTest
  test "should get balance" do
    get wallet_path
    assert_response :success
  end

end
