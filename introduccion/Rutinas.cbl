      ******************************************************************
      * Author: Byron Stevens Villegas Moya
      * Date: 2023-06-09
      * Purpose: Rutinas
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. RUTINAS.
       AUTHOR. BYRON VILLEGAS MOYA.
       DATE-WRITTEN. 17-10-2024.
       REMARKS. Rutinas.

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.


       PROCEDURE DIVISION.
            PRIMERA-RUTINA. *> Bloque de codigo (funcion) siempre ejecuta la primera que encuentra
                DISPLAY "HOLA SOY LA PRIMERA RUTINA"
                PERFORM SEGUNDA-RUTINA.  *> Llamamos a la funcion SEGUNDA RUTINA

            SEGUNDA-RUTINA. *> Bloque de codigo (funcion)
                DISPLAY "HOLA SOY LA SEGUNDA RUTINA"

            STOP RUN.
       END PROGRAM RUTINAS.
