class BooksController < ApplicationController
  
  def index
    books = Book.all
    render json: books, :include => {
      :users => { :only => :username }
      }, :except => [:created_at, :updated_at] 
  end

  def show
    book = Book.find_by(id: params[:id])
    render json: book
  end

end
