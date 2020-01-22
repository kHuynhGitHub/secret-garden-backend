class BooksController < ApplicationController
  
  def index
    books = Book.all
    if (books.length > 1)
      final_json = { json: books, :include => {
            :users => { :only => :username }
          },
          :except => [:created_at, :updated_at]
      }
    else
      final_json = { json: {"status": 204, "message": "No books available."} }
    end
    render(final_json)
  end

  def show
    book = find_book
    if book
      final_json = { json: book, :include => {
        :users => { :only => :username }
      }, :except => [:created_at, :updated_at] }
    else
      final_json = { json: get_404_error_msg }
    end
    render(final_json)
  end

  def create
    book = Book.new(book_params)
    if book.save
      final_json = { json: {
          "status": 201,
          "message": "Book created successfully",
          "data": book
        }
      }
    else
      final_json = { json: {
        "status": 422,
        "errors": book.errors,
        "error_codes": book.errors.keys.map { |f| "#{f.upcase}_ERROR" }
      } }
    end
    render(final_json)
  end

  def update
    book = find_book
    if book
      # Book found, proceed with other operations on it...
      book.update(book_params)
      if book.valid?
        final_json = { json: {
            "status": 204,
            "message": "Book updated successfully",
            "data": book
          }
        }
      else
        final_json = { json: { "status": 400, "message": "Bad request" } }
      end
    else
      final_json = { json: get_404_error_msg }
    end
    render(final_json)
  end

  def destroy
    book = find_book
    if book
      # Book found, proceed with other operations on it...
      if book.destroy
        final_json = { json: { "status": 204, "message": "Book titled '#{book.title}', successfully deleted." } }
      else
        final_json = { json: get_404_error_msg("Unable to delete the book '#{book.title}'.") }
      end
    else
      final_json = { json: get_404_error_msg }
    end
    render(final_json)
  end

  private
    def book_params
      params.require(:book)
        .permit(
          :title,
          :cover_image,
          :author,
          :publisher,
          :page_count,
          :genre,
          :description
        )
    end

    def find_book
      Book.find_by(id: params[:id])
    end

    def get_404_error_msg(msgTxt = "Book not found.")
      return { "status": 404, "message": msgTxt };
    end

end
