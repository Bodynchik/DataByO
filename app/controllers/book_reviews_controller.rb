class BookReviewsController < InheritedResources::Base

  private

    def book_review_params
      params.require(:book_review).permit(:book_id, :library_card_id, :review_text)
    end

end
