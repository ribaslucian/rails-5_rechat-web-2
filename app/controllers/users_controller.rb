class UsersController < ApplicationController

  def login
    if params[:cpf]

      identification = Identification.find_by_value(params[:cpf])

      if !identification
        flash[:alert] = 'CPF não cadastrado.'
        return render 'users/login'
      end

      password_sha1 = Digest::SHA1.hexdigest params[:password]
      password_md5 = Digest::MD5.hexdigest params[:password]

      user = User.where(entity_id: identification.entity_id).where("
        password_sha1 = '#{password_sha1}'
        OR password_md5 = '#{password_md5}'
      ").first

      if !user
        flash[:alert] = 'Senha inválida.'
        return render '/users/login'
      end

      # verificar se eh um funcionario da liv
      if !Contract.exists? contracted_entity_id: user.entity_id, contractor_entity_id: 'b6417740-afb3-42db-bef0-ec0c0e9086ad'
        flash[:alert] = 'Você não tem autorização.'
        return render 'users/login'
      end

      # login ok
      session[:entity] = {
        id: user.entity_id,
        name: Entity.find(user.entity_id).name,
      }

      redirect_to '/dashboards/index'
    end
  end

  def logout
    session[:entity] = nil
    return render 'users/login'
  end

end
