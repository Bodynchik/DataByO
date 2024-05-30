class Clients::ProfilesController < ApplicationController
  before_action :authenticate_client!

  def show
    @book_review = BookReview.new
    @tab = params[:tab] || 'personal'

    if current_client.library_card.present?
      @book_review.library_card_id = current_client.library_card.id

      case @tab
      when 'card'
        @library_card = current_client.library_card
      when 'borrow'
        @borrowed_books = current_client.library_card.borrowed_books.includes(:book)
        @user_reviews = BookReview.where(library_card_id: current_client.library_card.id).pluck(:book_id)
      when 'review'
        @reviews = BookReview.where(library_card_id: current_client.library_card.id).includes(:book)
      end
    else
      @library_card = LibraryCard.new
      @borrowed_books = []
      @user_reviews = []
      @reviews = []
    end
  end

  def edit
    @client = current_client
  end

  def update
    @client = current_client
    @client.update(client_params)
    redirect_to clients_profile_path(tab: 'review')
  end

  private

  def client_params
    params.require(:client).permit(:name, :surname, :midname, :phone, :email)
  end
end
