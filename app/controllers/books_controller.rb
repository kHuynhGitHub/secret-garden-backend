class BooksController < ApplicationController
  
  def index
    books = Book.all

    render json: books, :include => {
      :users => { :only => :username },
      :bookcases => { :except => [:created_at, :updated_at] }
      }, :except => [:created_at, :updated_at]
  end

end
