class Client < ApplicationRecord

  has_many :animals, class_name: Animal, foreign_key: :client_id
end
