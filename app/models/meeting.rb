class Meeting < ApplicationRecord
  belongs_to :client, class_name: Client, foreign_key: :client_id, autosave: true
end
