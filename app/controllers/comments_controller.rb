class CommentsController < ApplicationController
    before_action :authenticate_user!

    def index
    @comments = Comment.all
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def show
    @comment = Comment.find(params[:id])
    
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment['user_id'] = current_user.id
    if @comment.update(comment_params)
      redirect_to post_comments_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id]).destroy
    redirect_to post_comments_path(@post)
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment['user_id'] = current_user.id
    if @comment.save
      redirect_to post_comments_path(@post)
    else
      render :new
    end
  end
    
  private
    def comment_params
      params.require(:comment).permit(:comment_text, :post_id, :user_id)
    end
end
