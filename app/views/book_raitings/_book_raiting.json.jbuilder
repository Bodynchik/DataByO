json.extract! book_raiting, :id, :book_id, :client_id, :rating_value, :created_at, :updated_at
json.url book_raiting_url(book_raiting, format: :json)
