class BookReview < ApplicationRecord
  belongs_to :book
  belongs_to :library_card
end
