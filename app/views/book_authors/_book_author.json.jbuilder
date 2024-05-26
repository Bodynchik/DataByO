json.extract! book_author, :id, :author_id, :book_id, :created_at, :updated_at
json.url book_author_url(book_author, format: :json)
