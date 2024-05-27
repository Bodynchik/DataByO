class Author < ApplicationRecord
  has_many :book_authors, dependent: :destroy
  has_many :books, through: :book_authors

  validates :author_name, :author_surname, presence: true

  def full_name
    mid_name_initial = author_midname.present? ? "#{author_midname.first.capitalize}." : ''
    "#{author_surname} #{author_name.first.capitalize}. #{mid_name_initial}".strip
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[book_authors books]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[author_midname author_name author_surname created_at id id_value updated_at]
  end
end
