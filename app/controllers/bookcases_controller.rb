class BookcasesController < ApplicationController
  
  def index
    bookcases = Bookcase.all
    if (bookcases.length > 1)
      final_json = { json: bookcases,
          :except => [:created_at, :updated_at]
      }
    else
      final_json = { json: {"status": 204, "message": "No bookcases available."} }
    end
    render(final_json)
  end

  def show
    bookcase = find_bookcase
    if bookcase
      final_json = { json: bookcase, :except => [:created_at, :updated_at] }
    else
      final_json = { json: get_404_error_msg }
    end
    render(final_json)
  end

  def create
    bookcase = Bookcase.new(bookcase_params)
    if bookcase.save
      final_json = { json: {
          "status": 201,
          "message": "Bookcase created successfully",
          "data": bookcase
        }
      }
    else
      final_json = { json: {
        "status": 422,
        "errors": bookcase.errors,
        "error_codes": bookcase.errors.keys.map { |f| "#{f.upcase}_ERROR" }
      } }
    end
    render(final_json)
  end

  def update
    bookcase = find_bookcase
    if bookcase
      # Bookcase found, proceed with other operations on it...
      bookcase.update(bookcase_params)
      if bookcase.valid?
        final_json = { json: {
            "status": 204,
            "message": "Bookcase updated successfully",
            "data": bookcase
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
    bookcase = find_bookcase
    if bookcase
      # Bookcase found, proceed with other operations on it...
      if bookcase.destroy
        final_json = { json: { "status": 204, "message": "Bookcase successfully deleted." } }
      else
        final_json = { json: get_404_error_msg("Unable to delete bookcase.") }
      end
    else
      final_json = { json: get_404_error_msg }
    end
    render(final_json)
  end

  private
    def bookcase_params
      params.permit(:book_id, :user_id)
    end

    def find_bookcase
      Bookcase.find_by(id: params[:id])
    end

    def get_404_error_msg(msgTxt = "Bookcase not found.")
      return { "status": 404, "message": msgTxt };
    end

end
