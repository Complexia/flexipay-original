require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  page_title = "FlexiPay"

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "FlexiPay"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | #{page_title}"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | FlexiPay"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | FlexiPay"
  end
end
