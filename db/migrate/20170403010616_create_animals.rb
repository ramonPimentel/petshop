class CreateAnimals < ActiveRecord::Migration[5.0]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :species
      t.string :race
      t.string :sexy
      t.integer :client_id
      t.timestamps
    end
  end
end
