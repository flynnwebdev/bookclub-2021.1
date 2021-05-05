class BooksController < ApplicationController
    def index
        @books = Book.order(:title)
    end

    def show
        @book = Book.find(params[:id])
    end
end
