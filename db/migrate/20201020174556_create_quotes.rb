class CreateQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :quotes do |t|
      t.integer :index
      t.integer :likes
      t.belongs_to :user

      t.timestamps
    end
    #add_index :quotes, :user_id
  end
end
