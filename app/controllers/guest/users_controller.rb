class Guest::UsersController < Guest::GuestController

  def login
    
    if request.post?
      #      user = User.find_by(name: params[:user][:name], password: params[:user][:password])
      user = User.find_by(name: params[:user][:name])
      
      if user
        session[:user] = user
        
        if user.type_acronym_id == 200
          return redirect_to '/researcher'
        else
          return redirect_to '/voluntary'
        end
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
        flash[:green] = 'Usuário criado com sucesso.'
        
#        Interaction.send_welcome(1, @user.id)
        
        return redirect_to '/guest/users/login'
      end
    
      flash[:red] = 'Verifique o formulário e tente novamente.'
    else
      @user.contacts.build
      @user.contacts.build
      @user.contacts.build
    end
  end

end
