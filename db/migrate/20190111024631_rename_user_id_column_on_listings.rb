class RenameUserIdColumnOnListings < ActiveRecord::Migration[5.2]
  def change
  	remove_column :listings, :uid, :string

  	add_reference :listings, :user, foreign_key: true
  end
end
