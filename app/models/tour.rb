class Tour < ApplicationRecord
  has_one :locales
  has_one_attached:image
  validates :name,:kind, :country,:nights, 
            :price,presence: true
end
