class SignatureList < ApplicationRecord
  belongs_to :signatureable, polymorphic: true, optional: true
end
