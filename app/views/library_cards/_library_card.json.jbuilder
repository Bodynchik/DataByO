json.extract! library_card, :id, :client_id, :max_reserve_allowed, :max_borrow_allowed, :created_at, :updated_at
json.url library_card_url(library_card, format: :json)
