require_relative "./casilla"

class Tablero do
    attr_accessor :filas, :columnas,:matriz
    def initialize(filas , columnas)
        @filas = filas
        @columnas = columnas 
        @matriz=Array.new(filas) {Array.new(columnas) {Casilla.new()}}
    end

    def filas()

        return @filas
    end

    def columnas()
        return @columnas
    end
end