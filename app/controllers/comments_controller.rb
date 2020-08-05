class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
    # @post = Post.find(params[:post_id])
    
  end

  def edit
    @comment = Comment.find(params[:id])
    # @post = Post.find(params[:post_id])
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to comments_path
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy
    redirect_to comments_path
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to comments_path
    else
      render :new
    end
  end
    
  private
    def comment_params
      params.require(:comment).permit(:comment_text, :post_id)
    end
end
