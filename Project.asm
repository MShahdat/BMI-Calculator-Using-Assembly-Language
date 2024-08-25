INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H

.DATA
IN_CM DW 0H
IN_KG DW 0H
MSG DB "This BMI is : $" 
RES1 DB 0H
RES2 DB 0H
RES DB 0H 
BMI DB 0H
PA1 DW 100D
PA2 DW 100D
CM2 DW 0H
KG2 DW 0H
C1 DW 0H
C2 DW 0H
C3 DW 0H
C4 DW 0H 
CHE DB 0H 
SUM DW 0H
NO DW 0H 
MSA DB '      ==================== WELCOME TO MY PROJECT ====================$' 
MSB DB '      ******************** BMI CALCULATOR ********************$'
MSC DB ' """Info - 1feet= 30cm"""$'
MSD DB 'Enter the height in (cm) : $'
MSE DB 'Enter the weight in (kg) : $'
   
  
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
   
    
    MOV AH,9
    LEA DX,MSA
    INT 21H 
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H  
    
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    ;PRINTN
    ;PRINTN
    
    MOV AH,9
    LEA DX,MSB
    INT 21H
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H  
    
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    ;PRINTN
    ;PRINTN
    
    
    MOV AH,9
    LEA DX,MSC
    INT 21H
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H  
    
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    ;PRINTN
    ;PRINTN
    
    ;ENTER THE INPUT(CM) 
    INPUT1:
        MOV AH,9
        LEA DX,MSD
        INT 21H
        
        XOR AX,AX
        XOR BX,BX
        XOR CX,CX
        XOR DX,DX
        MOV BX,10D 
        LEVEL1:
             MOV AH,1
             INT 21H
             ;
             ;
             CMP AL,0DH
             JE INPUT2
             ;A;LDKFLSDK
             MOV AH,0H
             SUB AX,48           
             MOV NO,AX           ;NO=AL
             MOV AX,SUM          ;
             MUL BX              ;AL=AL*NO
             ADD AX,NO           ;AL=AL+NO
             MOV SUM,AX
             MOV IN_CM,AX       ;SUM=AL
             JMP LEVEL1   
             
    ;ENTER THE INTPUT (KG)
    INPUT2:
        MOV SUM,0H
        MOV AH,2
        MOV DL,10
        INT 21H
        MOV DL,13
        INT 21H
        
        MOV DL,10
        INT 21H
        MOV DL,13
        INT 21H
        ;PRINTN
        ;PRINTN
        
        MOV AH,9
        LEA DX,MSE
        INT 21H 
        
        LEVEL2:
            MOV AH,1
            INT 21H
            CMP AL,0DH
            JE CALCULATION
            ;JE AGAIN
            SUB AX,48
            MOV AH,0H           
            MOV NO,AX           ;NO=AL
            MOV AX,SUM          ;
            MUL BX              ;AL=AL*10
            ADD AX,NO           ;AL=AL+NO
            MOV SUM,AX 
            MOV IN_KG,AX      ;SUM=AL
            JMP LEVEL2
        
    ;CALCULATION
    CALCULATION:
        XOR AX,AX
        XOR BX,BX
        XOR CX,CX
        XOR DX,DX
    
        MOV AX,PA1    ;PA1=100
        MOV BX,IN_KG     ;KG=65
        MUL BX       
        MOV C1,AX     ;C1=100*65
     
        MOV AX,C1
        MOV BX,IN_CM     ;CM=170
        DIV BX
        MOV C2,AX     ;C2=C1/170=38D
    
        MOV AX,C2     
        MOV BX,PA2    ;PA2=100
        MUL BX
        MOV C3,AX     ;C3=38*100=3800
    
        MOV AX,C3
        MOV BX,IN_CM     ;CM=170
        DIV IN_CM 
        MOV BMI,AL    ;BMI=22
        MOV C4,AX     ;C4=3800/170
        
        PRINTN
        
        MOV AH,9
        LEA DX,MSG
        INT 21H
    
        ;PRINT RESULT       
    
        XOR AX,AX
        MOV BX,BX
        MOV AL,BMI
        MOV BL,10D
        DIV BL
        MOV RES1,AL
        MOV RES2,AH
    
        MOV AH,2
        MOV DL,RES1
        ADD DL,48
        INT 21H
        MOV DL,RES2
        ADD DL,48
        INT 21H 
          
    ;A;LDF;LSADFSALKDFJ;ALSKDJF;SLAKDF;SDKF;ASLDKF
    AGAIN:
        ;MOV AL,24D
        MOV AL,BMI
        CMP AL,18D
        JLE CLASS1
        CMP AL,24D
        JLE CLASS2
        CMP AL,29D
        JLE CLASS3
        CMP AL,34D
        JLE CLASS4
        CMP AL,39D
        JLE CLASS5
        CMP AL,40D
        JGE CLASS6
    
    
    CLASS1:
        PRINTN
        PRINTN "UNDER WEIGHT"
        JMP AVDICE
        
    CLASS2:
        PRINTN
        PRINTN "NORMAL WEIGHT"
        JMP AVDICE    
    
    CLASS3:
        PRINTN
        PRINTN "OVER WEIGHT"
        JMP AVDICE
     
     CLASS4:
        PRINTN
        PRINTN "OBESITY CLASS I"
        JMP AVDICE
      
     CLASS5:
        PRINTN
        PRINTN "OBESITY CLASS II"
        JMP AVDICE
        
     CLASS6:
        PRINTN
        PRINTN "OBESITY CLASS III"
        JMP AVDICE
     
    AVDICE:
        PRINTN
        PRINTN "Press 1 to see the instruction for gain the perfect weight if you are under-weight."
        PRINTN
        PRINTN "Press 2 to see the instruction for gain the perfect weight if you are over-weight."
        PRINTN
        PRINTN "Press 3 if your BMI is normal."
        PRINTN
        PRINTN
        PRINT "Press (1 or 2 or 3) : " 
        MOV AH,1
        INT 21H
        MOV CHE,AL
        PRINTN
        MOV AL,CHE
        SUB AL,48
        CMP AL,1D
        JE ADVICE1
        CMP AL,2D
        JE ADVICE2
        CMP AL,3D
        JE CON
     
     ADVICE1:
          PRINTN       
          PRINTN " 1.Eat more and sleep minimum 8 hours per day."  
          PRINTN " 2.Drink at least 3L water per day." 
          PRINTN " 3.Eat vegetables and fruit and."
          PRINTN " 4.Eat high calorie food like (potato, beef, chicken, peas, almond, sweet potato etc.)"
          PRINTN " 5.250 ml glass of milk and 1 whole egg each day."
          JMP NEXT
               
     ADVICE2:
          PRINTN
          PRINTN " 1.Try to follow a low calorie healthy diet."
          PRINTN " 2.Eat high protein, vegetables and avoid fast food."
          PRINTN " 3.Do some workout for weight lose (walking, running, crunching)."
          PRINTN " 4.You have to regular excercise." 
          JMP NEXT
          
     CON: 
         PRINTN
         PRINTN "Congratulation your BMI is perfet."
         JMP NEXT
     
     NEXT:
        PRINTN
        PRINTN "Do you want to calculate BMI again (press 1) : "
        PRINTN
        PRINTN "Do you want to exit program (press 2) : "
        PRINTN
        PRINT "Press (1 or 2) : "
        MOV AH,1
        INT 21H
        SUB AL,48
        MOV CHE,AL
        PRINTN
        PRINTN
        MOV AL,CHE
        CMP AL,1D
        MOV IN_CM,0H
        MOV IN_KG,0H
        MOV SUM,0H
        JE  INPUT1
        CMP AL,2D
        PRINTN
        PRINTN "Program is completed."
        PRINTN "THANK YOU"
        JE EXIT
        
    EXIT:
        MOV AH,4CH
        INT 21H
        MAIN ENDP 
END MAIN