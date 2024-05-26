require 'application_system_test_case'

class LibraryCardsTest < ApplicationSystemTestCase
  setup do
    @library_card = library_cards(:one)
  end

  test 'visiting the index' do
    visit library_cards_url
    assert_selector 'h1', text: 'Library cards'
  end

  test 'should create library card' do
    visit library_cards_url
    click_on 'New library card'

    fill_in 'Client', with: @library_card.client_id
    fill_in 'Max borrow allowed', with: @library_card.max_borrow_allowed
    fill_in 'Max reserve allowed', with: @library_card.max_reserve_allowed
    click_on 'Create Library card'

    assert_text 'Library card was successfully created'
    click_on 'Back'
  end

  test 'should update Library card' do
    visit library_card_url(@library_card)
    click_on 'Edit this library card', match: :first

    fill_in 'Client', with: @library_card.client_id
    fill_in 'Max borrow allowed', with: @library_card.max_borrow_allowed
    fill_in 'Max reserve allowed', with: @library_card.max_reserve_allowed
    click_on 'Update Library card'

    assert_text 'Library card was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Library card' do
    visit library_card_url(@library_card)
    click_on 'Destroy this library card', match: :first

    assert_text 'Library card was successfully destroyed'
  end
end
