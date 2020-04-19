class Researcher::UsersController < ApplicationController

  def logout
    session[:user] = nil
    redirect_to '/guest/users/login'
  end
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    params.permit!
    @user = User.new params[:user]
    
    if @user.save!
      flash[:green] = 'Usuário foi cadastrada, verifique na lista.'
      
      return redirect_to researcher_users_path
    else
      flash[:red] = 'Verifique o formulário e tente novamente.'
    end
    
    return render 'new'
  end
  
  def edit
    params.permit!
    @user = User.find params[:id]
  end
  
  def update
    params.permit!
    @user = User.find params[:user][:id]
    
    if @user.update! params[:user]
      flash[:blue] = 'Usuário foi editada, verifique na lista.'
      
      return redirect_to researcher_users_path
    else
      flash[:red] = 'Verifique o formulário e tente novamente.'
    end
    
    return render 'edit'
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    
    flash[:blue] = 'Registro deletado com sucesso.'

    redirect_to researcher_users_path
  end

  
end
