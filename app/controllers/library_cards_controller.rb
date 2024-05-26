class LibraryCardsController < InheritedResources::Base

  private

    def library_card_params
      params.require(:library_card).permit(:client_id, :max_reserve_allowed, :max_borrow_allowed)
    end

end
