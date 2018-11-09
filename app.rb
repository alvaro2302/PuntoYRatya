require 'sinatra'
require './lib/jugador'

primer_jugador = Jugador.new
segundo_jugador = Jugador.new

get '/' do
  erb:bienvenida
end

get '/mostrarUserName' do
  erb :userName
end

post '/mostrarTablaVacia' do
  primer_jugador.poner_nombre(params[:first_user_name])
  segundo_jugador.poner_nombre(params[:second_user_name])

  segundo_jugador.cambiar_turno(false)

  redirect '/tablaVacia'
end

get '/tablaVacia' do
  @jugador1 = primer_jugador
  @jugador2 = segundo_jugador
  erb :tablaVacia
end