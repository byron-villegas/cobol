      ******************************************************************
      * Author: Byron Stevens Villegas Moya
      * Date: 2023-06-15
      * Purpose: Ejemplo de cajero
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CAJERO-AUTOMATICO.
       AUTHOR. BYRON VILLEGAS MOYA.
       DATE-WRITTEN. 17-10-2024.
       REMARKS. Ejemplo de Cajero Automatico.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ARCHIVO-CUENTAS ASSIGN TO "cuentas.txt"
               ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD ARCHIVO-CUENTAS.
       01 CUENTA.
          05 RUT PIC X(10).
          05 CLAVE PIC 9(4).
          05 SALDO PIC 9(8).
       WORKING-STORAGE SECTION.
       77 WS-RUT PIC X(10).
       01 WS-ENCONTRADO PIC 9 VALUE 0.
       01 WS-PUNTO PIC X VALUE '.'.
       01 WS-CANTIDAD-PUNTO-ENC PIC 9 VALUE 0.
       01 WS-GUION PIC X VALUE '-'.
       01 WS-CANTIDAD-GUION-ENC PIC 9 VALUE 0.
       77 WS-CLAVE PIC 9(4).
       77 WS-SALDO PIC 99999999.
       77 WS-MONTO PIC 99999999.
       77 WS-RESULTADO PIC 99999999.
       01 WS-OPERACION PIC X(3).
           88 WS-OPERACIONES-VALIDAS VALUE "CON" "DEP" "GIR" "SAL".
       01 WS-RESPUESTA PIC XX.
           88 WS-RESPUESTAS-VALIDAS VALUE "SI" "NO".
           88 WS-RESPUESTA-SI VALUE "SI".
           88 WS-RESPUESTA-NO VALUE "NO".
       77 WS-FECHAYHORA PIC X(21).
       01 WS-FECHAYHORA-FORMATEADA.
           15 WS-ANIO-FORMATEADO PIC 9(4).
           15 FILLER PIC X VALUE '-'.
           15 WS-MES-FORMATEADO PIC 99.
           15 FILLER PIC X VALUE '-'.
           15 WS-DIA-FORMATEADO PIC 99.
           15 FILLER PIC X VALUE ' '.
           15 WS-HORA-FORMATEADA PIC 99.
           15 FILLER PIC X VALUE ':'.
           15 WS-MINUTO-FORMATEADO PIC 99.
           15 FILLER PIC X VALUE ':'.
           15 WS-SEGUNDO-FORMATEADO PIC 99.
       01 WS-FORMATO-MONEDA PIC Z(8)9.
       77 FIN-DE-CUENTAS PIC X VALUE 'N'.
       77 NOMBRE-TEMPORAL PIC X(20) VALUE "cuentas_temp.txt".

       PROCEDURE DIVISION.
            DISPLAY "----------- CAJERO AUTOMATICO -----------".

            PERFORM MENSAJE-BIENVENIDA.

            PERFORM IMPRIMIR-FECHA-ACTUAL.

            PERFORM LOGIN-USUARIO.

            PERFORM MOSTRAR-OPERACIONES.

            MENSAJE-BIENVENIDA.
               IF WS-HORA-FORMATEADA < 12 THEN
                   DISPLAY "BUENOS DIAS ESTIMADO(A)"
               END-IF

               IF WS-HORA-FORMATEADA >= 12 AND
                  WS-HORA-FORMATEADA < 20 THEN
                   DISPLAY "BUENAS TARDES ESTIMADO(A)"
               END-IF

               IF WS-HORA-FORMATEADA >= 20 AND
                  WS-HORA-FORMATEADA < 24 THEN
                   DISPLAY "BUENAS NOCHES ESTIMADO(A)"
               END-IF.

            SETEAR-FECHA-ACTUAL.
               MOVE FUNCTION CURRENT-DATE TO WS-FECHAYHORA
               MOVE WS-FECHAYHORA(1:4) TO WS-ANIO-FORMATEADO
               MOVE WS-FECHAYHORA(5:2) TO WS-MES-FORMATEADO
               MOVE WS-FECHAYHORA(7:2) TO WS-DIA-FORMATEADO
               MOVE WS-FECHAYHORA(9:2) TO WS-HORA-FORMATEADA
               MOVE WS-FECHAYHORA(11:2) TO WS-MINUTO-FORMATEADO
               MOVE WS-FECHAYHORA(13:2) TO WS-SEGUNDO-FORMATEADO.

            OBTENER-FECHA-ACTUAL.
               PERFORM SETEAR-FECHA-ACTUAL
               DISPLAY WS-FECHAYHORA-FORMATEADA.

            IMPRIMIR-FECHA-ACTUAL.
               DISPLAY "FECHA Y HORA ACTUAL: " WITH NO ADVANCING
               PERFORM OBTENER-FECHA-ACTUAL
               DISPLAY " ".

            IMPRIMIR-MUCHAS-GRACIAS.
               DISPLAY "MUCHAS GRACIAS POR UTILIZAR NUESTROS SERVICIOS".

            MENSAJE-CONF-BORR.
               DISPLAY "PARA CONFIRMAR. PRESIONE LA TECLA <ENTER>"
               DISPLAY
                   "SI SE EQUIVOCA. PRESIONE LA TECLA"
                   " <DEL> PARA BORRAR".

            REGISTRO-USUARIO.
                OPEN EXTEND ARCHIVO-CUENTAS
                MOVE WS-RUT TO RUT
                MOVE WS-CLAVE TO CLAVE
                MOVE 0 TO SALDO
                WRITE CUENTA AFTER ADVANCING 1 LINE
                CLOSE ARCHIVO-CUENTAS
                DISPLAY "USUARIO CREADO EXITOSAMENTE".

            LEER-CUENTA.
               OPEN INPUT ARCHIVO-CUENTAS
               PERFORM UNTIL FIN-DE-CUENTAS = 'S'
                   READ ARCHIVO-CUENTAS
                       NOT AT END
                           IF WS-RUT = RUT
                               MOVE 1 TO WS-ENCONTRADO
                           END-IF

                           IF WS-RUT = RUT AND
                              WS-CLAVE = CLAVE
                               MOVE 2 TO WS-ENCONTRADO
                               MOVE SALDO TO WS-SALDO
                               MOVE 'S' TO FIN-DE-CUENTAS
                           END-IF
                       AT END
                           MOVE 'S' TO FIN-DE-CUENTAS
                   END-READ
               END-PERFORM
               CLOSE ARCHIVO-CUENTAS

               IF WS-ENCONTRADO = 0
                   DISPLAY "RUT NO ENCONTRADO"
                   DISPLAY "DESEA CREAR UN USUARIO? SI O NO"
                   ACCEPT WS-RESPUESTA
                   MOVE FUNCTION UPPER-CASE(WS-RESPUESTA)
                   TO WS-RESPUESTA

                   IF WS-RESPUESTA-NO
                       PERFORM IMPRIMIR-MUCHAS-GRACIAS
                       STOP RUN
                   ELSE
                       PERFORM REGISTRO-USUARIO
                   END-IF
               END-IF

               IF WS-ENCONTRADO = 1
                   DISPLAY "RUT Y/O CLAVE INVALIDOS"
                   PERFORM IMPRIMIR-MUCHAS-GRACIAS
                   STOP RUN.

            LOGIN-USUARIO.
               DISPLAY
                   "PARA INICIAR SESION DEBE INGRESAR RUT Y CLAVE"
               PERFORM INGRESAR-RUT

               IF WS-CANTIDAD-GUION-ENC = 0 OR
                  WS-CANTIDAD-GUION-ENC > 1 THEN
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

               PERFORM LEER-CUENTA

               DISPLAY "HA INICIADO SESION EXITOSAMENTE"
               DISPLAY " "

               PERFORM IMPRIMIR-FECHA-ACTUAL.

            INGRESAR-RUT.
               DISPLAY "INGRESE SU RUT: "
               PERFORM MENSAJE-CONF-BORR.
               ACCEPT WS-RUT
               DISPLAY " "

               MOVE FUNCTION UPPER-CASE(WS-RUT) TO WS-RUT

               MOVE 0 TO WS-CANTIDAD-PUNTO-ENC *> Se resetea el valor
               MOVE 0 TO WS-CANTIDAD-GUION-ENC *> Se resetea el valor

               INSPECT WS-RUT TALLYING WS-CANTIDAD-PUNTO-ENC
               FOR ALL WS-PUNTO

               INSPECT WS-RUT TALLYING WS-CANTIDAD-GUION-ENC
               FOR ALL WS-GUION.

            INGRESAR-CLAVE.
               DISPLAY "INGRESE SU CLAVE: "
               PERFORM MENSAJE-CONF-BORR.
               ACCEPT WS-CLAVE
               DISPLAY " ".

            INGRESAR-OPERACION.
                DISPLAY "INGRESE OPERACION: "
                PERFORM MENSAJE-CONF-BORR.
                ACCEPT WS-OPERACION
                MOVE FUNCTION UPPER-CASE(WS-OPERACION) TO WS-OPERACION
                DISPLAY " ".

            INGRESAR-RESPUESTA.
                DISPLAY "DESEA REALIZAR OTRA OPERACION? SI O NO"
                DISPLAY "RESPUESTA: "
                PERFORM MENSAJE-CONF-BORR.
                ACCEPT WS-RESPUESTA
                MOVE FUNCTION UPPER-CASE(WS-RESPUESTA) TO WS-RESPUESTA
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

            MOSTRAR-SALDO-ACTUAL.
                MOVE WS-SALDO TO WS-FORMATO-MONEDA

                DISPLAY "SALDO ACTUAL: " WS-FORMATO-MONEDA.

            CONSULTAR-SALDO.
                PERFORM MOSTRAR-SALDO-ACTUAL
                PERFORM IMPRIMIR-FECHA-ACTUAL
                PERFORM REALIZAR-OTRA-OPERACION.

            GIRAR.
                IF WS-SALDO = 0 THEN
                   DISPLAY
                       "LO SENTIMOS NO POSEE SALDO"
                       " DISPONIBLE PARA REALIZAR UN GIRO"
                   PERFORM REALIZAR-OTRA-OPERACION
                END-IF

                IF WS-SALDO > 0 THEN
                   PERFORM INGRESAR-MONTO-GIRAR
                   IF WS-MONTO > WS-SALDO THEN
                       DISPLAY
                           "ERROR EL MONTO A GIRAR NO PUEDE SUPERAR "
                           "EL SALDO DISPONIBLE"
                       DISPLAY
                           "POR FAVOR INGRESE NUEVAMENTE EL MONTO"
                       PERFORM INGRESAR-MONTO-GIRAR
                   END-IF

                   IF WS-MONTO <= WS-SALDO THEN
                       MOVE WS-MONTO TO WS-FORMATO-MONEDA
                       DISPLAY
                           "SE HA REALIZADO UN GIRO "
                           "POR EL SIGUIENTE MONTO: " WS-FORMATO-MONEDA

                           MOVE WS-SALDO TO WS-FORMATO-MONEDA

                           DISPLAY "SALDO ACTUAL: " WS-FORMATO-MONEDA

                           SUBTRACT WS-MONTO
                           FROM WS-SALDO
                           GIVING WS-RESULTADO

                           MOVE WS-RESULTADO TO WS-SALDO

                           MOVE WS-SALDO TO WS-FORMATO-MONEDA

                           DISPLAY "SALDO NUEVO: " WS-FORMATO-MONEDA

                           PERFORM IMPRIMIR-FECHA-ACTUAL

                           PERFORM REALIZAR-OTRA-OPERACION

                    END-IF
                END-IF.

            DEPOSITAR.
               PERFORM INGRESAR-MONTO-DEPOSITAR

               MOVE WS-MONTO TO WS-FORMATO-MONEDA

               DISPLAY
                   "SE HA REALIZADO UN DEPOSITO "
                   "POR EL SIGUIENTE MONTO: " WS-FORMATO-MONEDA

               PERFORM MOSTRAR-SALDO-ACTUAL

               ADD WS-MONTO
               TO WS-SALDO
               GIVING WS-RESULTADO

               MOVE WS-RESULTADO TO WS-SALDO

               MOVE WS-SALDO TO WS-FORMATO-MONEDA

               DISPLAY "SALDO NUEVO: " WS-FORMATO-MONEDA

               PERFORM IMPRIMIR-FECHA-ACTUAL

               PERFORM REALIZAR-OTRA-OPERACION.

            MOSTRAR-OPERACIONES.
                DISPLAY "----------- MENU DE OPERACIONES -----------"
                DISPLAY "CONSULTAR SALDO (CON)"
                DISPLAY "GIRAR DINERO (GIR)"
                DISPLAY "DEPOSITAR DINERO (DEP)"
                DISPLAY "SALIR (SAL)"

                PERFORM INGRESAR-OPERACION

                IF NOT WS-OPERACIONES-VALIDAS THEN
                    DISPLAY "ERROR INGRESE UNA OPERACION VALIDA"
                    PERFORM INGRESAR-OPERACION
                END-IF


                EVALUATE WS-OPERACION
                   WHEN "CON"
                       PERFORM CONSULTAR-SALDO
                   WHEN "GIR"
                       PERFORM GIRAR
                   WHEN "DEP"
                       PERFORM DEPOSITAR
                   WHEN "SAL"
                       PERFORM IMPRIMIR-MUCHAS-GRACIAS
                   WHEN OTHER
                       DISPLAY "OPERACION NO VALIDA"
                       PERFORM MOSTRAR-OPERACIONES
                END-EVALUATE.

            STOP RUN.
       END PROGRAM CAJERO-AUTOMATICO.
