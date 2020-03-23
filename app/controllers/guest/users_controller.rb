class Guest::UsersController < ApplicationController

  def login
    
    
    if request.post?
      
      user = User.find_by(name: params[:user][:name], password: params[:user][:password])
      
      if user
        session[:user] = user
        redirect_to '/researcher/dashboard/index'
      end
    end
  end

  def logout
    session[:user] = nil
    redirect_to '/guest/users/login'
  end
  
  def sign_in
    @user = User.new request.params[:user]
    
    if request.post?
      if @user.save
        redirect_to '/guest/users/login'
      end
    end
  end

end
