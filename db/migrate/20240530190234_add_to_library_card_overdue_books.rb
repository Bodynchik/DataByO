class AddToLibraryCardOverdueBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :library_cards, :overdue_books, :integer
  end
end
