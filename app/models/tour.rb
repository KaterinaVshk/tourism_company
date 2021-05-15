class Tour < ApplicationRecord
  has_one_attached :image
  validates :name,
            :kind,
            :country,
            :nights,
            :price,
            presence: true
  has_many :oders
  has_many :comments
end
