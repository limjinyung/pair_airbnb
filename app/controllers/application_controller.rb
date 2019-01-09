class ApplicationController < ActionController::Base
  include Clearance::Controller

  def index
  end

  # def new
  # end

  # def create
  # 	@user = User.new(params[:user])
  # 	if @user.save 
  # 		redirect_to user_path(@user.id)
  # 	else
  # 		render :new
  # 	end
  # end
end
