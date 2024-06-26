class CreateBookReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :book_reviews do |t|
      t.references :book, null: false, foreign_key: true
      t.references :library_card, null: false, foreign_key: true
      t.string :review_text

      t.timestamps
    end
  end
end
