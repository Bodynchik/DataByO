require 'application_system_test_case'

class BookRaitingsTest < ApplicationSystemTestCase
  setup do
    @book_raiting = book_raitings(:one)
  end

  test 'visiting the index' do
    visit book_raitings_url
    assert_selector 'h1', text: 'Book raitings'
  end

  test 'should create book raiting' do
    visit book_raitings_url
    click_on 'New book raiting'

    fill_in 'Book', with: @book_raiting.book_id
    fill_in 'Client', with: @book_raiting.client_id
    fill_in 'Rating value', with: @book_raiting.rating_value
    click_on 'Create Book raiting'

    assert_text 'Book raiting was successfully created'
    click_on 'Back'
  end

  test 'should update Book raiting' do
    visit book_raiting_url(@book_raiting)
    click_on 'Edit this book raiting', match: :first

    fill_in 'Book', with: @book_raiting.book_id
    fill_in 'Client', with: @book_raiting.client_id
    fill_in 'Rating value', with: @book_raiting.rating_value
    click_on 'Update Book raiting'

    assert_text 'Book raiting was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Book raiting' do
    visit book_raiting_url(@book_raiting)
    click_on 'Destroy this book raiting', match: :first

    assert_text 'Book raiting was successfully destroyed'
  end
end
