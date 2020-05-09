class ApplicationController < ActionController::Base
  
  before_action :logged?

  def d param
    # do something then render view for process_one
    render json: JSON.pretty_generate(JSON.parse(param.to_json))
  end

  def logged?
    
    
    # > verificar se a mensagem eh de um voluntario | destino_user_id = 0
    # >> obter ultima mensagem enviada na conversa
    # >>> verificar se a ultima foi enviada pelo pesquisador e eh de alguma interacao
    # >>>> selectionar a proxima mensagem da interacao e enviar
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    return d ''

    if params[:message_create]
      Message.seed_test
      return d Message.all.count
    end
    
    
    if params[:messages]
      return d Message.all
    end
    
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
  end
  
end
