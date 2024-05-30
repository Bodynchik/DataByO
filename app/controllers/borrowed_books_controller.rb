class BorrowedBooksController < InheritedResources::Base
  def create
    @borrowed_book = BorrowedBook.new(borrowed_book_params)
    @book = @borrowed_book.book
    library_card = current_client.library_card

    if library_card.can_borrow_more_books? && @borrowed_book.save
      Rails.logger.debug @book.book_amount
      Rails.logger.debug
      if @book.book_amount > 1
        @book.update(book_amount: @book.book_amount - 1)
      else
        @book.update(book_amount: 0)

      end
      Rails.logger.debug @book.book_amount
      Rails.logger.debug
      redirect_to book_path(@book), notice: 'Книгу успішно позичено'
    else
      flash.now[:alert] = 'Не вдалося позичити книгу. Можливо, ви досягли ліміту запозичень або книги вже немає в наявності.'
      redirect_to book_path(@book)
    end
  end

  def return_book
    @borrowed_book = BorrowedBook.find(params[:id])
    @book = @borrowed_book.book

    @borrowed_book.update(status: 'Повернено', date_due: Time.zone.now)
    @book.update(book_amount: @book.book_amount + 1)
    redirect_to clients_profile_path(tab: 'borrow')
  end

  private

  def borrowed_book_params
    params.require(:borrowed_book).permit(:book_id, :library_card_id, :date_borrowed, :date_due, :status)
  end
end
