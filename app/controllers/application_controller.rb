class ApplicationController < ActionController::Base
  
  before_action :logged?

  def d param
    # do something then render view for process_one
    render json: JSON.pretty_generate(JSON.parse(param.to_json))
  end

  def logged?

    if params[:message_create]
      Message.create!({
          origin_user_id: 2,
          destiny_user_id: 1,
          content: "A nível organizacional, a revolução dos costumes promove a alavancagem do sistema de formação de quadros que corresponde às necessidades.",
          contact_id: 1
      })
    
      Message.create!({
          origin_user_id: 2,
          destiny_user_id: 1,
          content: "A nível organizacional, a revolução dos costumes promove a alavancagem",
          contact_id: 1
      })
    
      Message.create!({
          origin_user_id: 2,
          destiny_user_id: 1,
          content: "aff",
          contact_id: 1
      })
      
      return d Message.all.count
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
