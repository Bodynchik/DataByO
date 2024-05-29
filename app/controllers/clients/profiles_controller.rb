class Clients::ProfilesController < ApplicationController
  before_action :authenticate_client!

  def show
    @tab = params[:tab] || 'personal'

    case @tab
    when 'card'
      @library_card = current_client.library_card || LibraryCard.new
    when 'borrow'
      @borrowed_books = current_client.library_card.borrowed_books.includes(:book)
    end
  end

  def edit
    @client = current_client
  end

  def update
    @client = current_client
    @client.update(client_params)
    redirect_to clients_profile_path(tab: 'personal')
  end

  private

  def client_params
    params.require(:client).permit(:name, :surname, :midname, :phone, :email)
  end
end
