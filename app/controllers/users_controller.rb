class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def destroy
		@user = User.where(id: params[:id]).first
		if @user && @user.destroy
			flash[:notice]= "User #{@user.fname} destroyed sucessfully."
		else
			flash[:alert] = "There was a problem destroying that user."
		end
		redirect_to "/users"
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			Profile.create(user_id: @user.id)
			flash[:notice] = "Your account was created sucessfully."
			redirect_to "/"
		else
			flash[:alert] = "There was a problem signing you up."
			redirect_to new_user_path
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.where(id: params[:id]).first
		if @user && @user.update_attributes(params[:user])
			flash[:notice] = "Your information was updated sucessfully."
			redirect_to user_path(@user.id)
		else
			flash[:alert] = "There was a problem updating your information."
			redirect_to :back
		end
	end

	def search
		@users = User.where(email: params[:query])
	end

end