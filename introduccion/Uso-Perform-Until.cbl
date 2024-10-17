      ******************************************************************
      * Author: Byron Stevens Villegas Moya
      * Date: 2023-06-21
      * Purpose: Uso del perform until
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. USO-PERFORM-UNTIL.
       AUTHOR BYRON-VILLEGAS-MOYA.

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 NUMERO-AL-MIN PIC 9(02).
       77 NUMERO-AL-MAX PIC 9(02).
       77 NUMERO-A-ENCONTRAR PIC 9(02).
       77 NUMERO-INGRESADO PIC 9(02).
       77 DIFERENCIA PIC S9(02).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "Bienvenido a la busqueda del numero oculto"

            DISPLAY
            "Por favor ingresa el numero "
            "minimo para realizar el azar:"
            ACCEPT NUMERO-AL-MIN

            DISPLAY
            "Por favor ingresa el numero "
            "maximo para realizar el azar:"
            ACCEPT NUMERO-AL-MAX

            IF
            NUMERO-AL-MIN > NUMERO-AL-MAX
            OR
            NUMERO-AL-MAX < NUMERO-AL-MIN
            THEN
               DISPLAY
               "Por favor el numero "
               "minimo debe ser menor al maximo para el azar"
               STOP RUN.

            PERFORM GENERAR-NUMERO-ALEATORIO 7 TIMES

            DISPLAY
            "Hemos generado un numero aleatorio a partir del "
            NUMERO-AL-MIN
            " hasta el "
            NUMERO-AL-MAX

            DISPLAY "Mucha suerte buscandolo!!!"
            PERFORM
            ENCONTRAR-NUMERO
            UNTIL
            NUMERO-A-ENCONTRAR = NUMERO-INGRESADO.
            STOP RUN.

           ENCONTRAR-NUMERO.
               DISPLAY "Ingrese el numero que "
               "usted cree que es el aleatorio: "
               ACCEPT NUMERO-INGRESADO

               SUBTRACT NUMERO-INGRESADO
               FROM NUMERO-A-ENCONTRAR
               GIVING DIFERENCIA

               IF DIFERENCIA IS NEGATIVE THEN
                   IF (DIFERENCIA * -1) < 3 THEN
                       DISPLAY "Estas un poquito lejos"
                   END-IF

                   IF
                       (DIFERENCIA * -1) >= 3
                       AND
                       (DIFERENCIA * -1) < 5
                   THEN
                       DISPLAY "Estas un poco lejos"
                   END-IF

                   IF
                       (DIFERENCIA * -1) >= 5
                       AND
                       (DIFERENCIA * -1) <= 10
                   THEN
                       DISPLAY "Estas bastante lejos"
                   END-IF

                   IF
                       (DIFERENCIA * -1) > 10
                       AND
                       (DIFERENCIA * -1) <= 20
                   THEN
                       DISPLAY "Estas lejos"
                   END-IF

                   IF
                       (DIFERENCIA * -1) >= 20
                   THEN
                       DISPLAY "Estas muy lejos"
                   END-IF
               END-IF

               IF DIFERENCIA IS POSITIVE THEN
                   IF DIFERENCIA < 3 THEN
                       DISPLAY "Estas muy cerca"
                   END-IF

                   IF
                       DIFERENCIA >= 3
                       AND
                       DIFERENCIA < 5
                   THEN
                       DISPLAY "Estas un poco cerca"
                   END-IF

                   IF
                       DIFERENCIA >= 5
                       AND
                       DIFERENCIA <= 10
                   THEN
                       DISPLAY "Estas bastante cerca"
                   END-IF

                   IF
                       DIFERENCIA > 10
                       AND
                       DIFERENCIA <= 20
                   THEN
                       DISPLAY "Estas cerca"
                   END-IF

                   IF
                      DIFERENCIA >= 20
                   THEN
                       DISPLAY "Estas lejos"
                   END-IF
               END-IF

               IF NUMERO-INGRESADO = NUMERO-A-ENCONTRAR THEN
                   DISPLAY "Numero encontrado felicidades!!!"
               END-IF.

           GENERAR-NUMERO-ALEATORIO.
            COMPUTE NUMERO-A-ENCONTRAR = FUNCTION RANDOM
            * (NUMERO-AL-MAX - NUMERO-AL-MIN + 1) + NUMERO-AL-MIN.

       END PROGRAM USO-PERFORM-UNTIL.
