class RelationshipsController < ApplicationController
	before_action :set_user, only: [:create, :destroy]

  def follows
  	@user = User.find(params[:id])
  	@users = @user.follows
  	render :followers
  end

  def followers
  	@user = User.find(params[:id])
  	@users = @user.followers
  	render :followers
  end

  def create
  	following = current_user.follow(@user)
  	if following.save
  		flash[:success] = "ユーザーをフォローしました"
  		redirect_to user_path(@user)
  	else
  		flash.now[:alert] = "ユーザーのフォローに失敗しました"
  		redirect_to user_path(@user)
  	end
  end

  def destroy
  	following = current_user.unfollow(@user)
  	if following.destroy
  		flash[:success] = "ユーザーのフォローを解除しました"
  		redirect_to user_path(@user)
  	else
  		flash.now[:alert] = "ユーザーのフォロー解除に失敗しました"
  		redirect_to user_path(@user)
  	end
  end

  private
  def set_user
  	@user = User.find(params[:relationship][:follow_id])
  end
end
