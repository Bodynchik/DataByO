require "application_system_test_case"

class ReturnsTest < ApplicationSystemTestCase
  setup do
    @return = returns(:one)
  end

  test "visiting the index" do
    visit returns_url
    assert_selector "h1", text: "Returns"
  end

  test "should create return" do
    visit returns_url
    click_on "New return"

    fill_in "Book", with: @return.book_id
    fill_in "Date of return", with: @return.date_of_return
    fill_in "Library card", with: @return.library_card_id
    click_on "Create Return"

    assert_text "Return was successfully created"
    click_on "Back"
  end

  test "should update Return" do
    visit return_url(@return)
    click_on "Edit this return", match: :first

    fill_in "Book", with: @return.book_id
    fill_in "Date of return", with: @return.date_of_return
    fill_in "Library card", with: @return.library_card_id
    click_on "Update Return"

    assert_text "Return was successfully updated"
    click_on "Back"
  end

  test "should destroy Return" do
    visit return_url(@return)
    click_on "Destroy this return", match: :first

    assert_text "Return was successfully destroyed"
  end
end
