json.extract! reservation, :id, :book_id, :library_card_id, :date_of_reservation, :requested_days, :status, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
