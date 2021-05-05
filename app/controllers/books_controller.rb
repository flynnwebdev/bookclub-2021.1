class BooksController < ApplicationController
    before_action :set_book, only: [:update, :show, :destroy, :edit]

    def index
        @books = Book.order(:title)
    end

    def show
    end

    def new
        @book = Book.new
        @authors = Author.order(:last_name)
    end

    def create
        @authors = Author.order(:last_name)
        @book = Book.new(book_params)
        if @book.save
            redirect_to @book
        else
            flash.now[:errors] = @book.errors.full_messages
            render action: 'new'
        end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def set_book
        @book = Book.find(params[:id])        
    end

    def book_params
        params.require(:book).permit(:title, :author_id)
    end
end
