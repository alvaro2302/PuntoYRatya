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
    it "si doy una jugada Derecha  y Izquierda en la posicion 0,0  en el tablero deberia cambiar el estilo de la casilla de izquieda y derecha de la casilla" do
        tablero = tablero  = Tablero.new(4,2)
        game = Game.new(tablero)
        game.darJugada(0,0,"Derecha")
        game.darJugada(0,0,"Izquierda")
        expect(game.generarTabla).to eq("<tr>   <td class=' td-border-right td-border-left'></td>   <td class=' td-border-left'></td></tr><tr>   <td class=''></td>   <td class=''></td></tr><tr>   <td class=''></td>   <td class=''></td></tr><tr>   <td class=''></td>   <td class=''></td></tr>")
    end

    it "si doy una jugada Derecha  y Izquierda y Arriba en la posicion 0,0  en el tablero deberia cambiar el estilo de la casilla de izquieda y derecha y arriba de la casilla" do
        tablero = tablero  = Tablero.new(4,2)
        game = Game.new(tablero)
        game.darJugada(0,0,"Derecha")
        game.darJugada(0,0,"Izquierda")
        game.darJugada(0,0,"Arriba")
        expect(game.generarTabla).to eq("<tr>   <td class=' td-border-top td-border-right td-border-left'></td>   <td class=' td-border-left'></td></tr><tr>   <td class=''></td>   <td class=''></td></tr><tr>   <td class=''></td>   <td class=''></td></tr><tr>   <td class=''></td>   <td class=''></td></tr>")
    end

    it "si doy una jugada Derecha  y Izquierda y Arriba Abajo en la posicion 0,0  en el tablero deberia cambiar el estilo de la casilla de izquieda y derecha y arriba y abajo de la casilla" do
        tablero = tablero  = Tablero.new(4,2)
        game = Game.new(tablero)
        game.darJugada(0,0,"Derecha")
        game.darJugada(0,0,"Izquierda")
        game.darJugada(0,0,"Arriba")
        game.darJugada(0,0,"Abajo")
        expect(game.generarTabla).to eq("<tr>   <td class=' td-border-top td-border-bottom td-border-right td-border-left'></td>   <td class=' td-border-left'></td></tr><tr>   <td class=' td-border-top'></td>   <td class=''></td></tr><tr>   <td class=''></td>   <td class=''></td></tr><tr>   <td class=''></td>   <td class=''></td></tr>")
    end

    it "si tengo 2 jugadores en el juego al hacer una jugada deberia cambiar el turno del segundo jugador deveria devolver true y el nombre del segundo jugador" do
        tablero = tablero  = Tablero.new(4,2)
        game = Game.new(tablero)
        game.darNombre(1,"alejandro")
        game.darNombre(2,"alex")
        #el jugador 1 esta dando su jugada
        game.darJugada(0,0,"Arriba")
        #el jugador 2 esta dando su jugada
        game.darJugada(0,0,"Derecha")
        #el jugador actual deberia ser el segundo jugador
        jugadorActual = game.obtenerJugadorActual()
        expect(jugadorActual.nombre).to eq("alex")


    end




    



end