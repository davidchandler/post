class CommentsController < ApplicationController
   before_action :require_user

   def vote
    @comment = Comment.find(params[:id])
    @voteexistsc = Vote.where(voteable: @comment, creator: current_user).first
    
   
     if current_user.already_voted_on?(@comment)
      flash[:notice] = "User has already voted!"
      redirect_to post_path(@comment.post)

     else
      Vote.create(voteable: @comment, creator: current_user, vote: params[:vote])
      flash[:notice] = "Your vote was counted."
      redirect_to post_path(@comment.post)
      
     end


  end

  def create
 

    @post = Post.find_by(slug: params[:id])
   # @post = Post.find(params[:post_id])
    @comment = Comment.new(params.require(:comment).permit(:body))
    @comment.post = @post
    #@comment.user = current_user  # just assigns the value, does NOT hit the database.
    @comment.creator = current_user  
    
    if @comment.save
      redirect_to post_path(@post), notice: "Comment was created!"
    else
      render 'posts/show'
    end
  end
end
