module VenuesHelper
  def static_venue_map(venue)
    image_tag "http://maps.google.com/maps/api/staticmap?size=450x300&sensor=false&zoom=16&markers=#{venue.latitude}%2C#{venue.longitude}"
  end
end
