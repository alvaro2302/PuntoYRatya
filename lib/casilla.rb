class Casilla
  attr_accessor :LadoArriba,:LadoAbajo,:LadoDerecha,:LadoIzquierda

    def initialize(fila,columna)
        @LadoArriba = false
        @LadoAbajo = false
        @LadoDerecha = false
        @LadoIzquierda = false
        @baseFila = fila
        @baseColumna = columna
        

    end  
    
    def obtenerLado(filaInicial, columnaInicial, filaFinal,columnaFinal)

        lado = ""
        baseFinalfila = @baseFila +1
        baseFinalColumna = @baseColumna +1
        diferenciafila = filaFinal - filaInicial
        diferenciacolumna = columnaFinal - columnaInicial
        if filaInicial == @baseFila and columnaInicial == @baseColumna
            if diferenciacolumna == 1 and diferenciafila==0 
                lado = "arriba"

            end

            if diferenciacolumna == 0 and diferenciafila == 1
                lado = "izquierda"

            end
        else
            
        
        
        end

        return lado


    end

end
