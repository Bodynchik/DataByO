class LibraryCard < ApplicationRecord
  belongs_to :client

  has_many :book_reviews, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :borrowed_books, dependent: :destroy
  has_many :returns, dependent: :destroy
end
