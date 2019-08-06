class PostsController < ApplicationController
    before_action :find_post, only:[:show, :edit, :update,]
    
    def index
		@posts = Post.all
	end

	def show
		# before action
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.new(post_params)
	  @post.save
	  redirect_to post_path(@post)
	end

    def edit
	    # before action
    end
    
    def update
	    # before action
        @post.update(post_params)
        redirect_to post_path(@post)
	end

    private 

    def post_params
        params.require(:post).permit(:title, :description, :post_status, :author_id)
    end

    def find_post
        @post = Post.find_by(id: params[:id])
    end

end