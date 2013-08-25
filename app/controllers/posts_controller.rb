class PostsController < ApplicationController
 # before_action :set_post, only: [:show, :edit, :update]
  before_action :set_post, only: [:show, :edit, :update, :vote]
  before_action :require_user, only: [:new, :create, :edit, :update, :vote]
  before_action :require_creator, only: [:edit, :update]
  
  

  def index
    @posts = Post.all
  end

  def show
    #@post = Post.find(params[:id])   #  dont need because of the before_action and def set_post
    @comment = Comment.new
    @categories = Category.all
  end

  def new
    @post = Post.new
  end

  def create
    #binding.pry
    @post = Post.new(post_params)
    #@post.user = current_user
    @post.creator = current_user

   

    if @post.save
      
      flash[:notice] = "Your post was created!"
      redirect_to posts_path

    # redirect_to root_path, notice: "Your post was created!"
    else
     render :new     #  just renders the template, not a redirect back to the new action
    end

  end

  def edit
   #@post = Post.find(params[:id])   #  dont need because of the before_action and def set_post
   render :edit
  end

  def update

   # @post = Post.find(params[:id])    #  dont need because of the before_action and def set_post

    if @post.update(post_params)
      flash[:notice] = "Your post was update!"
      redirect_to post_path(@post)

    else
      render :edit     #  just renders the template, not a redirect back to the edit action
    end
  end

  def vote
      Vote.create(voteable: @post, creator: current_user, vote: params[:vote])
      flash[:notice] = "Your vote was counted."
      redirect_to posts_path
  end
  

  private

  def post_params
    params.require(:post).permit(:title, :description, :url)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def require_creator
   access_denied if @post.creator != current_user
  end
  

  def access_denied
    flash[:error] = "You can't do that!"
    redirect_to root_path
  end
  
end
