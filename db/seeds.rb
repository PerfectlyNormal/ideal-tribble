# This should be handled a bit better, as every record creation
# triggers a reverse lookup of the latitude and longitude, and
# can easily hit all sorts of rate limiting in various available APIs.

venues = JSON.parse(File.read(Rails.root.join("db/venues.json")))
venues.each do |source|
  Venue.create({
    name:      source["name"],
    latitude:  source["lat"],
    longitude: source["lng"]
  })
end

City.create(name: "Stockholm", latitude: 59.3293, longitude: 18.0686)
City.create(name: "London",    latitude: 51.5074, longitude:  0.1278)