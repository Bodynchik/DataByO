class BookGenre < ApplicationRecord
  belongs_to :genre
  belongs_to :book

  def self.ransackable_associations(_auth_object = nil)
    %w[book genre]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[book_id created_at genre_id id id_value updated_at]
  end
end
