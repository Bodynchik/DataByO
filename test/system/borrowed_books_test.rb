require "application_system_test_case"

class BorrowedBooksTest < ApplicationSystemTestCase
  setup do
    @borrowed_book = borrowed_books(:one)
  end

  test "visiting the index" do
    visit borrowed_books_url
    assert_selector "h1", text: "Borrowed books"
  end

  test "should create borrowed book" do
    visit borrowed_books_url
    click_on "New borrowed book"

    fill_in "Book", with: @borrowed_book.book_id
    fill_in "Date borrowed", with: @borrowed_book.date_borrowed
    fill_in "Date due", with: @borrowed_book.date_due
    fill_in "Library card", with: @borrowed_book.library_card_id
    fill_in "Status", with: @borrowed_book.status
    click_on "Create Borrowed book"

    assert_text "Borrowed book was successfully created"
    click_on "Back"
  end

  test "should update Borrowed book" do
    visit borrowed_book_url(@borrowed_book)
    click_on "Edit this borrowed book", match: :first

    fill_in "Book", with: @borrowed_book.book_id
    fill_in "Date borrowed", with: @borrowed_book.date_borrowed
    fill_in "Date due", with: @borrowed_book.date_due
    fill_in "Library card", with: @borrowed_book.library_card_id
    fill_in "Status", with: @borrowed_book.status
    click_on "Update Borrowed book"

    assert_text "Borrowed book was successfully updated"
    click_on "Back"
  end

  test "should destroy Borrowed book" do
    visit borrowed_book_url(@borrowed_book)
    click_on "Destroy this borrowed book", match: :first

    assert_text "Borrowed book was successfully destroyed"
  end
end
