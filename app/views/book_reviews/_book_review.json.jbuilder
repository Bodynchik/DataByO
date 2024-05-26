json.extract! book_review, :id, :book_id, :library_card_id, :review_text, :created_at, :updated_at
json.url book_review_url(book_review, format: :json)
