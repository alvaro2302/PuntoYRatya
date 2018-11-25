require 'sinatra'
require './lib/tablero'
require './lib/jugador'
require './lib/game'
class App < Sinatra::Base
  tablero = Tablero.new(4,4)

  game = Game.new(tablero)
  enable :sessions

  
  get '/' do
    erb:bienvenida
  end

  get '/mostrarUserName' do
    erb :userName
  end

  get '/modoJuego' do
    erb :modoJuego
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

  post '/reinicarJuego' do
    tablero = Tablero.new(4,4)
    game = Game.new(tablero)
    redirect '/modoJuego'
  end

  run! if app_file == $0;
end

