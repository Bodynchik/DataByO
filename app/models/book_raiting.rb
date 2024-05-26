class BookRaiting < ApplicationRecord
  belongs_to :book
  belongs_to :client

  validates :rating_value, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def self.ransackable_associations(_auth_object = nil)
    %w[book client]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[book_id client_id created_at id id_value rating_value updated_at]
  end
end
