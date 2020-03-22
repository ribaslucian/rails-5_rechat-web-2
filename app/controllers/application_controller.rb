class ApplicationController < ActionController::Base
  
  before_action :logged?

  def d param
    # do something then render view for process_one
    render json: JSON.pretty_generate(JSON.parse(param.to_json))
  end

  def logged?
    
    #    return d Entity.first.cards.first.code
    
    # transacionando Vale Presente
    #    Transfer.transaction do
    #      card = Card.find_by_code(params[:code])
    #      
    #      Transfer.create(
    #        origin_entity_id: '1b091b87-c74f-414d-bbf5-dc3af6586f4a', # loja
    #        destiny_entity_id: params[:destiny_id], # revo | Card.issuer_id
    #        card_id: '',
    #        value: params[:value],
    #        coin_id: '',
    #        
    #        method_acronym_id: params[:method_acronym_id],    # transacao web
    #        category_acronym_id: 80000,                       # transacao direta
    #        status_acronym_id: 81000,                         # transacao processada
    #      )
    #    end
    #    
    #    if session[:entity].nil?
    #      session[:entity] = {
    #        id: 'b6417740-afb3-42db-bef0-ec0c0e9086ad',
    #        name: 'Liv Funcionário',
    #      }
    #    end

    is_login_route = (request.path == '/' || request.path == '/users/login')
    logged = session[:entity] != nil


    if is_login_route && logged
      redirect_to '/dashboards/index'
    end

    if !logged && !is_login_route
      redirect_to '/users/login'
    end
  end
end
