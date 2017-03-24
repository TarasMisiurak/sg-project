class PostsController < ApplicationController

	def index
		@posts = Post.order('created_at DESC')
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to @post
		else
			flash.now[:alert] = "Error creating post!"
			render :new
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find_by_id(params[:id])
		if @post.update_attributes(post_params)
			flash.now[:alert] = "Successfully updated #{@post.title} post!"
			redirect_to @post
		else
			flash.now[:alert] = "Error updating #{@post.title} post!"
			render :edit
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def destroy
		if @post.destroy
			flash.now[:notice] = "Successfully deleted post!"
			redirect_to posts_path
		else
			flash.now[:alert] = "Error deleting post!"
		end
	end

	private

	def post_params
		params.require(:post).permit(:title, :body)
	end

end
