.data
sequence:  .byte 0-100
count:     .word 4
Right: .string "Correct, Well Done! Play Again For Next Level! (Down for Yes, Up for No)\n"
Wrong: .string "Oh No, That Seems to Be the Wrong Order! Back to Level 1! Play Again (Down for Yes, Up for No)\n"
newline: .string "\n"
multi: .string "Single or Multiplayer (1v1)?\n"
comm: .string "For Single Press Up, For Multiplayer Press Down\n"
level: .string "Level Up! You're on Level "
Complete: .string "Game Complete! Scores Below\n"
player1: .string "Player 1 Score is "
player2: .string "Player 2 Score is "
match: .string "GO! Match the Sequence!\n"

.globl main
.text


###
###
###   PLAY IN 4 x 4 (Option 3 for Code Enhancements)
###   INCREASE DiFFICULTY (Option 1 for Memory Enchancements)
###   Multiplayer Showdown (Option 2 for Memory Enchancement (Note: I did this for fun))
###
###


li s5, 1
li s7, 3
li s2, 3
li s3, 3
li a3, 0
li a5, 0
li a6, 1


li a7, 4
la a0, multi
ecall

li a7, 4
la a0, comm
ecall

jal pollDpad

SORM: 
    beq a0, a3, SINGLEPLAYER
    beq a0, a6, MULTIPLAYER

MULTIPLAYER:

li a7, 4
la a0, player1 
ecall

li a7, 1
mv a0, a3
ecall

li a7, 4
la a0, newline
ecall


li a7, 4
la a0, player2
ecall

li a7, 1
mv a0, a5
ecall

li a7, 4
la a0, newline
ecall

j LOOPINIT


SINGLEPLAYER:
    li a3, -1
    li a6, -1
    
LOOPINIT:
        li s8, 0
        addi s3, s3, 1
        la s4, sequence
        WHILE:
            beq s8, s3, DONE
            addi s8, s8, 1
            li a0, 4
            jal rand
            
            sb a0, 0(s4)
            addi s4, s4, 1
        
            # li a7, 1
            # ecall
            # To see the values being printed randomly
            
            j WHILE
            
            
            
        DONE:

   
   LOOPINIT2:
        li s8, 0
        li s9, 1
        li s10, 2
        li s11, 3 
        
        la t3, sequence
        li s1, 0
        addi s2, s2, 1
    WHILE2:
        beq s1, s2, DONE2
        lb a0, 0(t3)
        
        IF1:
            mv s7, a0
            li a0, 1000
            jal delay
            beq s7, s8, IF2
            beq s7, s9, IF3
            beq s7, s10, IF4
            beq s7, s11, IF5
         
        IF2: #It is 0 (0,0) (1, 0), (0, 2)
            
            li a0, 255
            li a1, 0
            li a2, 0
            jal setLED
            
            li a0, 255
            li a1, 0
            li a2, 1
            jal setLED
            
            li a0, 255
            li a1, 1
            li a2, 0
            jal setLED
            
            li a0, 500
            jal delay
            
            li a0 0
            li a1, 0
            li a2, 0
            jal setLED
            
            li a0 0
            li a1, 0
            li a2, 1
            jal setLED

            li a0 0
            li a1, 1
            li a2, 0
            jal setLED
            
            li a0, 1000
            jal delay
            
            addi t3, t3, 1
            addi s1, s1, 1
            j WHILE2

            
        IF3: #It is 1
            
            li a0, 16711680
            li a1, 2
            li a2, 0
            jal setLED

            li a0, 16711680
            li a1, 3
            li a2, 0
            jal setLED
            
            li a0, 16711680
            li a1, 3
            li a2, 1
            jal setLED
            
            
            li a0, 500
            jal delay
            
            li a0 0
            li a1, 2
            li a2, 0
            jal setLED
            
            li a0 0
            li a1, 3
            li a2, 0
            jal setLED
    
            li a0 0
            li a1, 3
            li a2, 1
            jal setLED
            
            li a0, 1000
            jal delay
            
            addi t3, t3, 1
            addi s1, s1, 1
            j WHILE2

            
        IF4: #It is 2
            
            li a0, 65280
            li a1, 0
            li a2, 2
            jal setLED

            li a0, 65280
            li a1, 0
            li a2, 3
            jal setLED
    
            li a0, 65280
            li a1, 1
            li a2, 3
            jal setLED
            
            li a0, 500
            jal delay
            
            li a0 0
            li a1, 0
            li a2, 2
            jal setLED
            
            li a0 0
            li a1, 0
            li a2, 3
            jal setLED

            li a0 0
            li a1, 1
            li a2, 3
            jal setLED
            
            li a0, 1000
            jal delay
            
            addi t3, t3, 1
            addi s1, s1, 1        
            j WHILE2

        
        IF5: #It is 3
            
            li a0, 16776960
            li a1, 2
            li a2, 3
            jal setLED

            li a0, 16776960
            li a1, 3
            li a2, 3
            jal setLED
            
            li a0, 16776960
            li a1, 3
            li a2, 2
            jal setLED
            
            li a0, 500
            jal delay
            
            li a0 0
            li a1, 2
            li a2, 3
            jal setLED
            
            li a0 0
            li a1, 3
            li a2, 3
            jal setLED
            
            li a0 0
            li a1, 3
            li a2, 2
            jal setLED
            
            li a0, 1000
            
            jal delay
            addi t3, t3, 1
            addi s1, s1, 1
            j WHILE2

    DONE2:
            li a7, 4
            la a0, newline
            ecall
            
            li a7, 4
            la a0, match
            ecall
   
    
   LOOPINIT3:
        li s8, 0
        li s9, 1
        li s10, 2
        li s11, 3 
        
        la t6, sequence
        li s1, 0
        addi s7, s7, 1
    WHILE3:
        beq s1, s2, DONE3
        lb a0, 0(t6)
        mv t4, a0
        
        jal pollDpad
        
        IF6:
            bne a0, t4, WRONG
            j CORRECT
            
            
       CORRECT:   
            
            beq a0, s8, IF7
            beq a0, s9, IF8
            beq a0, s10, IF9
            beq, a0, s11, IF10
        
        IF7:
            
            li a0, 255
            li a1, 0
            li a2, 0
            jal setLED
            
            li a0, 255
            li a1, 1
            li a2, 0
            jal setLED

            li a0, 255
            li a1, 0
            li a2, 1
            jal setLED
            
            li a0, 500
            jal delay
            
            li a0 0
            li a1, 0
            li a2, 0
            jal setLED
            
            li a0 0
            li a1, 1
            li a2, 0
            jal setLED

            li a0 0
            li a1, 0
            li a2, 1
            jal setLED
            
            li a0, 1000
            jal delay
            
            addi t6, t6, 1
            addi s1, s1, 1
            j WHILE3
            
        IF8:
            
            li a0, 16711680
            li a1, 2
            li a2, 0
            jal setLED
            
            li a0, 16711680
            li a1, 3
            li a2, 0
            jal setLED
            
            li a0, 16711680
            li a1, 3
            li a2, 1
            jal setLED
            
            li a0, 500
            jal delay
            
            li a0 0
            li a1, 2
            li a2, 0
            jal setLED
            
            li a0 0
            li a1, 3
            li a2, 0
            jal setLED
            
            li a0 0
            li a1, 3
            li a2, 1
            jal setLED
            
            li a0, 1000
            jal delay
            
            addi t6, t6, 1
            addi s1, s1, 1
            j WHILE3
            
            
        IF9:
            
            li a0, 65280
            li a1, 0
            li a2, 2
            jal setLED
            
            li a0, 65280
            li a1, 0
            li a2, 3
            jal setLED
            
            li a0, 65280
            li a1, 1
            li a2, 3
            jal setLED
            
            li a0, 500
            jal delay
            
            li a0 0
            li a1, 0
            li a2, 2
            jal setLED
            
            li a0 0
            li a1, 0
            li a2, 3
            jal setLED
            
            li a0 0
            li a1, 1
            li a2, 3
            jal setLED
            
            li a0, 1000
            jal delay
            
            addi t6, t6, 1
            addi s1, s1, 1        
            j WHILE3
        
        IF10:
            li a0, 16776960
            li a1, 3
            li a2, 2
            jal setLED
            
            li a0, 16776960
            li a1, 3
            li a2, 3
            jal setLED
            
            li a0, 16776960
            li a1, 2
            li a2, 3
            jal setLED
            
            li a0, 500
            jal delay
            
            li a0 0
            li a1, 3
            li a2, 2
            jal setLED
            
            li a0 0
            li a1, 3
            li a2, 3
            jal setLED
            
            li a0 0
            li a1, 2
            li a2, 3
            jal setLED
            
            
            li a0, 1000
            jal delay
            addi t6, t6, 1
            addi s1, s1, 1
            j WHILE3
            
        WRONG:
            
            li a0, 16777215
            li a1, 0
            li a2, 0
            jal setLED
            
            li a0, 16777215
            li a1, 1
            li a2, 0
            jal setLED

            li a0, 16777215
            li a1, 2
            li a2, 0
            jal setLED

            li a0, 16777215
            li a1, 3
            li a2, 0
            jal setLED
            
            li a0, 16777215
            li a1, 0
            li a2, 1
            jal setLED
            
            li a0, 16777215
            li a1, 1
            li a2, 1
            jal setLED
            
            
            li a0, 16777215
            li a1, 2
            li a2, 1
            jal setLED
            
            li a0, 16777215
            li a1, 3
            li a2, 1
            jal setLED
            
            
            li a0, 16777215
            li a1, 0
            li a2, 2
            jal setLED
            
            
            li a0, 16777215
            li a1, 1
            li a2, 2
            jal setLED
            
            
            li a0, 16777215
            li a1, 2
            li a2, 2
            jal setLED
            
            
            li a0, 16777215
            li a1, 3
            li a2, 2
            jal setLED
            
            li a0, 16777215
            li a1, 0
            li a2, 3
            jal setLED
            
            
            li a0, 16777215
            li a1, 1
            li a2, 3
            jal setLED
            
            
            li a0, 16777215
            li a1, 2
            li a2, 3
            jal setLED
            
            
            li a0, 16777215
            li a1, 3
            li a2, 3
            jal setLED
            
            li a0, 500
            jal delay
            
           
            li a0, 0
            li a1, 0
            li a2, 0
            jal setLED
            
            li a0, 0
            li a1, 1
            li a2, 0
            jal setLED

            li a0, 0
            li a1, 2
            li a2, 0
            jal setLED

            li a0, 0
            li a1, 3
            li a2, 0
            jal setLED
            
            li a0, 0
            li a1, 0
            li a2, 1
            jal setLED
            
            li a0, 0
            li a1, 1
            li a2, 1
            jal setLED
            
            
            li a0, 0
            li a1, 2
            li a2, 1
            jal setLED
            
            li a0, 0
            li a1, 3
            li a2, 1
            jal setLED
            
            
            li a0, 0
            li a1, 0
            li a2, 2
            jal setLED
            
            
            li a0, 0
            li a1, 1
            li a2, 2
            jal setLED
            
            
            li a0, 0
            li a1, 2
            li a2, 2
            jal setLED
            
            
            li a0, 0
            li a1, 3
            li a2, 2
            jal setLED
            
            li a0, 0
            li a1, 0
            li a2, 3
            jal setLED
            
            
            li a0, 0
            li a1, 1
            li a2, 3
            jal setLED
            
            
            li a0, 0
            li a1, 2
            li a2, 3
            jal setLED
            
            
            li a0, 0
            li a1, 3
            li a2, 3
            jal setLED
            
            
            j INCORRECT

    DONE3:
        
            li a0, 8421504
            li a1, 0
            li a2, 0
            jal setLED
            
            li a0, 8421504
            li a1, 1
            li a2, 0
            jal setLED

            li a0, 8421504
            li a1, 2
            li a2, 0
            jal setLED

            li a0, 8421504
            li a1, 3
            li a2, 0
            jal setLED
            
            li a0, 8421504
            li a1, 0
            li a2, 1
            jal setLED
            
            li a0, 8421504
            li a1, 1
            li a2, 1
            jal setLED
            
            
            li a0, 8421504
            li a1, 2
            li a2, 1
            jal setLED
            
            li a0, 8421504
            li a1, 3
            li a2, 1
            jal setLED
            
            
            li a0, 8421504
            li a1, 0
            li a2, 2
            jal setLED
            
            
            li a0, 8421504
            li a1, 1
            li a2, 2
            jal setLED
            
            
            li a0, 8421504
            li a1, 2
            li a2, 2
            jal setLED
            
            
            li a0, 8421504
            li a1, 3
            li a2, 2
            jal setLED
            
            li a0, 8421504
            li a1, 0
            li a2, 3
            jal setLED
            
            
            li a0, 8421504
            li a1, 1
            li a2, 3
            jal setLED
            
            
            li a0, 8421504
            li a1, 2
            li a2, 3
            jal setLED
            
            
            li a0, 8421504
            li a1, 3
            li a2, 3
            jal setLED
            
            li a0, 500
            jal delay
            
           
            li a0, 0
            li a1, 0
            li a2, 0
            jal setLED
            
            li a0, 0
            li a1, 1
            li a2, 0
            jal setLED

            li a0, 0
            li a1, 2
            li a2, 0
            jal setLED

            li a0, 0
            li a1, 3
            li a2, 0
            jal setLED
            
            li a0, 0
            li a1, 0
            li a2, 1
            jal setLED
            
            li a0, 0
            li a1, 1
            li a2, 1
            jal setLED
            
            
            li a0, 0
            li a1, 2
            li a2, 1
            jal setLED
            
            li a0, 0
            li a1, 3
            li a2, 1
            jal setLED
            
            
            li a0, 0
            li a1, 0
            li a2, 2
            jal setLED
            
            
            li a0, 0
            li a1, 1
            li a2, 2
            jal setLED
            
            
            li a0, 0
            li a1, 2
            li a2, 2
            jal setLED
            
            
            li a0, 0
            li a1, 3
            li a2, 2
            jal setLED
            
            li a0, 0
            li a1, 0
            li a2, 3
            jal setLED
            
            
            li a0, 0
            li a1, 1
            li a2, 3
            jal setLED
            
            
            li a0, 0
            li a1, 2
            li a2, 3
            jal setLED
            
            
            li a0, 0
            li a1, 3
            li a2, 3
            jal setLED
        
        
            li s10, 0
            li s11, 1
    
            li a7, 4
	        la a0, newline
	        ecall

            li a7, 4
	        la a0, Right
	        ecall

            addi s5, s5, 1
            
            li a7, 4
            la a0, level
            ecall

            li a7, 1
            mv a0, s5
            ecall

            li a7, 4
            la a0, newline
            ecall


            TURNODD:
                beq a3, a6, CONTINUE2
                li t6, 0
                li t5, 0
                andi t6, a6, 0x0001
                beq t5, t6, EVENCASE
                addi a6, a6, 1
                addi a3, a3, 1
            
            CONTINUE:
                li a7, 4
                la a0, player1 
                ecall

                li a7, 1
                mv a0, a3
                ecall

                li a7, 4
                la a0, newline
                ecall


                li a7, 4
                la a0, player2
                ecall

                li a7, 1
                mv a0, a5
                ecall

                li a7, 4
                la a0, newline
                ecall
            
            CONTINUE2:
                
                
                
                jal pollDpad
    
    
                beq s11, a0, Again
                beq s10, a0, End
    
    EVENCASE:
        addi a6, a6, 1
        addi a5, a5, 1
        j CONTINUE
        
    INCORRECT:    
    
    li a7, 4
    la a0, newline
	ecall

    li a7, 4
	la a0, Wrong
	ecall

    li s5, 1

    li s7, 3
    li s2, 3
    li s3, 3

    beq a3, a6, CONTINUE3
    li s10, 0
    li s11, 1 
    addi a6, a6, 1
    
    li a7, 4
	la a0, newline
	ecall

    li a7, 4
    la a0, player1 
    ecall

    li a7, 1
    mv a0, a3
    ecall

    li a7, 4
    la a0, newline
    ecall


    li a7, 4
    la a0, player2
    ecall

    li a7, 1
    mv a0, a5
    ecall

    li a7, 4
    la a0, newline
    ecall
    
    
    CONTINUE3:

    jal pollDpad
    li t2, 1
    li t1, 0
    beq t1, a0, End
    beq t2, a0, Again
    
    Again:
        j LOOPINIT


    End:
        beq a3, a6, CONTINUE4
        
        li a7, 4
        la a0, newline
        ecall
        
        
        li a7, 4
        la a0, Complete
        ecall
        
        li a7, 4
        la a0, player1 
        ecall

        li a7, 1
        mv a0, a3
        ecall

        li a7, 4
        la a0, newline
        ecall


        li a7, 4
        la a0, player2
        ecall

        li a7, 1
        mv a0, a5
        ecall

        li a7, 4
        la a0, newline
        ecall
        
        CONTINUE4:
        
        li a7, 10
        ecall
 
exit:
    li a7, 10
    ecall
    
    
# --- HELPER FUNCTIONS ---
# Feel free to use (or modify) them however you see fit

     
# Takes in the number of milliseconds to wait (in a0) before returning
delay:
    mv t0, a0
    li a7, 30
    ecall
    mv t1, a0
delayLoop:
    ecall
    sub t2, a0, t1
    bgez t2, delayIfEnd
    addi t2, t2, -1
delayIfEnd:
    bltu t2, t0, delayLoop
    jr ra

# Takes in a number in a0, and returns a (sort of) random number from 0 to
# this number (exclusive)
rand:
    mv t0, a0
    li a7, 30
    ecall
    remu a0, a0, t0
    jr ra
    
# Takes in an RGB color in a0, an x-coordinate in a1, and a y-coordinate
# in a2. Then it sets the led at (x, y) to the given color.
setLED:
    li t1, LED_MATRIX_0_WIDTH
    mul t0, a2, t1
    add t0, t0, a1
    li t1, 4
    mul t0, t0, t1
    li t1, LED_MATRIX_0_BASE
    add t0, t1, t0
    sw a0, (0)t0
    jr ra
    
# Polls the d-pad input until a button is pressed, then returns a number
# representing the button that was pressed in a0.
# The possible return values are:
# 0: UP
# 1: DOWN
# 2: LEFT
# 3: RIGHT
pollDpad:
    mv a0, zero
    li t1, 4
pollLoop:
    bge a0, t1, pollLoopEnd
    li t2, D_PAD_0_BASE
    slli t3, a0, 2
    add t2, t2, t3
    lw t3, (0)t2
    bnez t3, pollRelease
    addi a0, a0, 1
    j pollLoop
pollLoopEnd:
    j pollDpad
pollRelease:
    lw t3, (0)t2
    bnez t3, pollRelease
pollExit:
    jr ra
