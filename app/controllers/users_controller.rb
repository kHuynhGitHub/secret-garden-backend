class UsersController < ApplicationController
  
  def index
    users = User.all
    if (users.length > 1)
      final_json = { json: users, :include => {
            :books => { :except => [:created_at, :updated_at] }
          },
          :except => [:created_at, :updated_at]
      }
    else
      final_json = { json: {"status": 204, "message": "No users available."} }
    end
    render(final_json)
  end

  def show
    # user = find_user
    user = find_user_by_username
    if user
      final_json = { json: user, :include => {
        :books => { :except => [:created_at, :updated_at] }
      }, :except => [:created_at, :updated_at] }
    else
      final_json = { json: get_404_error_msg }
    end
    render(final_json)
  end

  # TODO: make this co-exist with with 'show'
  def show_username
    user = find_user_by_username
    if user
      final_json = { json: user, :include => {
        :books => { :except => [:created_at, :updated_at] }
      }, :except => [:created_at, :updated_at] }
    else
      final_json = { json: get_404_error_msg }
    end
    render(final_json)
  end

  def create
    user = User.new(user_params)
    if user.save
      final_json = { json: {
          "status": 201,
          "message": "User created successfully",
          "data": user
        }
      }
    else
      final_json = { json: {
        "status": 422,
        "errors": user.errors,
        "error_codes": user.errors.keys.map { |f| "#{f.upcase}_ERROR" }
      } }
    end
    render(final_json)
  end

  def update
    user = find_user
    if user
      # User found, proceed with other operations on it...
      user.update(user_params)
      if user.valid?
        final_json = { json: {
            "status": 204,
            "message": "User updated successfully",
            "data": user
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
    user = find_user
    if user
      # User found, proceed with other operations on it...
      if user.destroy
        final_json = { json: { "status": 204, "message": "User '#{user.username}', successfully deleted." } }
      else
        final_json = { json: get_404_error_msg("Unable to delete user '#{user.username}'.") }
      end
    else
      final_json = { json: get_404_error_msg }
    end
    render(final_json)
  end

  private
    def user_params
      params.require(:user).permit(:username)
    end

    def find_user
      User.find_by(id: params[:id])
    end

    def find_user_by_username
      User.where(["LOWER(username) = ?", params[:username].downcase])
    end

    def get_404_error_msg(msgTxt = "User not found.")
      return { "status": 404, "message": msgTxt };
    end

end
