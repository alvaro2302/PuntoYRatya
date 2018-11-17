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
                td = "   <td class=""></td>"
                if columna.LadoArriba()
                    td = "   <td class=td-border-top></td>"
                end
               
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

    end






end
