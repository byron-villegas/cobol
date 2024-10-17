      ******************************************************************
      * Author: Byron Stevens Villegas Moya
      * Date: 2023-06-15
      * Purpose: Ejemplo de cajero
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CAJERO-AUTOMATICO.
       AUTHOR BYRON-VILLEGAS-MOYA.

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 WS-RUT-TEMP PIC X(10).
       01 WS-PUNTO PIC X VALUE '.'.
       01 WS-CANTIDAD-PUNTO-ENC PIC 9 VALUE 0.
       01 WS-GUION PIC X VALUE '-'.
       01 WS-CANTIDAD-GUION-ENC PIC 9 VALUE 0.
       77 WS-CLAVE PIC 9(04).
       77 WS-SALDO PIC 99999999.
       77 WS-MONTO PIC 99999999.
       77 WS-RESULTADO PIC 99999999.
       01 WS-OPERACION PIC X(03).
           88 WS-OPERACIONES-VALIDAS VALUE "CON" "DEP" "GIR" "SAL".
           88 WS-OPERACION-CONSULTAR VALUE "CON".
           88 WS-OPERACION-DEPOSITAR VALUE "DEP".
           88 WS-OPERACION-GIRAR VALUE "GIR".
           88 WS-OPERACION-SALIR VALUE "SAL".
       01 WS-RESPUESTA PIC X(02).
           88 WS-RESPUESTAS-VALIDAS VALUE "SI" "NO".
           88 WS-RESPUESTA-SI VALUE "SI".
           88 WS-RESPUESTA-NO VALUE "NO".
       77 WS-FECHAYHORA PIC X(21).
       01 WS-FECHAYHORA-FORMATEADA.
           15 WS-ANIO-FORMATEADO PIC 9(4).
           15 FILLER PIC X VALUE '-'.
           15 WS-MES-FORMATEADO PIC 9(2).
           15 FILLER PIC X VALUE '-'.
           15 WS-DIA-FORMATEADO PIC 9(2).
           15 FILLER PIC X VALUE ' '.
           15 WS-HORA-FORMATEADA PIC 9(2).
           15 FILLER PIC X VALUE ':'.
           15 WS-MINUTO-FORMATEADO PIC 9(2).
           15 FILLER PIC X VALUE ':'.
           15 WS-SEGUNDO-FORMATEADO PIC 9(2).
       01 WS-EOF PIC A(1).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "----------- CAJERO AUTOMATICO -----------".

            SETEAR-FECHA-ACTUAL.
               MOVE FUNCTION CURRENT-DATE TO WS-FECHAYHORA
               MOVE WS-FECHAYHORA(1:4) TO WS-ANIO-FORMATEADO
               MOVE WS-FECHAYHORA(5:2) TO WS-MES-FORMATEADO
               MOVE WS-FECHAYHORA(7:2) TO WS-DIA-FORMATEADO
               MOVE WS-FECHAYHORA(9:2) TO WS-HORA-FORMATEADA
               MOVE WS-FECHAYHORA(11:2) TO WS-MINUTO-FORMATEADO
               MOVE WS-FECHAYHORA(13:2) TO WS-SEGUNDO-FORMATEADO.

            LOGIN-USUARIO.
               DISPLAY "----------- LOGIN USUARIO -----------"

               PERFORM INGRESAR-RUT

               IF WS-CANTIDAD-GUION-ENC = 0 OR WS-CANTIDAD-GUION-ENC > 1 THEN
                   DISPLAY "ERROR RUT DEBE POSEER UN GUION"
                   DISPLAY "POR FAVOR INGRESE DE NUEVO EL RUT"
                   PERFORM INGRESAR-RUT
               END-IF

               IF WS-CANTIDAD-PUNTO-ENC >= 1 THEN
                   DISPLAY "ERROR RUT NO DEBE POSEER PUNTOS"
                   DISPLAY "POR FAVOR INGRESE DE NUEVO EL RUT"
                   PERFORM INGRESAR-RUT
               END-IF

               PERFORM INGRESAR-CLAVE

               IF WS-CLAVE <> "1111" THEN
                   DISPLAY "ERROR USUARIO Y/O CLAVE INVALIDA"
                   DISPLAY " "
                   DISPLAY "POR FAVOR REINTENTE INICIO DE SESION"
                   PERFORM LOGIN-USUARIO
               END-IF.

               DISPLAY "HA INICIADO SESION EXITOSAMENTE"
               DISPLAY " "

               PERFORM IMPRIMIR-FECHA-ACTUAL.

               PERFORM MOSTRAR-OPERACIONES.

            INGRESAR-RUT.
               DISPLAY "INGRESE SU RUT: "
               ACCEPT WS-RUT-TEMP
               DISPLAY " "

               MOVE 0 TO WS-CANTIDAD-PUNTO-ENC *> Se resetea el valor
               MOVE 0 TO WS-CANTIDAD-GUION-ENC *> Se resetea el valor

               INSPECT WS-RUT-TEMP TALLYING WS-CANTIDAD-PUNTO-ENC
               FOR ALL WS-PUNTO

               INSPECT WS-RUT-TEMP TALLYING WS-CANTIDAD-GUION-ENC
               FOR ALL WS-GUION.

            INGRESAR-CLAVE.
               DISPLAY "INGRESE SU CLAVE: "
               ACCEPT WS-CLAVE
               DISPLAY " ".

            IMPRIMIR-PUNTO.
                DISPLAY "." WITH NO ADVANCING.

            OBTENER-FECHA-ACTUAL.
               PERFORM SETEAR-FECHA-ACTUAL
               DISPLAY WS-FECHAYHORA-FORMATEADA.

            IMPRIMIR-FECHA-ACTUAL.
               DISPLAY "FECHA Y HORA ACTUAL: " WITH NO ADVANCING
               PERFORM OBTENER-FECHA-ACTUAL
               DISPLAY " ".

            IMPRIMIR-MUCHAS-GRACIAS.
              DISPLAY "MUCHAS GRACIAS POR UTILIZAR NUESTROS SERVICIOS".

            INGRESAR-OPERACION.
                DISPLAY "INGRESE OPERACION: "
                ACCEPT WS-OPERACION
                DISPLAY " ".

            INGRESAR-RESPUESTA.
                DISPLAY "DESEA REALIZAR OTRA OPERACION? SI O NO"
                DISPLAY "RESPUESTA: "
                ACCEPT WS-RESPUESTA
                DISPLAY " ".

            INGRESAR-MONTO-GIRAR.
                DISPLAY "INGRESE MONTO A GIRAR: "
                ACCEPT WS-MONTO
                DISPLAY " ".

            INGRESAR-MONTO-DEPOSITAR.
                DISPLAY "INGRESE MONTO A DEPOSITAR: "
                ACCEPT WS-MONTO
                DISPLAY " ".

            REALIZAR-OTRA-OPERACION.

                PERFORM INGRESAR-RESPUESTA

                IF NOT WS-RESPUESTAS-VALIDAS THEN
                    DISPLAY "ERROR INGRESE RESPUESTA VALIDA"
                    DISPLAY "POR FAVOR INGRESE SU RESPUESTA"
                    PERFORM INGRESAR-RESPUESTA
                END-IF

                IF WS-RESPUESTA-SI THEN
                    PERFORM MOSTRAR-OPERACIONES
                END-IF

                IF WS-RESPUESTA-NO THEN
                    PERFORM IMPRIMIR-MUCHAS-GRACIAS
                END-IF.

            MOSTRAR-OPERACIONES.
                DISPLAY "----- MENU DE OPERACIONES ----"
                DISPLAY "CON - CONSULTAR SALDO"
                DISPLAY "GIR - GIRAR DINERO"
                DISPLAY "DEP - DEPOSITAR DINERO"
                DISPLAY "SAL - SALIR"

                PERFORM INGRESAR-OPERACION

                IF NOT WS-OPERACIONES-VALIDAS THEN
                    DISPLAY "ERROR INGRESE UNA OPERACION VALIDA"
                    PERFORM INGRESAR-OPERACION
                END-IF

                IF WS-OPERACION-CONSULTAR THEN
                    DISPLAY "SALDO ACTUAL: " WS-SALDO

                    PERFORM IMPRIMIR-FECHA-ACTUAL

                    PERFORM REALIZAR-OTRA-OPERACION
                END-IF

                IF WS-OPERACION-GIRAR THEN
                    IF WS-SALDO = 0 THEN
                        DISPLAY "LO SENTIMOS NO POSEE SALDO PARA GIRAR"
                        PERFORM REALIZAR-OTRA-OPERACION
                    END-IF

                    IF WS-SALDO > 0 THEN
                        PERFORM INGRESAR-MONTO-GIRAR
                        IF WS-MONTO > WS-SALDO THEN
                            DISPLAY
                            "ERROR EL MONTO A GIRAR NO PUEDE SUPERAR "
                            "EL SALDO DISPONIBLE"
                            DISPLAY "POR FAVOR INGRESE "
                            "NUEVAMENTE EL MONTO"
                            PERFORM INGRESAR-MONTO-GIRAR
                        END-IF

                        IF WS-MONTO <= WS-SALDO THEN
                            DISPLAY "SE REALIZA UN GIRO "
                            "POR EL SIGUIENTE MONTO: " WS-MONTO

                            DISPLAY "SALDO ACTUAL: " WS-SALDO

                            SUBTRACT WS-MONTO
                            FROM WS-SALDO
                            GIVING WS-RESULTADO

                            MOVE WS-RESULTADO TO WS-SALDO

                            DISPLAY "SALDO NUEVO: " WS-SALDO

                            PERFORM IMPRIMIR-FECHA-ACTUAL

                            PERFORM REALIZAR-OTRA-OPERACION

                        END-IF
                    END-IF

                END-IF

                IF WS-OPERACION-DEPOSITAR THEN
                    PERFORM INGRESAR-MONTO-DEPOSITAR

                    DISPLAY "SE REALIZA UN DEPOSITO "
                            "POR EL SIGUIENTE MONTO: " WS-MONTO

                    DISPLAY "SALDO ACTUAL: " WS-SALDO

                    ADD WS-MONTO
                    TO WS-SALDO
                    GIVING WS-RESULTADO

                    MOVE WS-RESULTADO TO WS-SALDO

                    DISPLAY "SALDO NUEVO: " WS-SALDO

                    PERFORM IMPRIMIR-FECHA-ACTUAL

                    PERFORM REALIZAR-OTRA-OPERACION
                END-IF

                IF WS-OPERACION-SALIR THEN
                    PERFORM IMPRIMIR-MUCHAS-GRACIAS
                END-IF

            STOP RUN.
       END PROGRAM CAJERO-AUTOMATICO.
