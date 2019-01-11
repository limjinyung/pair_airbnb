class ListingsController < ApplicationController

	def home
		@view_listing = Listing.all
  	end

  	def new
  		@listing = Listing.new
  	end

  	def create
  		listing = Listing.new(listing_params)
  		listing.user_id = current_user.id
  		
  		if listing.save 
  			redirect_to home_path
  		else
  			p 'failed to add listing'
  			redirect_to new_listing_path
  		end
  	end


  	private

  	def listing_params
  		params.require(:listing).permit(:address, :postcode, :states, :ratings)
  	end

end
