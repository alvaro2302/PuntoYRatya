require_relative './casilla'

class Tablero 
    attr_accessor :filas, :columnas,:matriz
    def initialize(filas , columnas)
        @filas = filas
        @columnas = columnas 
        @matriz=Array.new(@filas) {Array.new(@columnas) {Casilla.new()}}
    end

    def filas()
        return @filas 
    end

    def columnas()
        return @columnas
    end
    
    def generarTabla
        htmlTable = ""
        for fila in 1..@filas
            tr = "<tr>"
            htmlTable = htmlTable +tr
            for columna in 1..@columnas
               td = "   <td class=""></td>"
               htmlTable = htmlTable + td
            end
            trSalida = "</tr>"
            htmlTable = htmlTable + trSalida
        end

        return htmlTable
        
    end
    def marcarDerecha(fila,columna)
        @matriz[fila][columna].seleccionarLado("Derecha")
        if @matriz[fila][columna].LadoDerecha()
            if columna < @columnas-1
                @matriz[fila][columna+1].seleccionarLado("Izquierda")
            end
        end
    end

    def marcarIzquierda(fila,columna)
        @matriz[fila][columna].seleccionarLado("Izquierda")
        if @matriz[fila][columna].LadoIzquierda()
            if columna >0 
                @matriz[fila][columna-1].seleccionarLado("Derecha")
            end
        end
    end

    def marcarArriba(fila,columna)
        @matriz[fila][columna].seleccionarLado("Arriba")
        if @matriz[fila][columna].LadoArriba()
            if fila >0 
                @matriz[fila-1][columna].seleccionarLado("Abajo")
            end
        end
    end
    
    def marcarAbajo(fila,columna)
        @matriz[fila][columna].seleccionarLado("Abajo")
        if @matriz[fila][columna].LadoAbajo()
            if fila < @filas-1
                @matriz[fila+1][columna].seleccionarLado("Arriba")
            end
        end
    end
    
    def obtenerCasilla(fila,columna)
        return @matriz[fila][columna]
    end

    def obtenerMatriz
        return @matriz
    end
    
end