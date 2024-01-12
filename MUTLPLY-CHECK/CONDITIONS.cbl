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
       01  WS-USER-INPUT1 PIC X(20).
       01  WS-USER-INPUT2 PIC X(20).
       01  WS-VALIDE-INPUT1 PIC 9(20).
       01  WS-VALIDE-INPUT2 PIC 9(20).
       01  WS-RESULT PIC 9(20).
       
       




       PROCEDURE DIVISION.
           DISPLAY "Veuillez rentrer le 1ER nombre entier positif"& 
                   " à verifier".
           ACCEPT WS-USER-INPUT1.
           PERFORM UNTIL function numval(WS-USER-INPUT1)>0
                   DISPLAY "Ceci n'est pas un nombre entier positif"
                   display "Veuillez entrer un autre nombre"
           END-PERFORM.

           MOVE WS-USER-INPUT1 TO WS-VALIDE-INPUT1.
           DISPLAY "Veuillez rentrer le 2E nombre entier positif"& 
                   " à verifier".
           ACCEPT WS-USER-INPUT2.
           PERFORM UNTIL function numval(WS-USER-INPUT2)>0
                   DISPLAY "Ceci n'est pas un nombre entier positif"
                   display "Veuillez entrer un autre nombre"
           END-PERFORM.

           MOVE WS-USER-INPUT2 TO WS-VALIDE-INPUT2.

           COMPUTE WS-RESULT = WS-VALIDE-INPUT1*WS-VALIDE-INPUT2

           IF WS-RESULT <= 99 AND WS-RESULT >= 50 
               DISPLAY WS-RESULT " est bien compris entre 50 et 99."
           ELSE
               DISPLAY WS-RESULT " depasse la plage 50 - 99."
           END-IF.

         
           STOP RUN.

           
