class SessionsController < ApplicationController

  ## POST /login
  def create
    user = User.find_by(username: params[:username])
    session[:user_id] = user.id
    render json: user
  end

  ## DELETE /logout
  def destroy
    session.delete :user_id
    head :no_content
  end

  def show
    user = User.find_by(id: session[:user_id])
    if user
      render json: user
    else
      render json: { error: "Not authorized" }, status: :unauthorized
    end
  end

end