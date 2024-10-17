      ******************************************************************
      * Author: Byron Stevens Villegas Moya
      * Date: 2023-06-21
      * Purpose: Uso de go to
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. USO-GO-TO.
       AUTHOR BYRON-VILLEGAS-MOYA.


       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 OPCION PIC X.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM CONTINUACION.

           IF OPCION = "N" OR OPCION = "n" THEN
               GO TO FINALIZA-PROGRAMA.

           IF OPCION = "S" OR OPCION = "s" THEN
               PERFORM PROGRAMA
           ELSE
               DISPLAY "Por favor, introduce una 'N' o una 'S'.".

           FINALIZA-PROGRAMA.
               STOP RUN.

              CONTINUACION.
                 DISPLAY "¿Ejecutar el programa (S/N)?".
                 ACCEPT OPCION.

              PROGRAMA.
                 DISPLAY "Se ejecuta el programa.".

       END PROGRAM USO-GO-TO.
