require "test_helper"

class BookRaitingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book_raiting = book_raitings(:one)
  end

  test "should get index" do
    get book_raitings_url
    assert_response :success
  end

  test "should get new" do
    get new_book_raiting_url
    assert_response :success
  end

  test "should create book_raiting" do
    assert_difference("BookRaiting.count") do
      post book_raitings_url, params: { book_raiting: { book_id: @book_raiting.book_id, client_id: @book_raiting.client_id, rating_value: @book_raiting.rating_value } }
    end

    assert_redirected_to book_raiting_url(BookRaiting.last)
  end

  test "should show book_raiting" do
    get book_raiting_url(@book_raiting)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_raiting_url(@book_raiting)
    assert_response :success
  end

  test "should update book_raiting" do
    patch book_raiting_url(@book_raiting), params: { book_raiting: { book_id: @book_raiting.book_id, client_id: @book_raiting.client_id, rating_value: @book_raiting.rating_value } }
    assert_redirected_to book_raiting_url(@book_raiting)
  end

  test "should destroy book_raiting" do
    assert_difference("BookRaiting.count", -1) do
      delete book_raiting_url(@book_raiting)
    end

    assert_redirected_to book_raitings_url
  end
end
