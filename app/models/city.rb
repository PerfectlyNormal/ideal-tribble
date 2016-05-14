class City < ActiveRecord::Base
  validates :name,      presence: true
  validates :latitude,  presence: true, numericality: true
  validates :longitude, presence: true, numericality: true

  def self.search(term)
    where("name ILIKE ?", "#{term}%").first
  end
end