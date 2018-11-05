require "./lib/casilla"

describe Casilla do

  
  it "si pone la posicion '0,0' '0,1'  debe devolver 'arriba'" do
    casilla = Casilla.new(0,0)
    expect(casilla.obtenerLado(0,0,0,1)).to eq("arriba")
  end

  it "si pone la posicion '0,0' '1,0'  debe devolver 'izquierda'" do
    casilla = Casilla.new(0,0)
    expect(casilla.obtenerLado(0,0,1,0)).to eq("izquierda")
  end

  it "si pone la posicion '0,1' '0,0'  debe devolver 'arriba'" do
    casilla = Casilla.new(0,0)
    expect(casilla.obtenerLado(0,0,1,0)).to eq("arriba")
  end

  
end