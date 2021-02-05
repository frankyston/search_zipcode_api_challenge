class Address < ApplicationRecord
  validates :zipcode, :state, :city, presence: true
end
