class BookComment < ApplicationRecord
  belongs_to :book
  belongs_to :client

  def self.ransackable_associations(_auth_object = nil)
    %w[book client]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[book_id client_id comment_text created_at id id_value updated_at]
  end
end
