class BooksController < ApplicationController
before_action :authenticate_user!, only:[:new, :create, :edit, :update, :index, :show, :destroy ]
before_action :correct_user, only:[:update, :edit, :destroy]
	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			flash[:notice] = "You have creatad book successfully."
			redirect_to book_path(@book)
		else
			@books = Book.all
			@user = current_user
			render :index
		end
	end

	def edit
		 @book = Book.find(params[:id])
		 @book.user_id != current_user.id
	end

	def update
		@book = Book.find(params[:id])
        if @book.update(book_params)
			flash[:notice] = "You have creatad book successfully."
			redirect_to book_path(@book)
		else
			@books = Book.all
			@user = current_user
			render :index
		end
	end

	def index
		@books = Book.all
		@book = Book.new
		@user = current_user
	end

	def show
		@book = Book.find(params[:id])
		@user = @book.user
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	def top
	end


	private
	def book_params
		params.require(:book).permit(:title, :body)
	end

	def correct_user
		@book = Book.find(params[:id])
		unless @book.user == current_user
			redirect_to books_path
		end
	end

end
