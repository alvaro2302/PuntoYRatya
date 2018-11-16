require 'sinatra'
require './lib/tablero'
require './lib/jugador'

tablero = Tablero.new(2,4)
filas = 4 
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
  @tabla = tablero.generarTabla
  erb :tablaVacia
end

post '/mostrarJugada' do
  @fila = params[:fila].to_i
  @columna = params[:columna].to_i
  
  seleccion = params[:selection]
  if seleccion == "Arriba"
    tablero.marcarArriba(@fila, @columna)
    casilla = tablero.obtenerCasilla(@fila, @columna)
    if casilla.estaLLena()
      if jugadorActual == primer_jugador.nombre 
        primer_jugador.aumentar_punto()
      end
      if jugadorActual == segundo_jugador.nombre 
        segundo_jugador.aumentar_punto()
      end
    end
  end
  if seleccion == "Derecha"
    tablero.marcarDerecha(@fila,@columna)
    casilla = tablero.obtenerCasilla(@fila, @columna)
    if casilla.estaLLena()
      if jugadorActual == primer_jugador.nombre 
        primer_jugador.aumentar_punto()
      end
      if jugadorActual== segundo_jugador.nombre 
        segundo_jugador.aumentar_punto()
      end
    end
  end 
  if seleccion == "Izquierda"
    tablero.marcarIzquierda(@fila,@columna)
    casilla = tablero.obtenerCasilla(@fila, @columna)
    if casilla.estaLLena()
      if jugadorActual== primer_jugador.nombre 
        primer_jugador.aumentar_punto()
      end
      if jugadorActual == segundo_jugador.nombre 
        segundo_jugador.aumentar_punto()
      end
    end
  end 
  if seleccion == "Abajo"
    tablero.marcarAbajo(@fila,@columna)
    casilla = tablero.obtenerCasilla(@fila, @columna)
    if casilla.estaLLena()
      if jugadorActual == primer_jugador.nombre 
        primer_jugador.aumentar_punto()
      end
      if jugadorActual == segundo_jugador.nombre 
        segundo_jugador.aumentar_punto()
      end
    end
  end 
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

  @jugador1 = primer_jugador
  @jugador2 = segundo_jugador
  @jugadoAhora = jugadorActual 
  @tabla = tablero.generarTabla
  erb :tablaVacia
end

