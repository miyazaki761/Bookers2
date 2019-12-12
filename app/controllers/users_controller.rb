class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :show, :index]
  before_action :correct_user, only: [:edit, :update, :destroy]

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
  	if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user)
    else
      render 'edit'
  end
end

  def index
    @user = current_user
    @new_book = Book.new
    @users = User.all
    @book = Book.new
  end

  def destroy
  end

  def about
  end

  private
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

end