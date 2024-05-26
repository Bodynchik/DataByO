json.extract! borrowed_book, :id, :book_id, :library_card_id, :date_borrowed, :date_due, :status, :created_at, :updated_at
json.url borrowed_book_url(borrowed_book, format: :json)
