require "application_system_test_case"

class ApiTokensTest < ApplicationSystemTestCase
  setup do
    @api_token = api_tokens(:one)
  end

  test "visiting the index" do
    visit api_tokens_url
    assert_selector "h1", text: "Api Tokens"
  end

  test "should create Api token" do
    visit api_tokens_url
    click_on "New Api Token"

    fill_in "Encrypted access token", with: @api_token.encrypted_access_token
    fill_in "Encrypted access token iv", with: @api_token.encrypted_access_token_iv
    click_on "Create Api token"

    assert_text "Api token was successfully created"
    click_on "Back"
  end

  test "should update Api token" do
    visit api_tokens_url
    click_on "Edit", match: :first

    fill_in "Encrypted access token", with: @api_token.encrypted_access_token
    fill_in "Encrypted access token iv", with: @api_token.encrypted_access_token_iv
    click_on "Update Api token"

    assert_text "Api token was successfully updated"
    click_on "Back"
  end

  test "should destroy Api token" do
    visit api_tokens_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Api token was successfully destroyed"
  end
end
