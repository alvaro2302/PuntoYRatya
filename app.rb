require 'sinatra'

get '/' do
        erb:bienvenida
end

<<<<<<< HEAD
    post '/mostrarUserName' do
      erb:userName
=======
    get '/mostrarUserName' do
      erb :userName
>>>>>>> origin/master
    end

    post '/mostrarTablaVacia' do
      @primerNombre = params[:first_user_name]
      @segundoNombre = params[:second_user_name]
      erb :tablaVacia  
    end
