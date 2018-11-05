Feature: Bienvenida
    Como estudiante 
    Quiero ver un mensaje de bienvenida en el juego 
    Para sentirme a gusto desde el inicio

    Scenario: mensaje de bienvenida
        Given visito la pagina principal
        Then deberia ver el mensaje "bienvenido a Timbiriche"
    
    Scenario: boton iniciar
        Given visito la pagina principal
        When presiono el boton "Iniciar"
        Then deberia ver la pagina con titulo "nuevo Usuario"