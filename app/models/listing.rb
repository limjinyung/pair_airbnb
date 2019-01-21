class Listing < ApplicationRecord
	belongs_to :user
	has_many :reservations

	scope :city, -> (city) {where(city: city)}
	scope :state, -> (state) {where(state: state)}
	scope :p_type, -> (p_type) {where(property_type: p_type)}
	scope :b_number, -> (b_num) { where(bed_number: b_um) }
	scope :r_number, -> (r_num) { where(room_number: r_um) }

	include PgSearch
  	pg_search_scope :search_by_city, :against => [:city, :state]

	mount_uploaders :images, ImageUploader

	def self.search(search_params)
		if search_params
			Listing.where("city ilike ? AND state ilike ? AND property_type = ? AND bed_number = ? AND room_number = ? ", "%#{search_params[:city]}%", "%#{search_params[:state]}%", search_params[:property_type], search_params[:bed_number], search_params[:room_number])
		else
			Listing.all
		end
	end

end