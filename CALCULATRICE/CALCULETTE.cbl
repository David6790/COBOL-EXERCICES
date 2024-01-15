       IDENTIFICATION DIVISION.
       PROGRAM-ID. Calculatrice.
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
       01  WS-USER-INPUT1 PIC X(10).
       01  WS-USER-INPUT2 PIC x(10).
       01  WS-CONVERTED-NUMBER1 PIC 9(10)V99.
       01  WS-CONVERTED-NUMBER2 PIC 9(10)V99.
       01  WS-RESULT-TO-DISPLAY PIC -ZZZZ9999,99.
       01  WS-USER-INPUT-OPERATION-CHOICE PIC X.
       01  WS-OPERATION-CHOICE PIC X.
       



      




       PROCEDURE DIVISION.

           DISPLAY "BIENVENU A LA CALCULATRICE DE OUF DU DAV-DAV".
       0000-MODULE-DIRECTEUR SECTION.
       *>---------------------------
           
           PROCEDURES-START.
           *>===============

           PERFORM 1000-NUMBER-CHOSING.
           PERFORM 2000-OPERATION-CHOSING.
           PERFORM 3000-OPERATION-EXEC.


           PROCEDURES-END.
           *>============
               EXIT. 



       *>--Section qui demande les deux chiffres et effectue controle. 
       1000-NUMBER-CHOSING SECTION.
       *>---------------------------

           USER-INPUT-NUMBER-1.   
           *>==================
           DISPLAY "Veuillez choisir un premier nombre"
           ACCEPT WS-USER-INPUT1.
           PERFORM UNTIL function numval(WS-USER-INPUT1)>0
                   display "ceci n'est pas un nombre"
                   display "veuillez saisir un nombre"
                   ACCEPT WS-USER-INPUT1
           END-PERFORM.
           move function numval(WS-USER-INPUT1) to WS-CONVERTED-NUMBER1.

           USER-INPUT-NUMBER-2. 
           *>==================  
           DISPLAY "Veuillez choisir un deuxieme nombre"
           ACCEPT WS-USER-INPUT2.
           PERFORM UNTIL function numval(WS-USER-INPUT2)>0
                   display "ceci n'est pas un nombre"
                   display "veuillez saisir un nombre"
                   ACCEPT WS-USER-INPUT2
           END-PERFORM.
           move function numval(WS-USER-INPUT1) to WS-CONVERTED-NUMBER2.

           USER-INPUT-END.
           *>=============
               EXIT.

       2000-OPERATION-CHOSING SECTION.
       *>-----------------------------

           USER-SELECT-OPERATION.
           *>====================
           DISPLAY "Veuillez choisir une opération à effectuer : ".
           DISPLAY "| A : Addition | S: Soustraction | M: Multiplication"&
                   " D: DIVISION |".
           ACCEPT WS-USER-INPUT-OPERATION-CHOICE.
           PERFORM UNTIL 
                   (
                       WS-USER-INPUT-OPERATION-CHOICE = ("A")
                       OR 
                       WS-USER-INPUT-OPERATION-CHOICE =  ("a")
                       OR 
                       WS-USER-INPUT-OPERATION-CHOICE = ("S")
                       OR 
                       WS-USER-INPUT-OPERATION-CHOICE =  ("s")              
                       OR 
                       WS-USER-INPUT-OPERATION-CHOICE = ("M")
                       OR 
                       WS-USER-INPUT-OPERATION-CHOICE = ("m")
                       OR 
                       WS-USER-INPUT-OPERATION-CHOICE = ("D")
                       OR 
                       WS-USER-INPUT-OPERATION-CHOICE = ("d")       
                   )
                    DISPLAY "Veuillez saisir : A, S, M ou D"
                    ACCEPT WS-USER-INPUT-OPERATION-CHOICE
           END-PERFORM.

           MOVE function LOWER-CASE (WS-USER-INPUT-OPERATION-CHOICE) TO 
                         WS-OPERATION-CHOICE.
                                           
           USER-SELECT-OPERATION-END.
           *>=======================
               EXIT.        

       3000-OPERATION-EXEC SECTION.
       *>--------------------------

           OPERATION-START.
           *>==============

           EVALUATE WS-OPERATION-CHOICE
               WHEN  "a"
                   COMPUTE WS-RESULT-TO-DISPLAY = 
                       WS-CONVERTED-NUMBER1 + WS-CONVERTED-NUMBER2
                                            
               WHEN  "s"
                   COMPUTE WS-RESULT-TO-DISPLAY = 
                       WS-CONVERTED-NUMBER1 - WS-CONVERTED-NUMBER2

               WHEN "m"
                   COMPUTE WS-RESULT-TO-DISPLAY = 
                       WS-CONVERTED-NUMBER1 * WS-CONVERTED-NUMBER2  

               WHEN  "d"
                   COMPUTE WS-RESULT-TO-DISPLAY=
                      WS-CONVERTED-NUMBER1 / WS-CONVERTED-NUMBER2
               WHEN OTHER 
                   DISPLAY "Une erreur s'est produite."       
           
           END-EVALUATE.

           DISPLAY "Le résulat est: " WS-RESULT-TO-DISPLAY.


           OPERATION-END.
           *>===========

               EXIT.



           

       
       9999-PROGRAMME-END.
           STOP RUN.

           
