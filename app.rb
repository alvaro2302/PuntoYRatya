require 'sinatra'

get '/' do
        erb:bienvenida
end

    get '/mostrarUserName' do
      erb :userName
    end

    post '/mostrarTablaVacia' do
      @primerNombre = params[:first_user_name]
      @segundoNombre = params[:second_user_name]
      erb :tablaVacia  
    end
