class BookRaitingsController < InheritedResources::Base
  private

  def book_raiting_params
    params.require(:book_raiting).permit(:book_id, :client_id, :rating_value)
  end
end
