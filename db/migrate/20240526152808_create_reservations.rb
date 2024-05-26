class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.references :book, null: false, foreign_key: true
      t.references :library_card, null: false, foreign_key: true
      t.date :date_of_reservation
      t.integer :requested_days
      t.string :status

      t.timestamps
    end
  end
end
