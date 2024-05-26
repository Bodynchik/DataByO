json.extract! book, :id, :book_title, :publisher_id, :book_year_of_pub, :isbn, :book_amount, :book_age_rating, :book_rating, :created_at, :updated_at
json.url book_url(book, format: :json)
