class AddRatingToBookReview < ActiveRecord::Migration[7.1]
  def change
    add_column :book_reviews, :rating_value, :integer
  end
end
