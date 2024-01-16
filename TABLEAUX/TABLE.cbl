       IDENTIFICATION DIVISION.
       PROGRAM-ID. TABLE-EXERCICES.
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

       01  WS-ECOLE.  
           05 WS-TAB-CLASSE OCCURS 30 TIMES 
               INDEXED BY WS-INDEX-CLASSE. 
               10 WS-ID PIC X(5).
               10 WS-TAB-ELEVE OCCURS 25 TIMES 
                   INDEXED BY WS-INDEX-ELEVE.
                   15 WS-NOM PIC X(12).
                   88 FIN-CLASSE VALUE SPACE.
                   15 WS-PRENOM PIC X(12).
                   15 WS-TAB-NOTE OCCURS 5 TIMES 
                      INDEXED BY WS-INDEX-NOTE. 
                       20 WS-MATIERE PIC X(20).
                       20 WS-COEFF PIC 9.
                       20 WS-NOTE PIC 9(2)V99.
                       88 PAS-DE-NOTE VALUE SPACE.


       01  WS-TOTAL-STUDENT PIC 9(3).   
       01  WS-TEMP-CUMUL-COEFF PIC 99.
       01  WS-TEMP-NOTE-PONDEREE PIC 9(2)V99.     
       01  WS-MOYENNE-MATIERE PIC 9(2)V99.   
       01  WS-TOTAL-MOYENNES-ELEVE PIC 9(2)V99.  
       01  WS-CUMUL-MOY-GEN-ELEVE PIC 9(2)V99.  
       01  WS-MOY-GEN-ELEVE PIC 9(2)V99.  



       PROCEDURE DIVISION.

       0000-MODULE-DIRECTEUR SECTION.
       *>----------------------------

           PROCEDURE-START.
           *>==============

           PERFORM 1000-COMPUTE-NUMBER-STUDENTS.
           PERFORM 2000-COMPUTE-MOYENNE-GENERALE.


           PROCEDURE-END.
           *>============
               EXIT.

           
       *>---------------------------------------------------------------
       1000-COMPUTE-NUMBER-STUDENTS SECTION.
       *>---------------------------------------------------------------
       

           COMP-NUM-STUDENT-START. 
           *>=====================
           MOVE 0 TO WS-TOTAL-STUDENT.
           PERFORM VARYING WS-INDEX-CLASSE FROM 1 BY 1 UNTIL 
                                           WS-INDEX-CLASSE >30

               PERFORM VARYING WS-INDEX-ELEVE FROM 1 BY 1 UNTIL 
                                               WS-INDEX-ELEVE > 25
    
                       IF NOT FIN-CLASSE OF WS-TAB-ELEVE(WS-INDEX-ELEVE)                               
                          COMPUTE WS-TOTAL-STUDENT = WS-TOTAL-STUDENT +1
                       END-IF.
               END-PERFORM.     

           END-PERFORM. 

           COMP-NUM-STUDENT-END.
           *>===================

           EXIT.



       *>---------------------------------------------------------------
       2000-COMPUTE-MOYENNE-GENERALE.
       *>---------------------------------------------------------------
           
           COMPT-MOY-GEN-START.
           *>==================
           MOVE 0 TO WS-MOYENNE-GENERALE.
           
           

           PERFORM VARYING WS-INDEX-ELEVE FROM 1 BY 1 UNTIL 
                                          WS-INDEX-ELEVE > 25
               INITIALIZE WS-TOTAL-MOYENNES-ELEVE. 
               INITIALIZE WS-MOYENNE-MATIERE. 
               INITIALIZE WS-TEMP-CUMUL-COEFF.
               INITIALIZE WS-TEMP-NOTE-PONDEREE. 
              
               
                 PERFORM VARYING WS-INDEX-NOTE FROM 1 BY 1 UNTIL
                                               WS-INDEX-NOTE > 5
                      COMPUTE WS-TEMP-NOTE-PONDEREE =
                              (WS-NOTE OF WS-TAB-NOTE(WS-INDEX-NOTE))*
                              (WS-COEFF OF WS-TAB-NOTE(WS-INDEX-NOTE))
                      COMPUTE WS-TEMP-CUMUL-COEFF = WS-TEMP-CUMUL-COEFF
                              + WS-COEFF OF WS-TAB-NOTE(WS-INDEX-NOTE)
                      COMPUTE WS-MOYENNE-MATIERE = 
                              WS-TEMP-NOTE-PONDEREE /
                              WS-TEMP-CUMUL-COEFF
                      COMPUTE WS-TOTAL-MOYENNES-ELEVE =
                              WS-TOTAL-MOYENNES-ELEVE + 
                              WS-MOYENNE-MATIERE                     

                 END-PERFORM.  

               COMPUTE WS-MOY-GEN-ELEVE = WS-TOTAL-MOYENNES-ELEVE /5
               COMPUTE WS-CUMUL-MOY-GEN-ELEVE = WS-CUMUL-MOY-GEN-ELEVE
                       + WS-MOY-GEN-ELEVE        
                                          
           END-PERFORM.      

           COMPUTE WS-MOYENNE-GENERALE =  WS-CUMUL-MOY-GEN-ELEVE /
                   WS-TOTAL-STUDENT.  


           COMPT-MOY-GEN-END.
           *>================
               EXIT.


       *>---------------------------------------------------------------
       9999-FIN-PROGRAMME.
       *>---------------------------------------------------------------
       STOP RUN.
       END PROGRAM TABLE-EXERCICES. 

           
