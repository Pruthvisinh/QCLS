class Company < ApplicationRecord
  has_many :users
  has_many :bsp_trainings
  has_many :llc_services
  has_many :medications
  has_many :medication_counts
  has_many :mars
  has_many :behaviors


  User::ROLES.each do |key, val|
    define_method(:"#{key.to_s}s") do
      self.users.where(role: val)
    end
  end
  # def individuals
  #   self.users.where(admin: false)
  # end
end
