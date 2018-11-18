require 'sinatra'
require './lib/tablero'
require './lib/jugador'
require './lib/game'

tablero = Tablero.new(4,4)
filas = 4 
game = Game.new(tablero)
enable :sessions
primer_jugador = Jugador.new
segundo_jugador = Jugador.new
jugadorActual = ""

 
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

  @jugador1 = primer_jugador
  @jugador2 = segundo_jugador
  @filas = filas
  @matriz = tablero.obtenerMatriz
  jugadorActual= primer_jugador.nombre
  @jugadoAhora = jugadorActual
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

  if primer_jugador.turno()
    jugadorActual = segundo_jugador.nombre
    
    primer_jugador.cambiar_turno(false)
    segundo_jugador.cambiar_turno(true)

  else
    jugadorActual = primer_jugador.nombre
    primer_jugador.cambiar_turno(true)
    segundo_jugador.cambiar_turno(false)
  end

  @jugador1 = game.obtenerJugador(1)
  @jugador2 = game.obtenerJugador(2)
  @jugadoAhora = jugadorActual 
  @tabla = game.generarTabla
  erb :tablaVacia
end

