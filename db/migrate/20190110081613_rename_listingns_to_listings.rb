class RenameListingnsToListings < ActiveRecord::Migration[5.2]
  def self.up
    rename_table :listingns, :listings
  end

  def self.down
    rename_table :listings, :listingns
  end
end
