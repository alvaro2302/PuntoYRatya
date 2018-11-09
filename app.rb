require 'sinatra'
<<<<<<< HEAD
require './lib/jugador'

primer_jugador = Jugador.new
segundo_jugador = Jugador.new
=======
require "./lib/tablero"
tablero = Tablero.new(4,4)
filas = 4 
enable :sessions
>>>>>>> arreglos

get '/' do
  erb:bienvenida
end

get '/mostrarUserName' do
<<<<<<< HEAD
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
=======
   erb :userName
end

post '/mostrarTablaVacia' do  
  @primerNombre = params[:first_user_name]
  @segundoNombre = params[:second_user_name]
  @filas = filas
  @matriz = tablero.obtenerMatriz
  erb :tablaVacia  
end

post '/mostrarJugada' do
  @fila = params[:fila].to_i
  @columna = params[:columna].to_i
  seleccion = params[:selection]
  if seleccion == "Arriba"
    tablero.marcarArriba(@fila, @columna)
  end
  if seleccion == "Derecha"
    tablero.marcarDerecha(@fila,@columna)
  end 
  if seleccion == "Izquierda"
    tablero.marcarIzquierda(@fila,@columna)
  end 
  if seleccion == "Abajo"
    tablero.marcarAbajo(@fila,@columna)
  end 
  @filas = filas
  @matriz = tablero.obtenerMatriz
  erb :tablaVacia
end


>>>>>>> arreglos
