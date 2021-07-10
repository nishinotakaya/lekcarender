require "application_system_test_case"

class LekUrlsTest < ApplicationSystemTestCase
  setup do
    @lek_url = lek_urls(:one)
  end

  test "visiting the index" do
    visit lek_urls_url
    assert_selector "h1", text: "Lek Urls"
  end

  test "creating a Lek url" do
    visit lek_urls_url
    click_on "New Lek Url"

    fill_in "Name", with: @lek_url.name
    fill_in "Url", with: @lek_url.url
    click_on "Create Lek url"

    assert_text "Lek url was successfully created"
    click_on "Back"
  end

  test "updating a Lek url" do
    visit lek_urls_url
    click_on "Edit", match: :first

    fill_in "Name", with: @lek_url.name
    fill_in "Url", with: @lek_url.url
    click_on "Update Lek url"

    assert_text "Lek url was successfully updated"
    click_on "Back"
  end

  test "destroying a Lek url" do
    visit lek_urls_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lek url was successfully destroyed"
  end
end
