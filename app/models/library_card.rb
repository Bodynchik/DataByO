class LibraryCard < ApplicationRecord
  belongs_to :client

  has_many :book_reviews, dependent: :destroy
  has_many :borrowed_books, dependent: :destroy
  has_many :returns, dependent: :destroy

  validates :max_borrow_allowed, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :max_reserve_allowed, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def self.ransackable_associations(_auth_object = nil)
    %w[book_reviews borrowed_books client reservations returns]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[client_id created_at id id_value max_borrow_allowed max_reserve_allowed updated_at]
  end
end
