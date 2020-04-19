class Guest::UsersController < ApplicationController

  def login
    
    if request.post?
#      user = User.find_by(name: params[:user][:name], password: params[:user][:password])
      user = User.find_by(name: params[:user][:name])
      
      if user
        session[:user] = user
        return redirect_to '/researcher/dashboard/index'
      end
      
      flash[:orange] = 'Não foi encontrado a combinação usuário e senha informado.'
    end
  end

  def logout
    session[:user] = nil
    redirect_to '/guest/users/login'
  end
  
  def sign_in
    @user = User.new request.params[:user]
    
    if request.post?
      if @user.save!
        flash[:green] = 'Usuário criato com sucesso.'
        return redirect_to '/guest/users/login'
      end
    
      flash[:red] = 'Verifique o formulário e tente novamente.'
    end
  end

end
