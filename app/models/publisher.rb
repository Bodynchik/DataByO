class Publisher < ApplicationRecord
  has_many :books, dependent: :nullify

  validates :publisher_name, presence: true, uniqueness: true

  def self.ransackable_associations(_auth_object = nil)
    ['books']
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id id_value publisher_name updated_at]
  end
end
