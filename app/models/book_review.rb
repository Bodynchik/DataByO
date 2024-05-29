class BookReview < ApplicationRecord
  belongs_to :book
  belongs_to :library_card

  validates :rating_value, numericality: { greater_than: 0, less_than: 6 }

  def self.ransackable_attributes(_auth_object = nil)
    %w[book_id created_at id id_value rating_value library_card_id review_text updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[book library_card]
  end
end
