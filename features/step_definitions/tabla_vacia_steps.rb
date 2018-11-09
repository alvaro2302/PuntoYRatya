Given("Estoy en la pagina tablaVacia") do
    visit('/tablaVacia')
  end
  
  Then("veo la tabla vacia") do
    expect(page).to have_table('tabla')
  end
  
  Then("Veo el nombre del primer jugador {string}") do |string|
    expect(page).to have_content(string)
  end
  
  Then("Veo el nombre del segundo jugador {string}") do |string|
    expect(page).to have_content(string)
  end
  
  Then("Al lado del primer jugador veo el mensaje {string}") do |string|
    expect(page).to have_content(string)
  end