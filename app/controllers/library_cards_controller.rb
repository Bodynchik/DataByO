class LibraryCardsController < InheritedResources::Base
  def new
    @library_card = LibraryCard.new
  end

  def create
    @library_card = LibraryCard.new(library_card_params)
    @library_card.client = current_client
    @library_card.save
    redirect_to clients_profile_path(tab: 'card')
  end

  private

  def library_card_params
    params.require(:library_card).permit(:client_id, :max_borrow_allowed)
  end
end
