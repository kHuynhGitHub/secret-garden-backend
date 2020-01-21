class UsersController < ApplicationController
  
  def index
    users = User.all
    render(json: users, :include => {
      :books => { :except => [:created_at, :updated_at] }
    }, :except => [:created_at, :updated_at] )
  end

  def show
    user = User.find_by(id: params[:id])
    render json: user
  end

end
