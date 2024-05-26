class CreatePublishers < ActiveRecord::Migration[7.1]
  def change
    create_table :publishers do |t|
      t.string :publisher_name

      t.timestamps
    end

    add_index :publishers, :publisher_name, unique: true
  end
end
