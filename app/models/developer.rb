class Developer < ApplicationRecord
  belongs_to :city

  delegate :name, to: :city, prefix: true

  scope :by_keyword, -> (keyword) { where("title LIKE ?", "%#{keyword}%") unless keyword.blank? }
  scope :by_city, -> (city_id) { where("city_id = ?", city_id) unless city_id.blank? }
end
