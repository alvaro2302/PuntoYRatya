Feature: darJugada

    Como un jugador
    Quiero dibujar una línea en el tablero
    Para poder hacer mi jugada

    Scenario: se muestra la jugada  del Jose
        Given estoy en la pagina mostrarUserName  
        When ingreso el nombre de 'Jose' en el primer campo con id 'first_user_name'
        And ingreso el nombre de 'Juan' en el segundo campo con id 'second_user_name'
        And presiono el boton 'Iniciar Partida'
        And ingreso posicion '0' en el primer campo 'fila'
        And ingreso psoicion '0' en el primer campo 'columna'
        And presiono el boton 'Arriba'
        Then Veo la tabla '<tr>   <td class=" td-border-top"></td>   <td class=""></td></tr><tr>   <td class=""></td>   <td class=""></td></tr>'

      