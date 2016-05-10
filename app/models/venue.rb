class Venue < ActiveRecord::Base
  reverse_geocoded_by :latitude, :longitude do |obj, results|
    if geo = results.first
      obj.full_address   = geo.address
      obj.street_address = geo.street_address
      obj.city           = geo.city
      obj.postal_code    = geo.postal_code
      obj.country        = geo.country
    end
  end

  validates :name, presence: true

  after_validation :reverse_geocode,
                   if: lambda{|venue| !venue.has_address? && venue.has_coordinates? }

  def has_address?
    full_address.present?
  end

  def has_coordinates?
    latitude.present? && longitude.present?
  end
end
