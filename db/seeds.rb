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