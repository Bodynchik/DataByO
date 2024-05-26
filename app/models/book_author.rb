class BookAuthor < ApplicationRecord
  belongs_to :author
  belongs_to :book

  def self.ransackable_associations(_auth_object = nil)
    %w[author book]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[author_id book_id created_at id id_value updated_at]
  end
end
