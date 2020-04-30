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
  end
  
end
