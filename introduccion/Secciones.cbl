      ******************************************************************
      * Author: Byron Stevens Villegas Moya
      * Date: 2023-06-07
      * Purpose: Detallar las secciones del programa
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION. *> Nombre del programa, author, etc
       PROGRAM-ID. SECCIONES. *> Nombre del programa
       AUTHOR. BYRON VILLEGAS MOYA.
       DATE-WRITTEN. 17-10-2024.
       REMARKS. Secciones.

       ENVIRONMENT DIVISION. *> Informacion del entorno, ordenador en el que se ha escrito, ordenador donde se ejecutara

       DATA DIVISION. *> Aqui se escriben registros, variables, nombres de campos, etc
       FILE SECTION.
       WORKING-STORAGE SECTION.

       PROCEDURE DIVISION. *> Procedimientos a ejecutar en el programa
            DISPLAY "Hello world"
            STOP RUN.
       END PROGRAM SECCIONES.
