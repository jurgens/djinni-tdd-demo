class Developer < ApplicationRecord
  belongs_to :city

  delegate :name, to: :city, prefix: true
end
