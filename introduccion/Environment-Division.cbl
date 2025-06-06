      ******************************************************************
      * Author: Byron Stevens Villegas Moya
      * Date: 2023-06-07
      * Purpose: Seccion Environment Division
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ENVIRONMENT-DIVISION.
       AUTHOR. BYRON VILLEGAS MOYA.
       DATE-WRITTEN. 17-10-2024.
       REMARKS. Environment Division.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM3278. *> Donde se escribio el codigo
       OBJECT-COMPUTER. IBM2378. *> Donde se ejecutara el codigo

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       PROCEDURE DIVISION.
          DISPLAY "Hello world"
          STOP RUN.
       END PROGRAM ENVIRONMENT-DIVISION.
