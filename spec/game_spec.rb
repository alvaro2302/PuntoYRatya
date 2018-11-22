require "./lib/tablero"
require "./lib/game"
describe Game do

    it "si el juego genera una tabla de 1 fila y 1 columna deberia devolverme un codigo html de 2 filas y 1 columans" do
        tablero  = Tablero.new(1,1)
        game = Game.new(tablero)
        expect(game.generarTabla).to eq("<tr>   <td class=''></td></tr>")

    end

    it "si el juego  genera una tabla de 2 fila y 2 columna deberia devolverme un codigo html de 2 filas y 1 columans" do
        tablero  = Tablero.new(2,2)
        game = Game.new(tablero)
        expect(game.generarTabla).to eq("<tr>   <td class=''></td>   <td class=''></td></tr><tr>   <td class=''></td>   <td class=''></td></tr>")

    end

    it "si el juego  genera una tabla de 4 fila y 2 columna deberia devolverme un codigo html de 4 filas y 2 columans" do
        tablero  = Tablero.new(4,2)
        game = Game.new(tablero)
        expect(game.generarTabla).to eq("<tr>   <td class=''></td>   <td class=''></td></tr><tr>   <td class=''></td>   <td class=''></td></tr><tr>   <td class=''></td>   <td class=''></td></tr><tr>   <td class=''></td>   <td class=''></td></tr>")

    end
    
    it "si doy una jugada Arriba en la posicion 0,0 el tablero deberia cambiar el estilo de la casilla que selecciono " do
        tablero = tablero  = Tablero.new(4,2)
        game = Game.new(tablero)
        game.darJugada(0,0,"Arriba")
        expect(game.generarTabla).to eq("<tr>   <td class=' td-border-top'></td>   <td class=''></td></tr><tr>   <td class=''></td>   <td class=''></td></tr><tr>   <td class=''></td>   <td class=''></td></tr><tr>   <td class=''></td>   <td class=''></td></tr>")
        
    end

    it "si doy una jugada Abajo en la posicion 0,0 el tablero deberia cambiar el estilo de la casilla que selecciono " do
        tablero = tablero  = Tablero.new(4,2)
        game = Game.new(tablero)
        game.darJugada(0,0,"Abajo")
        expect(game.generarTabla).to eq("<tr>   <td class=' td-border-bottom'></td>   <td class=''></td></tr><tr>   <td class=' td-border-top'></td>   <td class=''></td></tr><tr>   <td class=''></td>   <td class=''></td></tr><tr>   <td class=''></td>   <td class=''></td></tr>")
        
    end
    it "si doy una jugada Derecha en la posicion 0,0 el tablero deberia cambiar el estilo de la casilla que selecciono " do
        tablero = tablero  = Tablero.new(4,2)
        game = Game.new(tablero)
        game.darJugada(0,0,"Derecha")
        expect(game.generarTabla).to eq("<tr>   <td class=' td-border-right'></td>   <td class=' td-border-left'></td></tr><tr>   <td class=''></td>   <td class=''></td></tr><tr>   <td class=''></td>   <td class=''></td></tr><tr>   <td class=''></td>   <td class=''></td></tr>")
    end

    it "si doy una jugada Izquierda en la posicion 0,0 el tablero deberia cambiar el estilo de la casilla que selecciono " do
        tablero = tablero  = Tablero.new(4,2)
        game = Game.new(tablero)
        game.darJugada(0,0,"Izquierda")
        expect(game.generarTabla).to eq("<tr>   <td class=' td-border-left'></td>   <td class=''></td></tr><tr>   <td class=''></td>   <td class=''></td></tr><tr>   <td class=''></td>   <td class=''></td></tr><tr>   <td class=''></td>   <td class=''></td></tr>")
    end
    it "si el jugador2 da una jugada a  la izquierda deberia ser distinto el  estilo " do
        tablero = tablero  = Tablero.new(4,2)
        game = Game.new(tablero)
        #turno del jugador 1
        game.darJugada(0,0,"Derecha")
        #turno del jugador 2
        game.darJugada(0,0,"Izquierda")
        expect(game.generarTabla).to eq("<tr>   <td class=' td-border-right jugador2Izquierda'></td>   <td class=' td-border-left'></td></tr><tr>   <td class=''></td>   <td class=''></td></tr><tr>   <td class=''></td>   <td class=''></td></tr><tr>   <td class=''></td>   <td class=''></td></tr>")
    end

    it "si el jugador2 da una jugada a  la derecha deberia ser distinto el  estilo " do
        tablero = tablero  = Tablero.new(4,2)
        game = Game.new(tablero)
        #turno del jugador 1
        game.darJugada(0,0,"Izquierda")
        #turno del jugador 2
        game.darJugada(0,0,"Derecha")
        expect(game.generarTabla).to eq("<tr>   <td class=' jugador2Derecha td-border-left'></td>   <td class=' jugador2Izquierda'></td></tr><tr>   <td class=''></td>   <td class=''></td></tr><tr>   <td class=''></td>   <td class=''></td></tr><tr>   <td class=''></td>   <td class=''></td></tr>")
    end


   


    it "si doy una jugada Derecha  y Izquierda y Arriba en la posicion 0,0  en el tablero deberia cambiar el estilo de la casilla de izquieda y derecha y arriba de la casilla" do
        tablero = tablero  = Tablero.new(4,2)
        game = Game.new(tablero)
        game.darJugada(0,0,"Derecha")
        game.darJugada(0,0,"Izquierda")
        game.darJugada(0,0,"Arriba")
        expect(game.generarTabla).to eq("<tr>   <td class=' td-border-top td-border-right jugador2Izquierda'></td>   <td class=' td-border-left'></td></tr><tr>   <td class=''></td>   <td class=''></td></tr><tr>   <td class=''></td>   <td class=''></td></tr><tr>   <td class=''></td>   <td class=''></td></tr>")
    end

    it "si doy una jugada Derecha  y Izquierda y Arriba Abajo en la posicion 0,0  en el tablero deberia cambiar el estilo de la casilla de izquieda y derecha y arriba y abajo de la casilla" do
        tablero = tablero  = Tablero.new(4,2)
        game = Game.new(tablero)
        game.darJugada(0,0,"Derecha")
        game.darJugada(0,0,"Izquierda")
        game.darJugada(0,0,"Arriba")
        game.darJugada(0,0,"Abajo")
        expect(game.generarTabla).to eq("<tr>   <td class=' td-border-top jugador2Abajo td-border-right jugador2Izquierda'></td>   <td class=' td-border-left'></td></tr><tr>   <td class=' td-border-top'></td>   <td class=''></td></tr><tr>   <td class=''></td>   <td class=''></td></tr><tr>   <td class=''></td>   <td class=''></td></tr>")
    end

    

    

    

    it "si añado 2 jugadores con su nombre  en el juego deberia devolver los nombres de los 2 jugadores " do
        tablero = tablero  = Tablero.new(4,2)
        game = Game.new(tablero)
        #añadiendo nombre al primer jugador
        game.darNombre(1,"alejandro")
        #añadiendo nombre al segundo jugador
        game.darNombre(2,"alex")
        jugadorOne = game.obtenerJugador(1)
        jugadorTwo = game.obtenerJugador(2)
        expect(jugadorOne.nombre).to eq("alejandro")
        expect(jugadorTwo.nombre).to eq("alex")
    end

    it "si añado 2 jugadores con su nombre  en el juego deberia devolver los nombres de los 2 jugadores " do
        tablero = tablero  = Tablero.new(4,2)
        game = Game.new(tablero)
        #añadiendo nombre al primer jugador
        game.darNombre(1,"alejandro")
        #añadiendo nombre al segundo jugador
        game.darNombre(2,"alex")
        jugadorOne = game.obtenerJugador(1)
        jugadorTwo = game.obtenerJugador(2)
        expect(jugadorOne.nombre).to eq("alejandro")
        expect(jugadorTwo.nombre).to eq("alex")
    end

    it "si tengo 2 jugadores y cuando este en el turno del primero jugador y se cambie el turno deberia cambiar a 2" do
        tablero = tablero  = Tablero.new(4,2)
        game = Game.new(tablero)
        game.cambiarTurno()
        jugadorActual  = game.obtenerJugadorActual()
        expect(jugadorActual).to eq(2)

    end

    it "si tengo 2 jugadores y cuando este en el turno del segundo jugador y se cambie el turno deberia cambiar a 1" do
        tablero = tablero  = Tablero.new(4,2)
        game = Game.new(tablero)
        game.cambiarTurno()
        game.cambiarTurno()
        jugadorActual  = game.obtenerJugadorActual()
        expect(jugadorActual).to eq(1)
        
    end
    it "si se da una jugada del primer jugador  debe devolver  el jugador actual que seria el segundo jugador " do
        tablero = tablero  = Tablero.new(4,2)
        game = Game.new(tablero)
        #añadiendo nombre al primer jugador
        game.darNombre(1,"alejandro")
        #añadiendo nombre al segundo jugador
        game.darNombre(2,"alex")
        game.darJugada(0,0,"Arriba")
        numeroDeJugadorActual = game.obtenerJugadorActual()
        jugadorActual = game.obtenerJugador(numeroDeJugadorActual)
        expect(jugadorActual.nombre).to eq("alex")
        expect(jugadorActual.puntos()).to eq(0)
    end
    it "si se da una jugada del segundo jugador  debe devolver  el jugador actual que seria el primer jugador " do
        tablero = tablero  = Tablero.new(4,2)
        game = Game.new(tablero)
        #añadiendo nombre al primer jugador
        game.darNombre(1,"alejandro")
        #añadiendo nombre al segundo jugador
        game.darNombre(2,"alex")
        game.darJugada(0,0,"Arriba")
        game.darJugada(0,0,"Derecha")
        numeroDeJugadorActual = game.obtenerJugadorActual()
        jugadorActual = game.obtenerJugador(numeroDeJugadorActual)
        expect(jugadorActual.nombre).to eq("alejandro")
        expect(jugadorActual.puntos()).to eq(0)
    end

    it "si se da una jugada del segundo jugador y llena el cuadro debe aumentar un punto  al primer jugador " do
        tablero = tablero  = Tablero.new(4,2)
        game = Game.new(tablero)
        #añadiendo nombre al primer jugador
        game.darNombre(1,"alejandro")
        #añadiendo nombre al segundo jugador
        game.darNombre(2,"alex")
        game.darJugada(0,0,"Arriba")
        game.darJugada(0,0,"Derecha")
        game.darJugada(0,0,"Abajo")
        game.darJugada(0,0,"Izquierda")
        jugadorActual = game.obtenerJugador(2)
        expect(jugadorActual.nombre).to eq("alex")
        expect(jugadorActual.puntos()).to eq(1)
        
    end
    
  

    it "si doy una jugada deberia restarse la cantidad de jugadas en el tablero a 11" do
        tablero = tablero  = Tablero.new(2,2)
        game = Game.new(tablero)
        #añadiendo nombre al primer jugador
        game.darNombre(1,"alejandro")
        #añadiendo nombre al segundo jugador
        game.darNombre(2,"alex")
        game.darJugada(0,0,"Arriba")
        jugadasRestantes = game.obtenerJugadasRestantes()
        expect(jugadasRestantes).to eq(11)
    end

    it "si lleno toda la tabla con jugadas deberia cambiar a true gameOver" do
        tablero = tablero  = Tablero.new(2,2)
        game = Game.new(tablero)
        #añadiendo nombre al primer jugador
        game.darNombre(1,"alejandro")
        #añadiendo nombre al segundo jugador
        game.darNombre(2,"alex")
        game.darJugada(0,0,"Arriba")
        game.darJugada(0,0,"Izquierda")
        game.darJugada(0,0,"Abajo")
        game.darJugada(0,0,"Derecha")
        game.darJugada(0,1,"Arriba")
        game.darJugada(0,1,"Derecha")
        game.darJugada(0,1,"Abajo")
        game.darJugada(1,0,"Izquierda")
        game.darJugada(1,0,"Abajo")
        game.darJugada(1,0,"Derecha")
        game.darJugada(1,1,"Derecha")
        game.darJugada(1,1,"Abajo")
        expect(game.GameOver).to eq(true)
        
    end
    

    it "si se da una jugada en la casilla 0,0 a Arriba el primer jugador deberia cambiar con 1 en numeroLadoArriba" do
        tablero = tablero  = Tablero.new(2,2)
        game = Game.new(tablero)
        #añadiendo nombre al primer jugador
        game.darNombre(1,"alejandro")
        #añadiendo nombre al segundo jugador
        game.darNombre(2,"alex")
        game.darJugada(0,0,"Arriba")
        casillaMarcada  = tablero.obtenerCasilla(0,0)
        expect(casillaMarcada.numeroJugadorLadoArriba).to eq(1)
        
    end
    it "si se da una jugada en la casilla 0,0 a Abajo el segundo jugador deberia cambiar 2 en numeroLadoAbajo " do
        tablero = tablero  = Tablero.new(2,2)
        game = Game.new(tablero)
        #añadiendo nombre al primer jugador
        game.darNombre(1,"alejandro")
        #añadiendo nombre al segundo jugador
        game.darNombre(2,"alex")
        game.darJugada(0,0,"Arriba")
        game.darJugada(0,0,"Abajo")
        casillaMarcada = tablero.obtenerCasilla(0,0)
        expect(casillaMarcada.numeroJugadorLadoAbajo).to eq(2)
        
    end
    it "si se da una jugada en la casilla 0,0 a Izquierda el primer jugador deberia cambiar 1 en numeroLadoIzquierda" do
        tablero = tablero  = Tablero.new(2,2)
        game = Game.new(tablero)
        #añadiendo nombre al primer jugador
        game.darNombre(1,"alejandro")
        #añadiendo nombre al segundo jugador
        game.darNombre(2,"alex")
        game.darJugada(0,0,"Arriba")
        game.darJugada(0,0,"Abajo")
        game.darJugada(0,0,"Izquierda")
        casillaMarcada = tablero.obtenerCasilla(0,0)
        expect(casillaMarcada.numeroJugadorLadoIzquierda).to eq(1)

    end
    it "si se da una jugada en la casilla 0,0 a Derecha el primer jugador deberia cambiar 2 en numeroLadoDerecha" do
        tablero = tablero  = Tablero.new(2,2)
        game = Game.new(tablero)
        #añadiendo nombre al primer jugador
        game.darNombre(1,"alejandro")
        #añadiendo nombre al segundo jugador
        game.darNombre(2,"alex")
        game.darJugada(0,0,"Arriba")
        game.darJugada(0,0,"Abajo")
        game.darJugada(0,0,"Izquierda")
        game.darJugada(0,0,"Derecha")
        casillaMarcada = tablero.obtenerCasilla(0,0)
        expect(casillaMarcada.numeroJugadorLadoDerecha).to eq(2)

    end
    


end