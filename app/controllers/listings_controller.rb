class ListingsController < ApplicationController

	def index
		@view_listing = Listing.all
  	end

  	def new
  		@listing = Listing.new

  		if current_user.customer?
			flash[:notice] = "Sorry. You are not allowed to perform this action."
        redirect_to root_url, notice: "Sorry. You do not have the permissino to verify a property."
      	end
  	end

  	def create
  		listing = Listing.new(listing_params)
  		listing.user_id = current_user.id
  		
  		if listing.save 
  			redirect_to root_url
  		else
  			p 'failed to add listing'
  			redirect_to new_listing_path
  		end
  	end

  	def show
  		@listing = Listing.find(params[:id])
  	end


  	private

  	def listing_params
  		params.require(:listing).permit(:address, :postcode, :states, :ratings, {images: []})
  	end

end
