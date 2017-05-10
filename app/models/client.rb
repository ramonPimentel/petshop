class Client < ApplicationRecord

  has_many :animals, class_name: Animal, foreign_key: :client_id
  has_many :meetings, class_name: Meeting, foreign_key: :client_id, autosave: true
end
