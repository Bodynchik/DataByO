class ReservationsController < InheritedResources::Base

  private

    def reservation_params
      params.require(:reservation).permit(:book_id, :library_card_id, :date_of_reservation, :requested_days, :status)
    end

end
