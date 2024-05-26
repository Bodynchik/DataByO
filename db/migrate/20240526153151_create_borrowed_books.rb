class CreateBorrowedBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :borrowed_books do |t|
      t.references :book, null: false, foreign_key: true
      t.references :library_card, null: false, foreign_key: true
      t.date :date_borrowed
      t.date :date_due
      t.string :status

      t.timestamps
    end
  end
end
