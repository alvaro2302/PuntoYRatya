require 'sinatra'
require './lib/tablero'
require './lib/jugador'
require './lib/game'
class App < Sinatra::Base
  tablero = Tablero.new(2,2)

  game = Game.new(tablero)
  enable :sessions

  
  get '/' do
    erb:bienvenida
  end

  get '/mostrarUserName' do
    erb :userName
  end
  get '/mostrarUserNameThree' do
    erb :userNameThree
  end





  get '/mostrarTablaVacia' do  
    game.darNombre(1,params[:first_user_name])
    game.darNombre(2,params[:second_user_name])

    

    @jugador1 = game.obtenerJugador(1)
    @jugador2 = game.obtenerJugador(2)
    @numeroJugadorActual = game.obtenerJugadorActual()
    @jugadorActual = game.obtenerJugador(@numeroJugadorActual)
    
    
    @tabla = game.generarTabla
    erb :tablaVacia
  end

  get '/mostrarJugada' do
    @fila = params[:fila].to_i
    @columna = params[:columna].to_i
    
    seleccion = params[:selection]
    game.darJugada(@fila.to_i,@columna.to_i,seleccion)
    

    

    @jugador1 = game.obtenerJugador(1)
    @jugador2 = game.obtenerJugador(2)
    @numeroJugadorActual = game.obtenerJugadorActual()
    @jugadorActual = game.obtenerJugador(@numeroJugadorActual)
    @tabla = game.generarTabla
    @gameOver = game.GameOver
    if @gameOver ==false
      erb :tablaVacia
    else
      erb:gameover
    end
  end
  get '/mostrarTablaVaciaThree' do  
    game.selecionarCantidadDeJugadores(3)
    game.darNombre(1,params[:first_user_name])
    game.darNombre(2,params[:second_user_name])
    game.darNombre(3,params[:three_user_name])

    

    @jugador1 = game.obtenerJugador(1)
    @jugador2 = game.obtenerJugador(2)
    @jugador3 = game.obtenerJugador(3)
    @numeroJugadorActual = game.obtenerJugadorActual()
    @jugadorActual = game.obtenerJugador(@numeroJugadorActual)
    
    
    @tabla = game.generarTabla
    erb :gameThree
  end
  
  get '/gameThree' do
    @fila = params[:fila].to_i
    @columna = params[:columna].to_i
    seleccion = params[:selection]
    game.darJugada(@fila.to_i,@columna.to_i,seleccion)
    

    

    @jugador1 = game.obtenerJugador(1)
    @jugador2 = game.obtenerJugador(2)
    @jugador3 = game.obtenerJugador(3)
    @numeroJugadorActual = game.obtenerJugadorActual()
    @jugadorActual = game.obtenerJugador(@numeroJugadorActual)
    @tabla = game.generarTabla
    @gameOver = game.GameOver
    if @gameOver ==false
      erb :gameThree
    else
      erb:gameover
    end

  end


  get '/seleccionJugadores' do
    erb :seleccion
  end

  post '/redirecionCantidad' do
    seleccionado = params[:selection]
    
    if seleccionado == "2"
      redirect '/mostrarUserName'
    end
    if seleccionado == "3"
      redirect '/mostrarUserNameThree'
    end

  end

  post '/reinicarJuego' do
    tablero = Tablero.new(4,4)
    game = Game.new(tablero)
    redirect '/mostrarUserName'
  end

  run! if app_file == $0;
end

