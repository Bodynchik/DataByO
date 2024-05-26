class BorrowedBooksController < InheritedResources::Base
  private

  def borrowed_book_params
    params.require(:borrowed_book).permit(:book_id, :library_card_id, :date_borrowed, :date_due, :status)
  end
end
