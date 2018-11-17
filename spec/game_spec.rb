require "./lib/tablero"
require "./lib/game"
describe Game do

    it "si el juego genera una tabla de 1 fila y 1 columna deberia devolverme un codigo html de 2 filas y 1 columans" do
        tablero  = Tablero.new(1,1)
        game = Game.new(tablero)
        expect(game.generarTabla).to eq("<tr>   <td class=""></td></tr>")

    end

    it "si el juego  genera una tabla de 2 fila y 2 columna deberia devolverme un codigo html de 2 filas y 1 columans" do
        tablero  = Tablero.new(2,2)
        game = Game.new(tablero)
        expect(game.generarTabla).to eq("<tr>   <td class=""></td>   <td class=""></td></tr><tr>   <td class=""></td>   <td class=""></td></tr>")

    end

    it "si el juego  genera una tabla de 4 fila y 2 columna deberia devolverme un codigo html de 4 filas y 2 columans" do
        tablero  = Tablero.new(4,2)
        game = Game.new(tablero)
        expect(game.generarTabla).to eq("<tr>   <td class=""></td>   <td class=""></td></tr><tr>   <td class=""></td>   <td class=""></td></tr><tr>   <td class=""></td>   <td class=""></td></tr><tr>   <td class=""></td>   <td class=""></td></tr>")

    end
    
    it "si doy una jugada Arriba en la posicion 0,0 el tablero deberia cambiar el estilo de la casilla que selecciono " do
        tablero = tablero  = Tablero.new(4,2)
        game = Game.new(tablero)
        game.darJugada(0,0,"Arriba")
        expect(game.generarTabla).to eq("<tr>   <td class=td-border-top></td>   <td class=""></td></tr><tr>   <td class=""></td>   <td class=""></td></tr><tr>   <td class=""></td>   <td class=""></td></tr><tr>   <td class=""></td>   <td class=""></td></tr>")
        
    end

    it "si doy una jugada Abajo en la posicion 0,0 el tablero deberia cambiar el estilo de la casilla que selecciono " do
        tablero = tablero  = Tablero.new(4,2)
        game = Game.new(tablero)
        game.darJugada(0,0,"Arriba")
        expect(game.generarTabla).to eq("<tr>   <td class=td-border-top></td>   <td class=""></td></tr><tr>   <td class=""></td>   <td class=""></td></tr><tr>   <td class=""></td>   <td class=""></td></tr><tr>   <td class=""></td>   <td class=""></td></tr>")
        
    end



end