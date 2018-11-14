require "./lib/tablero"
describe Tablero do
    
    it "cuando marque derecha en la posicion '0,0' en una casilla ,si hay una alado deberia estar marcado izquierda" do
        tablero = Tablero.new(4,4)
        tablero.marcarDerecha(0,0)
        casilla = tablero.obtenerCasilla(0,0) 
        expect(casilla.LadoDerecha()).to eq(true)
        casillaDeAlado = tablero.obtenerCasilla(0,1) 
        expect(casillaDeAlado.LadoIzquierda()).to eq(true)
       
    end

    it "cuando marque izquierda  en la posicion '0,0' en una casilla ,solo deberia marcar izquierda" do
        tablero = Tablero.new(4,4)
        tablero.marcarIzquierda(0,0)
        casilla = tablero.obtenerCasilla(0,0) 
        expect(casilla.LadoIzquierda()).to eq(true)
    end

    it "cuando marque izquierda  en la posicion '1,1' en una casilla , deberia marcar izquierda y derecha de alado" do
        tablero = Tablero.new(4,4)
        tablero.marcarIzquierda(1,1)
        casilla = tablero.obtenerCasilla(1,1) 
        casillaDeAlado = tablero.obtenerCasilla(1,0) 
        expect(casilla.LadoIzquierda()).to eq(true)
        expect(casillaDeAlado.LadoDerecha()).to eq(true)

        
    end

    it "cuando marque arriba  en la posicion '0,0' en una casilla . deberia marcar solo arriba  " do
        tablero = Tablero.new(4,4)
        tablero.marcarArriba(0,0)
        casilla = tablero.obtenerCasilla(0,0)
        expect(casilla.LadoArriba()).to eq(true)

    end    

    
    it "cuando marque arriba  en la posicion '1,1' en una casilla . deberia marcar arriba y abajo de la casilla de alado " do
        tablero = Tablero.new(4,4)
        tablero.marcarArriba(1,1)
        casilla = tablero.obtenerCasilla(1,1)
        casillaDeAlado = tablero.obtenerCasilla(0,1)
        expect(casilla.LadoArriba()).to eq(true)
        expect(casillaDeAlado.LadoAbajo()).to  eq(true)
    end    

    it "cuando marque abajo  en la posicion '0,0' en una casilla . deberia marcar  abajo y la casilla de alado deberia maracar arriba  " do
        tablero = Tablero.new(4,4)
        tablero.marcarAbajo(1,1)
        casilla = tablero.obtenerCasilla(1,1)
        casillaDeAlado = tablero.obtenerCasilla(2,1)
        expect(casilla.LadoAbajo()).to eq(true)
       

    end

    it "cuando marque abajo  en la posicion '3,0' en una casilla . deberia marcar  solo abajo   " do
        tablero = Tablero.new(4,4)
        tablero.marcarAbajo(3,0)
        casilla = tablero.obtenerCasilla(3,0)
        expect(casilla.LadoAbajo()).to eq(true)
    
    end




    


end