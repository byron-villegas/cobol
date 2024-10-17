      ******************************************************************
      * Author: Byron Stevens Villegas Moya
      * Date: 2023-06-07
      * Purpose: Tipos de datos
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. TIPOS-DE-DATOS.
       AUTHOR BYRON-VILLEGAS-MOYA.

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 SALUDO PICTURE XXXX VALUE "Hola". *> 01 -> numero nivel de variable, nombre variable, declaracion del tipo (pic/picture), tipo (XXXX maximo 4 caracteres), asignar valor, valor (tiene que corresponder con el picture (definicion))
       01 SALUDO2 PIC XXXX VALUE "Hola". *> Es exactamente lo mismo de arriba pero abreviando la palabra picture
       01 SALUDO3 PICTURE X(04) VALUE "Hola". *> Es exactamente lo mismo de arriba pero abreviando la longitud
       01 SALUDO4 PIC X(04) VALUE "Hola". *> Forma completamente abreviada
       01 WS-PERSONA. *> Variable compuesta con un subjunto de variables internas, si se imprime la variable compuesta es la suma de todas las internas
           05 RUT PIC X(12).
           05 NOMBRES PIC X(25).
           05 APELLIDOS PIC X(25).
           05 EDAD PIC 9(03).
           05 SEXO PIC X(01) VALUE "M".
           05 FECHANACIMIENTO PIC X(10).
           05 TIPO PIC X(01).
               88 TIPOS-VALIDOS VALUE "S" "A".
               88 SOCIO VALUE "S".
               88 APODERADO  VALUE "A".
       01 WS-GROUP. *> Variable compuesta de tipo grupo
           05 ELEM1 PIC X(10).
           05 ELEM2 PIC X(10).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "Hello world" *> Muestra un texto en consola
            DISPLAY 70 *> Imprimir un numero en consola

            MOVE "11.111.111-1" TO RUT
            MOVE "BYRON STEVENS" TO NOMBRES
            MOVE "VILLEGAS MOYA" TO APELLIDOS
            MOVE 26 TO EDAD
            MOVE "1996-06-22" TO FECHANACIMIENTO
            MOVE "S" TO TIPO

            DISPLAY "Persona: " WS-PERSONA
            DISPLAY "Rut: " RUT
            DISPLAY "Nombres: " NOMBRES
            DISPLAY "Apellidos: " APELLIDOS
            DISPLAY "Tipo: " TIPO
            DISPLAY "Edad: " EDAD
            DISPLAY "Sexo: " SEXO
            DISPLAY "Fecha de nacimiento: " FECHANACIMIENTO

            IF NOT TIPOS-VALIDOS THEN
                DISPLAY "Tipo persona no valido"
            END-IF

            IF APODERADO THEN
               DISPLAY "Es apoderado"
            END-IF

            IF SOCIO THEN
               DISPLAY "Es socio"
            END-IF

            MOVE "BYRON" TO ELEM1
            MOVE "MILA" TO ELEM2

            DISPLAY WS-GROUP
            DISPLAY ELEM1
            DISPLAY ELEM2

            STOP RUN.
       END PROGRAM TIPOS-DE-DATOS.
