      ******************************************************************
      * Author: Byron Stevens Villegas Moya
      * Date: 2023-06-07
      * Purpose: Seccion Environment Division
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ENVIRONMENT-DIVISION.
       AUTHOR BYRON-VILLEGAS-MOYA.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM3278. *> Donde se escribio el codigo
       OBJECT-COMPUTER. IBM2378. *> Donde se ejecutara el codigo

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "Hello world"
            STOP RUN.
       END PROGRAM ENVIRONMENT-DIVISION.
