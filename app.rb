require 'sinatra'
require "./lib/tablero"
tablero = Tablero.new(4,4)
filas = 4
playerOne = ""
playerTwo = ""
enable :sessions

get '/' do
  erb:bienvenida
end

get '/mostrarUserName' do
   erb :userName
end

post '/mostrarTablaVacia' do

  
  @primerNombre = params[:first_user_name]
  @segundoNombre = params[:second_user_name]
  playerOne = @primerNombre
  playerTwo = @segundoNombre 
  @filas = filas
  @matriz = tablero.obtenerMatriz
  erb :tablaVacia  
 
end

post '/mostrarJugada' do

  @primerNombre = playerOne
  @segundoNombre = playerTwo
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


