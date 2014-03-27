class PostsController < ApplicationController

	def index
		@user = User.find(params[:user_id])
		@posts = @user.posts.all
	end

	def show
		@user = User.find(params[:user_id])
		@post = Post.find(params[:id])
	end

	def destroy
		@post = Post.where(id: params[:id]).first
		if @post && @post.destroy
			flash[:notice] = "Post deleted sucessfully."
		else
			flash[:alert] = "There was a problem deleting that post."
		end
		redirect_to :back
	end

	def new
		@user = User.find(params[:user_id])
		@post = Post.new
	end

	def create
		@user = User.find(params[:user_id])
		@post = Post.new(params[:user])
		if @post.save
			flash[:notice] = "Your post was created sucessfully."
			redirect_to user_posts_path(@user.id)
		else
			flash[:alert] = "There was a problem submitting your post."
			redirect_to new_user_post_path(@user.id)
		end
	end

end