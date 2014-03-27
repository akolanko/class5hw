class ProfileController < ApplicationController

	def index
		@user = User.find(params[:user_id])
		@profile = @user.profile
	end

	def edit
		@user = User.find(params[:user_id])
		@profile = Profile.find(params[:id])
	end

	def update
		@profile = Profile.where(id: params[:id]).first
		if @profile && @profile.update_attributes(params[:profile])
			flash[:notice] = "Your profile was updated sucessfully."
		else
			flash[:alert] = "There was a problem updating your profile."
		end
		redirect_to :back
	end

end