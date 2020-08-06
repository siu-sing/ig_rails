class PostsController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :destroy, :update]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new

  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end


  def edit

  end

  def show
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end 
  end

  def destroy
    if @post.destroy
      redirect_to posts_path
    else
      render :index
    end
  end



  private
  def post_params
    params.require(:post).permit(:post_image, :caption)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
