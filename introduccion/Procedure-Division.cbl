      ******************************************************************
      * Author: Byron Stevens Villegas Moya
      * Date: 2023-06-07
      * Purpose: Seccion Procedure Division
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROCEDURE-DIVISION.
       AUTHOR. BYRON VILLEGAS MOYA.
       DATE-WRITTEN. 17-10-2024.
       REMARKS. Procedure Division.

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 NOMBRES PIC X(20). *> Variable de tipo texto con largo maximo de 20 caracteres, le agrega vacios a la derecha
       01 APELLIDOS PIC X(20). *> Variable de tipo texto con largo maximo de 20 caracteres, le agrega vacios a la derecha
       01 EDAD PIC 9(3) VALUE 26. *> Variable de tipo numerico con largo de 3, le agrega ceros a la izquierda y inicializada

       PROCEDURE DIVISION.
            DISPLAY "Hello world"
            MOVE "BYRON STEVENS" TO NOMBRES *> Le asigna el texto a la variable nombres
            MOVE "VILLEGAS MOYA" TO APELLIDOS *> Le asigna el texto a la variable apellidos
            DISPLAY "Mi nombre completo es: " NOMBRES " " APELLIDOS
            DISPLAY "Mi edad es: " EDAD
            STOP RUN.
       END PROGRAM PROCEDURE-DIVISION.
