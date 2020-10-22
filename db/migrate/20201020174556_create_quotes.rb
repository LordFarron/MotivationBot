class CreateQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :quotes do |t|
      t.integer :index
      t.integer :likes
      t.references :user
      t.timestamps
    end
  end
end
