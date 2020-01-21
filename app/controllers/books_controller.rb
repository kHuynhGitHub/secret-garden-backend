class BooksController < ApplicationController
  
  def index
    books = Book.all

    render json: books, :include => {
      :users => { :only => :username }
      }, :except => [:created_at, :updated_at] 
  end

end
