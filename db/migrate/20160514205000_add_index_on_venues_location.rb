class AddIndexOnVenuesLocation < ActiveRecord::Migration
  def up
    execute %{
      CREATE INDEX index_on_venues_location ON venues USING GIST (
        ST_GeographyFromText(
          'SRID=4326;POINT(' || venues.longitude || ' ' || venues.latitude || ')'
        )
      )
    }
  end

  def down
    execute %{DROP INDEX index_on_venues_location}
  end
end