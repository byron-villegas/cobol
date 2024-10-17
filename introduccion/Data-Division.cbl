      ******************************************************************
      * Author: Byron Stevens Villegas Moya
      * Date: 2023-06-07
      * Purpose: Seccion Data Division
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DATA-DIVISION.
       AUTHOR BYRON-VILLEGAS-MOYA.

       DATA DIVISION.
       FILE SECTION. *> Aqui se colocan los campos a utilizar de archivos
       WORKING-STORAGE SECTION. *> Aqui se declaran las variables que no tengan que ver con los archivos

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "Hello world"
            STOP RUN.
       END PROGRAM DATA-DIVISION.
