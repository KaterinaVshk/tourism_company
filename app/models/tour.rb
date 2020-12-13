class Tour < ApplicationRecord
  has_one :locales
  has_one :hotel
  has_one_attached:image
end
