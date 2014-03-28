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
		@post = Post.new
		@user = User.find(params[:user_id])
	end

	def create
		@post = Post.new(params[:post])
		@post.user_id = params[:user_id]
		if @post.save
			flash[:notice] = "Your post was created sucessfully."
			redirect_to user_posts_path(@post.user)
		else
			flash[:alert] = "There was a problem submitting your post."
			redirect_to new_user_post_path(@post.user)
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update_attributes(params[:post])
			flash[:notice] = "Your post was updated sucessfully."
			redirect_to user_post_path(@post.user, @post)
		else
			flash[:alert] = "There was a problem updating your post."
			redirect_to :back
		end
	end

end