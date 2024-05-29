class LibraryCardsController < InheritedResources::Base
  def create
    @library_card = LibraryCard.new(library_card_params)
    @library_card.save
    redirect_to clients_profile_path(tab: 'card')
  end

  private

  def library_card_params
    params.require(:library_card).permit(:client_id, :max_reserve_allowed, :max_borrow_allowed)
  end
end
