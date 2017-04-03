class Animal < ApplicationRecord
  belongs_to :client, class_name: Client, autosave: true
end
