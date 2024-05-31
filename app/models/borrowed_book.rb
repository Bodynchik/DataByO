class BorrowedBook < ApplicationRecord
  belongs_to :book
  belongs_to :library_card

  def self.update_overdue_status
    where("date_due < ? AND status != ?", Time.zone.today, 'Просрочено').find_each do |borrowed_book|
      borrowed_book.update(status: 'Просрочено')
      library_card = borrowed_book.library_card
      library_card.update(overdue_books: library_card.overdue_books + 1)
      library_card.update_max_borrow_limit
    end
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[book_id created_at date_borrowed date_due id id_value library_card_id status updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[book library_card]
  end
end
