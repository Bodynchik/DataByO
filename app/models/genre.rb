class Genre < ApplicationRecord
  has_many :book_genres, dependent: :destroy
  has_many :books, through: :book_genres

  validates :genre_name, presence: true, uniqueness: true

  def self.ransackable_associations(_auth_object = nil)
    %w[book_genres books]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at genre_name id id_value updated_at]
  end
end
