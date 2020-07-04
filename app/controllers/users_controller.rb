class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    @user = current_user
    @book_new = Book.new
  end

  def show
    @book = Book.find(params[:id])
  	@user = @book.user
    @book_new = Book.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private 
  def user_params
  params.require(:user).permit(:name, :profile_image)
  end

end
