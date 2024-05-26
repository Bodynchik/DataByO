class ChangeFieldBookAgeRating < ActiveRecord::Migration[7.1]
  def up
    change_column :books, :book_age_rating, :string
  end

  def down
    change_column :books, :book_age_rating, :integer
  end
end
