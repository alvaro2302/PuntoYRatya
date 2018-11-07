require 'sinatra'

get '/' do
        erb:bienvenida
end

    post '/mostrarUserName' do
      erb:userName
    end

    post '/mostrarTablaVacia' do
      erb:tablaVacia
    end
