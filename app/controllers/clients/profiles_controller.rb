class Clients::ProfilesController < ApplicationController
  before_action :authenticate_client!

  def show
    @tab = params[:tab] || 'personal'
  end

  def edit
    @client = current_client
  end

  def update
    @client = current_client
    if @client.update(client_params)
      redirect_to clients_profile_path(tab: 'personal')
    else
      redirect_to clients_profile_path(tab: 'personal')
    end
  end

  private

  def client_params
    params.require(:client).permit(:name, :surname, :midname, :phone, :email)
  end
end