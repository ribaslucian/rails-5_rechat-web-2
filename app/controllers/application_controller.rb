class ApplicationController < ActionController::Base
  
  before_action :logged?

  def d param
    # do something then render view for process_one
    render json: JSON.pretty_generate(JSON.parse(param.to_json))
  end

  def logged?
    
    type_user_namespace = {
      200 => 'researcher',
      201 => 'voluntary'
    }
    
    # obter hirarquia do usuario
    if session[:user] != nil
      user_hierarchy = type_user_namespace[session[:user]['type_acronym_id']]
    else
      user_hierarchy = 'guest'
    end
    
    # obter hirarquia da rota
    namespaces = controller_path.split('/')
    namespace = namespaces.first
    
    if namespace != user_hierarchy
      redirect_to "/#{user_hierarchy}"
    end
    
    # setar hirarquia baseado na sessao
    # verificar se esta logado

    # esta acessando uma area da sua hierarquia ?
    # se nao mandar para sua area home
    
    
    
    
    
    #    return d Message.all
    
    
    #    flash[:blue] = 'verifique o formulário'

    
    #    namespaces = controller_path.split('/')
    #    namespace = namespaces.first
    #    
    #    if namespace == 'guest' && session[:user] != nil
    #      return redirect_to '/researcher'
    #    end
    #    
    #    if namespace == 'researcher' && session[:user] == nil
    #      flash[:red] = 'Você não está conectado.'
    #      return redirect_to '/guest'
    #    end
    #    
    #    
    #    if session[:user] != nil && !User.exists?(session[:user]['id'])
    #      session[:user] = nil
    #      return redirect_to '/guest'
    #    end
      
  end
  
end
