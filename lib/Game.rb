require_relative './tablero'
class Game
    attr_accessor :tablero, :matriz
    def initialize(tablero)
     @tablero = tablero
     @matriz = tablero.obtenerMatriz
     

    end

    def generarTabla
        htmlTable = ""
        
        @matriz.each do |fila|
            tr = "<tr>"
            htmlTable = htmlTable +tr
            fila.each do |columna|
                style = ""
                td = "   <td class="+style +"></td>"
                if columna.LadoArriba()
                    style =  style+" td-border-top"
                end
                if columna.LadoAbajo()
                    style =  style + " td-border-bottom"
                end
                if columna.LadoDerecha()
                    style = style+ " td-border-right"
                end
                if columna.LadoIzquierda()
                    style = style +" td-border-left"
                end
                style = "'"+style+"'"
                td = "   <td class="+style +"></td>"
               
               htmlTable = htmlTable + td
            end
            trSalida = "</tr>"
            htmlTable = htmlTable + trSalida
        end

        return htmlTable
        
    end

    def darJugada(fila,columna,lado)
        if lado == "Arriba"
            tablero.marcarArriba(fila,columna)
        end
        if lado == "Abajo"
            tablero.marcarAbajo(fila,columna)
        end
        if lado == "Derecha"
            tablero.marcarDerecha(fila,columna)
        end
        if lado == "Izquierda"
            tablero.marcarIzquierda(fila,columna)
        end

    end






end
