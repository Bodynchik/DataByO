class Book < ApplicationRecord
  belongs_to :publisher

  has_many :book_authors, dependent: :destroy
  has_many :authors, through: :book_authors

  has_many :book_genres, dependent: :destroy
  has_many :genres, through: :book_genres

  has_many :book_reviews, dependent: :destroy
  has_many :borrowed_books, dependent: :destroy
  has_many :returns, dependent: :destroy

  has_one_attached :book_image, dependent: :destroy

  validates :book_title, presence: true
  validates :isbn, presence: true, uniqueness: true
  validates :book_year_of_pub, presence: true, numericality: { greater_than_or_equal_to: 1900 }
  validates :book_amount, presence: true, numericality: { greater_than: 0 }
  validates :book_age_rating, presence: true
  validates :book_rating, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :authors, presence: { message: 'select, please' }
  validates :genres, presence: { message: 'select, please' }
  validate :acceptable_image

  def acceptable_image
    return unless book_image.attached?

    if book_image.blob.byte_size > 3.megabytes
      errors.add(:book_image, 'is too big')
    elsif !book_image.blob.content_type.in?(%w[image/jpeg image/png])
      errors.add(:book_image, 'must be a JPEG or PNG')
    end
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[authors book_authors book_genres genres publisher]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[book_age_rating book_amount book_rating book_title book_year_of_pub created_at id id_value isbn publisher_id updated_at]
  end
end
