class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    #@comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    #binding.pry
    @post = Post.new(post_params)
   

    if @post.save
     flash[:notice] = "Your post was created!"
     redirect_to posts_path

    # redirect_to root_path, notice: "Your post was created!"
    else
     render :new
    end

  end

  def edit
   # @post = Post.find(params[:id])
  end

  def update
    if @post.update(post_params)
      redirect_to root_path, notice: "Your post was updated!"
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :url)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end