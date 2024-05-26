json.extract! book_genre, :id, :genre_id, :book_id, :created_at, :updated_at
json.url book_genre_url(book_genre, format: :json)
