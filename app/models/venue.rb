class Venue < ActiveRecord::Base
  validates :name, presence: true

  def self.search_by_city(query)
    # https://robb.weblaws.org/2013/12/05/yes-rails-supports-case-insensitive-database-queries/
    where(arel_table[:city].matches("#{query}%"))
  end

  def has_address?
    full_address.present?
  end

  def has_coordinates?
    latitude.present? && longitude.present?
  end
end
