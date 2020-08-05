class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :destroy, :update]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new

  end

  def create
    @post = Post.new(post_params)
    #post_params is saying this ONE post

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
  end

  def destroy
    if @post.destroys
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
