class LocationService < ApplicationRecord
  belongs_to :location_serviceable, polymorphic: true, optional: true
end
