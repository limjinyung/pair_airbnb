class ListingsController < ApplicationController

	def index
      @view_listing = Listing.all.paginate(:page => params[:page], :per_page => 15)
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

    def search 
      @search_listing = Listing.new
    end


    def advance_search
      @view_listing = Listing.search(search_params).paginate(:page => params[:page], :per_page => 15)
      render "index"
    end

    def index_search
      @view_listing = Listing.search_by_city(index_params[:city]).paginate(:page => params[:page], :per_page => 15)
      render "index"
      if @view_listing = "" 
        return root_url, notice: "It's empty"
      end
    end

    def auto_search
      @cities = Listing.search_city(params[:city])
      respond_to do |format|
        format.json { render json: @cities }
        format.js
      end
    end

  	private

  	def listing_params
  		params.require(:listing).permit(:country, :state, :city, :postcode, :address, :property_type, :room_number, :bed_number, :guest_number, :tags, :price, :description, {images: []})
  	end

    def search_params
      params.require(:listing).permit(:state, :city, :property_type,:bed_number, :room_number)
    end

    def index_params
    params.require(:listing).permit(:city) 
    end

end
