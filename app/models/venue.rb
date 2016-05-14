class Venue < ActiveRecord::Base
  validates :name, presence: true

  scope :close_to, -> (latitude, longitude, distance_in_meters = 20000) {
    where(%{
      ST_DWithin(
        ST_GeographyFromText(
          'SRID=4326;POINT(' || venues.longitude || ' ' || venues.latitude || ')'
        ),
        ST_GeographyFromText('SRID=4326;POINT(%f %f)'),
        %d
      )
    } % [longitude, latitude, distance_in_meters])
  }

  def self.in_city(lookup)
    city = City.search(lookup)

    if city
      close_to(city.latitude, city.longitude)
    else
      []
    end
  end
end