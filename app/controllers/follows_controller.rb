class FollowsController < ApplicationController
  before_action :new_follow, only: [:new, :create, :show]

  def index
    @follows = Follow.all
  end

  def create
    # p current_user
    # p params[:user_id]
    @follow = Follow.new(follower_id: current_user.id, followed_user_id: params[:user_id])
    if @follow.save
      redirect_to user_path(User.find(params[:user_id]))
    else
      render :new
    end
  end

  def new
    @follow = Follow.new
  end

  def edit
  end

  def show
    #SHOW LIST OF FOLLOWERS
    @followers = @user.followers
    @followings = @user.followings
  end

  private

  def new_follow
    @user = User.find(params[:user_id])
  end

  def follow_params
    params.require(:artist).permit(:follower_id, :followed_user_id)
  end
end
