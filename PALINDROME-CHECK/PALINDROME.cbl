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
       01  WS-USER-INPUT PIC X(20).
       01  WS-REVERSED-STRING PIC X(20).




       PROCEDURE DIVISION.
           DISPLAY "Veuillez rentrer le mot à verifier".
           ACCEPT WS-USER-INPUT.
           MOVE function reverse(WS-USER-INPUT) TO WS-REVERSED-STRING.

           DISPLAY WS-USER-INPUT.
           DISPLAY WS-REVERSED-STRING.      
        
       *> methode à completer encore. car il faut normaliser encore la 
       *> la casse, trimmer les espaces et ignorer la ponctuation. 
       
              

           STOP RUN.

           
