require "application_system_test_case"

class ReservationsTest < ApplicationSystemTestCase
  setup do
    @reservation = reservations(:one)
  end

  test "visiting the index" do
    visit reservations_url
    assert_selector "h1", text: "Reservations"
  end

  test "should create reservation" do
    visit reservations_url
    click_on "New reservation"

    fill_in "Book", with: @reservation.book_id
    fill_in "Date of reservation", with: @reservation.date_of_reservation
    fill_in "Library card", with: @reservation.library_card_id
    fill_in "Requested days", with: @reservation.requested_days
    fill_in "Status", with: @reservation.status
    click_on "Create Reservation"

    assert_text "Reservation was successfully created"
    click_on "Back"
  end

  test "should update Reservation" do
    visit reservation_url(@reservation)
    click_on "Edit this reservation", match: :first

    fill_in "Book", with: @reservation.book_id
    fill_in "Date of reservation", with: @reservation.date_of_reservation
    fill_in "Library card", with: @reservation.library_card_id
    fill_in "Requested days", with: @reservation.requested_days
    fill_in "Status", with: @reservation.status
    click_on "Update Reservation"

    assert_text "Reservation was successfully updated"
    click_on "Back"
  end

  test "should destroy Reservation" do
    visit reservation_url(@reservation)
    click_on "Destroy this reservation", match: :first

    assert_text "Reservation was successfully destroyed"
  end
end
