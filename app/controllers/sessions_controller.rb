class SessionsController < ApplicationController
  before_action :find_user

  def new
  end

  def create
    name = params[:user_name]

    if @user
      flash[:success] = "Successfully logged in as existing user #{name}"
      session[:user_id] = @user.id
    else
      user = User.create(username: name)
      session[:user_id] = user.id
      flash[:error] = "Successfully created new user #{name} with ID #{user.id}"
    end

    redirect_to works_path
  end

  def logout
    session[:user_id] = nil
    flash[:success] = "Successfully logged out"
    redirect_to home_path
  end

  private

  def find_user
     @user = User.find_by(username: params[:user_name]  )
  end

end
