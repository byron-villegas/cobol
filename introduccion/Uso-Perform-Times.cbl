      ******************************************************************
      * Author: Byron Stevens Villegas Moya
      * Date: 2023-06-21
      * Purpose: Uso del perform times
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. USO-PERFORM-TIMES.
       AUTHOR BYRON-VILLEGAS-MOYA.

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 NUMERO-SELECCIONADO PIC 9(03).
       77 NUMERO-MULTIPLO-MAXIMO PIC 9(03).
       77 MULTIPLO PIC 999.
       77 RESULTADO PIC 9(03).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           INGRESO-NUMERO.
               DISPLAY
               "Por favor ingrese numero "
               " para generar tabla de multiplicacion: "
               ACCEPT NUMERO-SELECCIONADO

               DISPLAY
               "Por favor ingrese hasta "
               "que multiplo desea generar: "
               ACCEPT NUMERO-MULTIPLO-MAXIMO.

               PERFORM MULTIPLICAR-NUMERO NUMERO-MULTIPLO-MAXIMO TIMES  *> Se ejecuta la rutina N veces
               STOP RUN.

           MULTIPLICAR-NUMERO.
               ADD 1 TO MULTIPLO
               MULTIPLY NUMERO-SELECCIONADO
               BY MULTIPLO
               GIVING RESULTADO

               DISPLAY
               NUMERO-SELECCIONADO
               "x"
               MULTIPLO
               "="
               RESULTADO.
       END PROGRAM USO-PERFORM-TIMES.
