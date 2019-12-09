class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @book_new = Book.new
    @books = @user.books
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
  end

  def index
    @user = current_user
    @new_book = Book.new
    @users = User.all
    @book = Book.new
  end

  private
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end
end