require_relative './tablero'
require_relative './jugador'
class Game
    attr_accessor :tablero, :matriz, :jugadorActual, :jugadorOne, :jugadorTwo, :numeroDejugadores, :GameOver
    def initialize(tablero)
        @tablero = tablero
        @matriz = tablero.obtenerMatriz
        @numeroDejugadores = 2 
        @jugadorActual = 1
        @jugadorOne = Jugador.new()
        @jugadorTwo = Jugador.new()
        @GameOver = false
    end

    def jugadorTwo()
        @jugadorTwo
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
            ponerNumeroAJugadaArriba(@jugadorActual,fila,columna)
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
        casilla = @tablero.obtenerCasilla(fila,columna)
        if casilla.estaLLena()
            jugadorActual = obtenerJugador(@jugadorActual)
            jugadorActual.aumentar_punto()
        end
        
        

        if @tablero.jugadasRestantes()==0
            @GameOver = true
        end
        cambiarTurno()

    end

    def darNombre(numeroJugador,nombreJugador)
        if numeroJugador==1
            @jugadorOne.poner_nombre(nombreJugador)
        end
        if numeroJugador==2
            @jugadorTwo.poner_nombre(nombreJugador)
        end
    end

    def obtenerJugador(numero)
        if numero == 1
            return @jugadorOne
        end
        if numero == 2
            return @jugadorTwo
        end
    end

    def cambiarTurno()
        if @jugadorActual == @numeroDejugadores
            @jugadorActual = 1
            @jugadorOne.cambiar_turno(true)
            @jugadorTwo.cambiar_turno(false)
        else
            turno = @jugadorActual +1
            @jugadorActual= turno
            @jugadorOne.cambiar_turno(false)
            @jugadorTwo.cambiar_turno(true)
        end
    end

    def obtenerJugadorActual()
        return @jugadorActual
    end
    def obtenerJugadasRestantes()
        return @tablero.jugadasRestantes()
    end

    def ponerNumeroAJugadaArriba(numeroJugador,fila,columna)
        casilla = @tablero.obtenerCasilla(fila,columna)
        casilla.cambiarNumeroJugadorLadoArriba(numeroJugador)
    end

    def GameOver
        return @GameOver
    end
end