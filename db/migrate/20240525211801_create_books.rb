class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :book_title
      t.references :publisher, null: false, foreign_key: true
      t.integer :book_year_of_pub
      t.string :isbn
      t.integer :book_amount
      t.integer :book_age_rating
      t.float :book_rating

      t.timestamps
    end

    add_index :books, :isbn, unique: true
  end
end
