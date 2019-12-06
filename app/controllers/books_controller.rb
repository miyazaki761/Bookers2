class BooksController < ApplicationController

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = curret_user.id
		if @book.save
		  redirect_to books_path
		else
			render :new
		end
	end

	def index
		@books = Book.all
	end

	def show
		@book = Book.find(@params[:id])
	end

end
