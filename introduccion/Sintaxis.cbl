      ******************************************************************
      * Author: Byron Stevens Villegas Moya
      * Date: 2023-06-07
      * Purpose: Reglas de sintaxis
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SINTAXIS.
       AUTHOR. BYRON VILLEGAS MOYA.
       DATE-WRITTEN. 17-10-2024.
       REMARKS. Sintaxis.

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 NOMBRECOMPLETOUNODOSTRESCUATROC PIC A(30). *> El nombre de variable no puede superar los 30 caracteres
       01 NOMBRE-UNO PIC A(30). *> El nombre de variable solo puede tener como caracter especial el guion, no puede partir el nombre de la variable con el guion
       01 NOMBRE2 PIC A(30). *> El nombre de variable puede tener numeros
       01 NomBre3 PIC A(30). *> El lenguaje no es case sensitive (no valida mayusculas o minusculas)

       PROCEDURE DIVISION.
            DISPLAY "Hello world"
            MOVE "HOLA" TO NOMBRE3. *> Como podemos ya sea en minuscula o mayuscula toma la variable
            DISPLAY NOMBRE3 "BYRON".

            STOP RUN.
       END PROGRAM SINTAXIS.
