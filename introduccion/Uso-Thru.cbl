      ******************************************************************
      * Author: Byron Stevens Villegas Moya
      * Date: 2023-06-21
      * Purpose: Uso de thru
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. USO-THRU.
       AUTHOR BYRON-VILLEGAS-MOYA.

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 NOMBRES PIC X(26).
       77 APELLIDOS PIC X(50).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           SOLICITA-DATOS.
               PERFORM SOLICITA-NOMBRES THRU SOLICITA-APELLIDOS.

           DISPLAY "Nombres " NOMBRES " Apellidos " APELLIDOS.
           STOP RUN.

           SOLICITA-NOMBRES.
               DISPLAY "Ingrese sus nombres: "
               ACCEPT NOMBRES.

           SOLICITA-APELLIDOS.
               DISPLAY "Ingrese sus apellidos: "
               ACCEPT APELLIDOS.
       END PROGRAM USO-THRU.
