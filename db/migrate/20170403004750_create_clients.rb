class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.integer :phone
      t.integer :cellphone
      t.string :description

      t.timestamps
    end
  end
end
