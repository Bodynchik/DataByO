class ReturnsController < InheritedResources::Base

  private

    def return_params
      params.require(:return).permit(:book_id, :library_card_id, :date_of_return)
    end

end
