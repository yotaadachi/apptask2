class RelationshipsController < ApplicationController
	before_action :set_user, only: [:create, :destroy]

  def follows
    @user = User.find(params[:user_id])
  	@users = @user.followings
  end

  def followers
    @user = User.find(params[:user_id])
  	@users = @user.followers
  end

  def create
  	following = current_user.follow(@user)
  	if following.save
  		flash[:success] = "ユーザーをフォローしました"
  		redirect_back(fallback_location: user_path(@user))
  	else
  		flash.now[:alert] = "ユーザーのフォローに失敗しました"
      redirect_back(fallback_location: user_path(@user))
  	end
  end

  def destroy
  	following = current_user.unfollow(@user)
  	if following.destroy
  		flash[:success] = "ユーザーのフォローを解除しました"
      redirect_back(fallback_location: user_path(@user))
  	else
  		flash.now[:alert] = "ユーザーのフォロー解除に失敗しました"
      redirect_back(fallback_location: user_path(@user))
  	end
  end

  private
  def set_user
  	@user = User.find(params[:relationship][:follow_id])
  end
end
