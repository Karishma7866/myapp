class BooksController < ApplicationController
    before_action :get_book, only: [:show, :update, :destroy, :publish_book]#filter
    def create
        book = current_user.books.new(book_params)
        if book.save
            render json: book
        else
            render json: {error: "book not inserted"}
        end
    end
    def index
       @books = current_user.books
        render json: @books
    end
    def show
        #book = current_user.books.find_by(id: params[:id])
        if @book.present?
            render json: @book
        else
            render json: {error: 'book not found'}
        end
    end
    def update
        #book = current_user.books.find_by(id: params[:id])
        if @book.present?
            @book.update(book_params)
            render json: {message: "record updated"}
        else
            render json: {error: "record not updated"}
        end
    end
    def destroy
        #book = current_user.books.find_by(id: params[:id])
        if @book.present?
            @book.destroy
            render json: {message: "record deleted"}
        else
            render json: {error: "record not deleted"}
        end
    end
    def publish_book #member routes
        if @book.present?
            @book.update_columns(status: "published")
            render json: @book, message: "book is published"
        else
            render json: {error: 'book is not published'}
        end

    end
    def all_publish_book #collection routes
        all_book = Book.where(status: "published")
        render json: all_book
    end
    def all_draft_book #collection routes
        all_book = Book.where(status: "draft")
        render json: all_book
    end
    private
    def book_params
        params.require(:books).permit(:title, :discription, :user_id, :status)
    end
    def get_book
        @book = current_user.books.find_by(id: params[:id])
    end


end
