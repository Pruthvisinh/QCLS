class ChangeService < ApplicationRecord
  belongs_to :change_serviceable, polymorphic: true, optional: true
end
