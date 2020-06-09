class ServiceType < ApplicationRecord
  has_and_belongs_to_many :users

  default_scope -> { order(id: :asc) }
end
