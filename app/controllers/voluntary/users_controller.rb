class Voluntary::UsersController < ApplicationController

  def logout
    session[:user] = nil
    redirect_to '/guest/users/login'
  end
end
