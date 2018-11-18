require 'sinatra'
require './lib/tablero'
require './lib/jugador'
require './lib/game'

tablero = Tablero.new(4,4)
filas = 4 
game = Game.new(tablero)
enable :sessions

 
get '/' do
  erb:bienvenida
end

get '/mostrarUserName' do
   erb :userName
end

post '/mostrarTablaVacia' do  
  game.darNombre(1,params[:first_user_name])
  game.darNombre(2,params[:second_user_name])

  @jugador1 = game.obtenerJugador(1)
  @jugador2 = game.obtenerJugador(2)
  @filas = filas
  @matriz = tablero.obtenerMatriz
  @tabla = game.generarTabla
  erb :tablaVacia
end

post '/mostrarJugada' do
  @fila = params[:fila].to_i
  @columna = params[:columna].to_i
  
  seleccion = params[:selection]
  game.darJugada(@fila.to_i,@columna.to_i,seleccion)
  
  @filas = filas
  @matriz = tablero.obtenerMatriz
  
  @jugador1 = game.obtenerJugador(1)
  @jugador2 = game.obtenerJugador(2)
  @tabla = game.generarTabla
  erb :tablaVacia
end

