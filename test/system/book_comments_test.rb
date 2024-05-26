require 'application_system_test_case'

class BookCommentsTest < ApplicationSystemTestCase
  setup do
    @book_comment = book_comments(:one)
  end

  test 'visiting the index' do
    visit book_comments_url
    assert_selector 'h1', text: 'Book comments'
  end

  test 'should create book comment' do
    visit book_comments_url
    click_on 'New book comment'

    fill_in 'Book', with: @book_comment.book_id
    fill_in 'Client', with: @book_comment.client_id
    fill_in 'Comment text', with: @book_comment.comment_text
    click_on 'Create Book comment'

    assert_text 'Book comment was successfully created'
    click_on 'Back'
  end

  test 'should update Book comment' do
    visit book_comment_url(@book_comment)
    click_on 'Edit this book comment', match: :first

    fill_in 'Book', with: @book_comment.book_id
    fill_in 'Client', with: @book_comment.client_id
    fill_in 'Comment text', with: @book_comment.comment_text
    click_on 'Update Book comment'

    assert_text 'Book comment was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Book comment' do
    visit book_comment_url(@book_comment)
    click_on 'Destroy this book comment', match: :first

    assert_text 'Book comment was successfully destroyed'
  end
end
