class RemoveCachedLocationData < ActiveRecord::Migration
  def change
    remove_columns :venues, :city, :country, :full_address, :street_address, :postal_code
  end
end