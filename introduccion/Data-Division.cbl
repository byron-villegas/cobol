      ******************************************************************
      * Author: Byron Stevens Villegas Moya
      * Date: 2023-06-07
      * Purpose: Seccion Data Division
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DATA-DIVISION.
       AUTHOR. BYRON VILLEGAS MOYA.
       DATE-WRITTEN. 17-10-2024.
       REMARKS. Data Division.

       DATA DIVISION.
       FILE SECTION. *> Aqui se colocan los campos a utilizar de archivos
       WORKING-STORAGE SECTION. *> Aqui se declaran las variables que no tengan que ver con los archivos

       PROCEDURE DIVISION.
          DISPLAY "Hello world"
          STOP RUN.
       END PROGRAM DATA-DIVISION.
