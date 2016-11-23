require 'rest-client'
require 'json'

class SessionsController < ApplicationController
  def new
  end

  def create
    ra = params[:ra]
    password = params[:password]

    RestClient.get("176.16.1.30:8080/academico/access_token", {params: {ra: ra, senha: password}}){|response, request, result, &block|
      if response.code == 200
        token = JSON.parse(response)["token"]
        session[:token] = token
        redirect_to evaluations_index_path, notice: "Login efetuado com sucesso!"
      else
        redirect_to new_sessions_path, notice: "RA ou senha inválidos!"
      end
    }

  end

  def destroy
  end
end
