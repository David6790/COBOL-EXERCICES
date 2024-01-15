       IDENTIFICATION DIVISION.
       PROGRAM-ID. INTEGER-CHECKER.
       AUTHOR. DAVID LONG BIN.
       DATE-WRITTEN. 12/01/24.
       DATE-COMPILED.
       SECURITY. Standard.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-370.
       OBJECT-COMPUTER. IBM-370.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
   
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  WS-USER-INPUT PIC X(10).
       01  WS-CONVERTED-INT PIC 9(10).




       PROCEDURE DIVISION.
           DISPLAY "Veuillez saisir un nombre entier positif".
           ACCEPT WS-USER-INPUT.
           PERFORM UNTIL function numval(WS-USER-INPUT)<0
               DISPLAY "Le nombre saisi n'est pas un entier positif"
               DISPLAY "Veuillez saisir un autre nombre..."
           END-PERFORM.

           MOVE function numval(WS-USER-INPUT) TO WS-CONVERTED-INT.

           DISPLAY  WS-CONVERTED-INT.    

           STOP RUN.

           