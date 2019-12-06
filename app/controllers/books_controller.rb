class BooksController < ApplicationController

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = curret_user.id
		@book.save
		redirect_to books_path
	end

	def index
	end

	def show
	end

end
