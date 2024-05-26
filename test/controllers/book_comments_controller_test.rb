require "test_helper"

class BookCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book_comment = book_comments(:one)
  end

  test "should get index" do
    get book_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_book_comment_url
    assert_response :success
  end

  test "should create book_comment" do
    assert_difference("BookComment.count") do
      post book_comments_url, params: { book_comment: { book_id: @book_comment.book_id, client_id: @book_comment.client_id, comment_text: @book_comment.comment_text } }
    end

    assert_redirected_to book_comment_url(BookComment.last)
  end

  test "should show book_comment" do
    get book_comment_url(@book_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_comment_url(@book_comment)
    assert_response :success
  end

  test "should update book_comment" do
    patch book_comment_url(@book_comment), params: { book_comment: { book_id: @book_comment.book_id, client_id: @book_comment.client_id, comment_text: @book_comment.comment_text } }
    assert_redirected_to book_comment_url(@book_comment)
  end

  test "should destroy book_comment" do
    assert_difference("BookComment.count", -1) do
      delete book_comment_url(@book_comment)
    end

    assert_redirected_to book_comments_url
  end
end
