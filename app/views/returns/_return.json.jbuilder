json.extract! return, :id, :book_id, :library_card_id, :date_of_return, :created_at, :updated_at
json.url return_url(return, format: :json)
