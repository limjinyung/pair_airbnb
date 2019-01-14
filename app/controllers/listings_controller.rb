class ListingsController < ApplicationController

	def home
		@view_listing = Listing.all
  	end

  	def new
  		@listing = Listing.new

  		if current_user.customer?
			flash[:notice] = "Sorry. You are not allowed to perform this action."
        redirect_to home_path, notice: "Sorry. You do not have the permissino to verify a property."
      	end
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
