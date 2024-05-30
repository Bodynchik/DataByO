class RemoveFromLibraryCardsMaxReserveAllowed < ActiveRecord::Migration[7.1]
  def change
    remove_column :library_cards, :max_reserve_allowed, :integer
  end
end
