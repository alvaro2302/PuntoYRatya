Given("estoy en la pagina userName") do
  visit('/mostrarUserName')
  end

  Then("deberia ver un campo con id {string}") do |string|
    expect(page).to have_field(string)
  end

  Then("deberia ver otro campo con id {string}") do |string|
    expect(page).to have_field(string)
  end

  When("ingreso el nombre {string} en el primer campo con id {string}") do |value, field|
    fill_in field, with: value
  end

  When("ingreso el nombre {string} en el segundo campo con id {string}") do |value, field|
    fill_in field, with: value
  end