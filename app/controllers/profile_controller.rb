class ProfileController < ApplicationController

	def index
		@user = User.find(params[:user_id])
		@profile = @user.profile
	end

	def edit
		@profile = Profile.find(params[:id])
	end

	def update
		@profile = Profile.where(id: params[:id]).first
		if @profile && @profile.update_attributes(params[:profile])
			flash[:notice] = "Your profile was updated sucessfully."
			redirect_to user_profile_index_path(@profile.user)
		else
			flash[:alert] = "There was a problem updating your profile."
			redirect_to :back
		end
	end

end