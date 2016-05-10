class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :street_address
      t.string :city
      t.string :postal_code
      t.string :country
      t.string :full_address
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end