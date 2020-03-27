class ApplicationController < ActionController::Base
  
  before_action :logged?

  def d param
    # do something then render view for process_one
    render json: JSON.pretty_generate(JSON.parse(param.to_json))
  end

  def logged?
    namespaces = controller_path.split('/')
    namespace = namespaces.first
    
    if namespace == 'guest' && session[:user] != nil
      redirect_to '/researcher'
    end
    
    if namespace == 'researcher' && session[:user] == nil
      flash[:red] = 'Você não está conectado.'
      redirect_to '/guest'
    end
  end
  
end
