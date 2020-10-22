class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :telegram_id
      t.integer :interaction_number

      t.timestamps
    end
  end
end
