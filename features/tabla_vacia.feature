Feature: Tabla Vacia

    Como un jugador
    Quiero ver una tabla vacía
    Para poder empezar el juego

    Scenario: Tabla vacia
        Given Estoy en la pagina tablaVacia
        Then veo la tabla vacia

    Scenario: Nombre de los jugadores
        Given Estoy en la pagina tablaVacia
        Then Veo el nombre del primer jugador 'Jose'
        And Veo el nombre del segundo jugador 'Juan'

    Scenario: Turno jugador correspondiente
        Given Estoy en la pagina tablaVacia
        Then Al lado del primer jugador veo el mensaje 'Es turno de:'

    Scenario: Reiniciar partida
        Given Estoy en la pagina de tablaVacia
        Then en la parte de abajo veo el boton 'Reiniciar'