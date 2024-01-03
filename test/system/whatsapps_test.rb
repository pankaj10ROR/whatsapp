require "application_system_test_case"

class WhatsappsTest < ApplicationSystemTestCase
  setup do
    @whatsapp = whatsapps(:one)
  end

  test "visiting the index" do
    visit whatsapps_url
    assert_selector "h1", text: "Whatsapps"
  end

  test "creating a Whatsapp" do
    visit whatsapps_url
    click_on "New Whatsapp"

    fill_in "Email", with: @whatsapp.email
    fill_in "Name", with: @whatsapp.name
    fill_in "Number", with: @whatsapp.number
    click_on "Create Whatsapp"

    assert_text "Whatsapp was successfully created"
    click_on "Back"
  end

  test "updating a Whatsapp" do
    visit whatsapps_url
    click_on "Edit", match: :first

    fill_in "Email", with: @whatsapp.email
    fill_in "Name", with: @whatsapp.name
    fill_in "Number", with: @whatsapp.number
    click_on "Update Whatsapp"

    assert_text "Whatsapp was successfully updated"
    click_on "Back"
  end

  test "destroying a Whatsapp" do
    visit whatsapps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Whatsapp was successfully destroyed"
  end
end
