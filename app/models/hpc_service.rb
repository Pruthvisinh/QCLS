class HpcService < ApplicationRecord
  belongs_to :hpc_serviceable, polymorphic: true, optional: true
end
