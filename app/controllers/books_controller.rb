class BooksController < ApplicationController

    def index
        books = Book.all
        render json: BookSerializer.new(books).to_serialized_json
    end

    


    private

    def book_params
        params.require(:book).permit(:title, :num_of_pages, :genre_id, :author_id)
    end


end
