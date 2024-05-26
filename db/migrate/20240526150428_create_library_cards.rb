class CreateLibraryCards < ActiveRecord::Migration[7.1]
  def change
    create_table :library_cards do |t|
      t.references :client, null: false, foreign_key: true
      t.integer :max_reserve_allowed
      t.integer :max_borrow_allowed

      t.timestamps
    end
  end
end
