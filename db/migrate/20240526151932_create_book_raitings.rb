class CreateBookRaitings < ActiveRecord::Migration[7.1]
  def change
    create_table :book_raitings do |t|
      t.references :book, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.float :rating_value

      t.timestamps
    end
  end
end
