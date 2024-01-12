       IDENTIFICATION DIVISION.
       PROGRAM-ID. JEU-DU-PENDU.
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
       01  WS-WORD-SELECTED-BY-USER PIC X(20).
       01  WS-WORD-TO-GUESS PIC X(20).
       01  WS-ALL-ALPHABET-CHAR PIC X(26) VALUE "ABCDEFGHIJKLMN" 
      &                                        "OPQRSTUVWXYZ".
       01  WS-LETTER-HIDDER PIC X(26) VALUE ALL "_".
       01  WS-USER-INPUT-CHAR PIC X.
                                              
       PROCEDURE DIVISION.

       0000-MAIN-PROCEDURES SECTION.
       *>--------------------------
  
           MAIN-PROCEDURES-STARTS.
           *>=====================
  
           PERFORM 1000-ASK-USER-SELECT-WORD.
           PERFORM 2000-MAIN-GAME-ALGORITHME.

           MAIN-PROCEDURES-END.
           *>=================
               EXIT.

       1000-ASK-USER-SELECT-WORD SECTION.
       *>--------------------------------
   
           ASK-USER-SELECT-WORD-START.
           *>=========================
   
           DISPLAY "Bienvenu au jeu du pendu by David Long Bin".
           DISPLAY "Veuillez choisir un mot pour commencer..."
           ACCEPT WS-WORD-SELECTED-BY-USER.
           DISPLAY "A VOUS DE JOUER!".

           ASK-USER-SELECT-WORD-END.
           *>=======================
               EXIT.

       2000-MAIN-GAME-ALGORITHME SECTION.
       *>--------------------------------
      
           CONVERT-WORD-TO-DASH.
           *>===================
           MOVE WS-WORD-SELECTED-BY-USER TO WS-WORD-TO-GUESS.
           INSPECT WS-WORD-TO-GUESS CONVERTING WS-ALL-ALPHABET-CHAR 
                                    TO WS-LETTER-HIDDER.                   
           DISPLAY WS-WORD-TO-GUESS.   

           APPLY-MAIN-SEARCH-LOOP.
           *>=====================

           PERFORM TEST AFTER UNTIL WS-WORD-SELECTED-BY-USER = 
                                    WS-WORD-TO-GUESS                         
               ACCEPT WS-USER-INPUT-CHAR
               INSPECT WS-ALL-ALPHABET-CHAR CONVERTING WS-USER-INPUT-CHAR 
                                            TO "_"                            
               MOVE WS-WORD-SELECTED-BY-USER TO WS-WORD-TO-GUESS
               INSPECT WS-WORD-TO-GUESS CONVERTING WS-ALL-ALPHABET-CHAR  
                                        TO WS-LETTER-HIDDER                       
               DISPLAY WS-WORD-TO-GUESS
           END-PERFORM.
           DISPLAY "BRAVO TROUVE!".

           MAIN-GAME-ALGORITHME-END.
           *>=======================
               EXIT.                                                                                   

       9999-FIN-PROGRAMME.
       *>-----------------
       STOP RUN.
       END PROGRAM JEU-DU-PENDU.            
           
   
           
