class CreateReturns < ActiveRecord::Migration[7.1]
  def change
    create_table :returns do |t|
      t.references :book, null: false, foreign_key: true
      t.references :library_card, null: false, foreign_key: true
      t.date :date_of_return

      t.timestamps
    end
  end
end
