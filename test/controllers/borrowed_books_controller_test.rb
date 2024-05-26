require 'test_helper'

class BorrowedBooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @borrowed_book = borrowed_books(:one)
  end

  test 'should get index' do
    get borrowed_books_url
    assert_response :success
  end

  test 'should get new' do
    get new_borrowed_book_url
    assert_response :success
  end

  test 'should create borrowed_book' do
    assert_difference('BorrowedBook.count') do
      post borrowed_books_url,
           params: { borrowed_book: { book_id: @borrowed_book.book_id, date_borrowed: @borrowed_book.date_borrowed, date_due: @borrowed_book.date_due,
                                      library_card_id: @borrowed_book.library_card_id, status: @borrowed_book.status } }
    end

    assert_redirected_to borrowed_book_url(BorrowedBook.last)
  end

  test 'should show borrowed_book' do
    get borrowed_book_url(@borrowed_book)
    assert_response :success
  end

  test 'should get edit' do
    get edit_borrowed_book_url(@borrowed_book)
    assert_response :success
  end

  test 'should update borrowed_book' do
    patch borrowed_book_url(@borrowed_book),
          params: { borrowed_book: { book_id: @borrowed_book.book_id, date_borrowed: @borrowed_book.date_borrowed, date_due: @borrowed_book.date_due,
                                     library_card_id: @borrowed_book.library_card_id, status: @borrowed_book.status } }
    assert_redirected_to borrowed_book_url(@borrowed_book)
  end

  test 'should destroy borrowed_book' do
    assert_difference('BorrowedBook.count', -1) do
      delete borrowed_book_url(@borrowed_book)
    end

    assert_redirected_to borrowed_books_url
  end
end
