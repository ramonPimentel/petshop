class AddUsersToMettings < ActiveRecord::Migration[5.0]
  def change
    add_column :meetings, :client_id, :integer
  end
end
