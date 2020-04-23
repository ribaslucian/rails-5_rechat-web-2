class ApplicationController < ActionController::Base
  
  before_action :logged?

  def d param
    # do something then render view for process_one
    render json: JSON.pretty_generate(JSON.parse(param.to_json))
  end

  def logged?
    
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
