      ******************************************************************
      * Author: Byron Stevens Villegas Moya
      * Date: 2023-06-07
      * Purpose: Operaciones aritmeticas
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. OPERACIONES-ARIT.
       AUTHOR BYRON-VILLEGAS-MOYA.

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 WS-OPCION-PARCIAL PIC X(11).
       01 WS-OPCION PIC X(03).
           88 OPCIONES-VALIDAS VALUE "SUM" "RES" "MUL" "DIV" "SAL". *> Opciones disponibles
           88 OPCIONES-CONTINUAR VALUE "S" "N". *>
           88 SUMAR VALUE "SUM". *> SUMAR queda en true si el valor asignado es SUM
           88 RESTAR VALUE "RES". *> RESTAR queda en true si el valor asignado es RES
           88 MULTIPLICAR VALUE "MUL". *> MULTIPLICAR queda en true si el valor asignado es MUL
           88 DIVIDIR VALUE "DIV". *> DIVIDIR queda en true si el valor asignado es DIV
           88 S VALUE "S". *> S queda en true si el valor asignado es S
           88 N VALUE "N". *> N queda en true si el valor asignado es N
           88 SALIR VALUE "SAL". *> SALIR queda en true si el valor asignado es SAL
       01 WS-VALORES. *> GRUPO DE VARIABLES DEL MISMO TIPO
           05 WS-NUMERO1 PIC S9(3). *> S9 indica que sera un numero con signo a la izquierda
           05 WS-NUMERO2 PIC S9(3). *> S9 indica que sera un numero con signo a la izquierda
           05 WS-RESULTADO PIC S9(3). *> S9 indica que sera un numero con signo a la izquierda

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            MENU-OPCIONES. *> Bloque de codigo (funcion) siempre ejecuta la primera que encuentra
                DISPLAY "**** MENU DE OPERACIONES ***"
                DISPLAY "Opciones disponibles: "
                DISPLAY "* Sumar (SUM)"
                DISPLAY "* Restar (RES)"
                DISPLAY "* Multiplicar (MUL)"
                DISPLAY "* Dividir (DIV)"
                DISPLAY "* Salir (SAL)"
                DISPLAY " "
                DISPLAY "Ingrese opcion: "
                ACCEPT WS-OPCION-PARCIAL *> Recibe el valor por consola y lo asigna a la variable

                MOVE WS-OPCION-PARCIAL(1:3) TO WS-OPCION *> Recortamos el texto hasta 3 caracteres (SUM, RES, MUL, etc)

                MOVE FUNCTION UPPER-CASE(WS-OPCION) TO WS-OPCION *> Deja en mayuscula la opcion

                DISPLAY " "

                DISPLAY "Opcion seleccionada " WS-OPCION-PARCIAL

                DISPLAY " "

                IF NOT OPCIONES-VALIDAS THEN *> Si la opcion no es valida paramos la ejecucion
                    DISPLAY "ERROR OPCION NO DISPONIBLE"
                    STOP RUN. *> Paramos la ejecucion

                IF SALIR THEN
                    DISPLAY "Gracias por haber utilizado la aplicacion"
                    STOP RUN. *> Paramos la ejecucion

                PERFORM OPERACIONES. *> Llamamos a la funcion operaciones

            OPERACIONES. *> Bloque de codigo (funcion) que para ejecutarse debe ser llamado con PERFOM
               DISPLAY "Ingrese primer numero: "
               ACCEPT WS-NUMERO1

               DISPLAY " "

               DISPLAY "Ingrese segundo numero: "
               ACCEPT WS-NUMERO2

               DISPLAY " "

               IF SUMAR THEN *> Si la opcion es sumar = true realizamos la suma
                   ADD WS-NUMERO1 TO WS-NUMERO2 GIVING WS-RESULTADO *> Al numero1 le suma el numero2 y lo deja en la variable resultado

                   DISPLAY
                   "Resultado: "
                   WS-NUMERO1 " + "
                   WS-NUMERO2 " = "
                   WS-RESULTADO
               END-IF

               IF RESTAR THEN *> Si la opcion es restar = true realizamos la resta
                   SUBTRACT WS-NUMERO2
                   FROM WS-NUMERO1
                   GIVING WS-RESULTADO *> Al numero1 le resta el numero2 y lo deja en la variable resultado

                   DISPLAY
                   "Resultado: "
                   WS-NUMERO1 " - "
                   WS-NUMERO2 " = "
                   WS-RESULTADO
               END-IF

               IF MULTIPLICAR THEN
                   MULTIPLY WS-NUMERO1
                   BY WS-NUMERO2
                   GIVING WS-RESULTADO

                   DISPLAY
                   "Resultado: "
                   WS-NUMERO1 " * "
                   WS-NUMERO2 " = "
                   WS-RESULTADO
               END-IF

               IF DIVIDIR THEN
                   DIVIDE WS-NUMERO1
                   BY WS-NUMERO2
                   GIVING WS-RESULTADO

                   DISPLAY
                   "Resultado: "
                   WS-NUMERO1 " / "
                   WS-NUMERO2 " = "
                   WS-RESULTADO
               END-IF

               DISPLAY " "

               PERFORM MENU-CONTINUAR. *> Llamos a la funcion menu continuar

            MENU-CONTINUAR. *> Bloque de codigo (funcion) que para ejecutarse debe ser llamado con PERFOM
                DISPLAY
                "Desea continuar utilizando la aplicacion? (S o N): "

                ACCEPT WS-OPCION *> Recibe el valor por consola y lo asigna a la variable

                MOVE FUNCTION UPPER-CASE(WS-OPCION) TO WS-OPCION *> Deja en mayuscula la opcion

                IF S THEN *> So desea seguir utilizando la aplicacion lo llevamos al menu de opciones
                    DISPLAY " "
                    PERFORM MENU-OPCIONES.

                IF N THEN *> Si no desea seguir utilizando la aplicacion paramos la ejecucion
                   DISPLAY "Gracias por haber utilizado la aplicacion"
                   STOP RUN. *> Paramos la ejecucion

                IF NOT OPCIONES-CONTINUAR THEN *> Si la opcion no corresponde ni a S ni a N entonces volvemos a mostrar las opciones
                   DISPLAY "ERROR DEBE SELECCIONAR S O N"
                   PERFORM MENU-CONTINUAR. *> Llamos a la funcion menu continuar

            STOP RUN.
       END PROGRAM OPERACIONES-ARIT.
