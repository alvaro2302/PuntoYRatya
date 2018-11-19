require_relative './casilla'

class Tablero 
    attr_accessor :filas, :columnas,:matriz
    def initialize(filas , columnas)
        @filas = filas
        @columnas = columnas 
        @matriz=Array.new(@filas) {Array.new(@columnas) {Casilla.new()}}
        @jugadasRestantes = (((@columnas*4)-(@columnas-1))*@filas) -(@columnas*(@filas-1))
    end

    def filas()
        return @filas 
    end

    def columnas()
        return @columnas
    end
    
    def jugadasRestantes()
        return @jugadasRestantes
    end
    

    def marcarDerecha(fila,columna)
        @matriz[fila][columna].seleccionarLado("Derecha")
        restarJugada()
        if @matriz[fila][columna].LadoDerecha()
            if columna < @columnas-1
                @matriz[fila][columna+1].seleccionarLado("Izquierda")
            end
        end
    end

    def marcarIzquierda(fila,columna)
        @matriz[fila][columna].seleccionarLado("Izquierda")
        restarJugada()
        if @matriz[fila][columna].LadoIzquierda()
            if columna >0 
                @matriz[fila][columna-1].seleccionarLado("Derecha")
            end
        end
    end

    

    def marcarArriba(fila,columna)
        @matriz[fila][columna].seleccionarLado("Arriba")
        restarJugada()
        if @matriz[fila][columna].LadoArriba()
            if fila >0 
                @matriz[fila-1][columna].seleccionarLado("Abajo")
            end
        end
    end
    
    def marcarAbajo(fila,columna)
        @matriz[fila][columna].seleccionarLado("Abajo")
        restarJugada()
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

    def restarJugada()
        jugadaRestada =  @jugadasRestantes-1
        @jugadasRestantes = jugadaRestada
    end
    
    


    
end