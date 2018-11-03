require 'sinatra'

    get '/' do
     erb :bienvenida
    end

    post '/MostrarTablaVacia' do
      erb:tablaVacia
    end
