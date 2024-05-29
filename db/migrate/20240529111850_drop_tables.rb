class DropTables < ActiveRecord::Migration[7.1]
  def up
    drop_table :book_comments
    drop_table :book_raitings
    drop_table :reservations
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
