include all.inc

.model small
.stack 1024h
.data
    
    alien3aKilled db ?
    alien3bKilled db ?
    alien3cKilled db ?

    alien3aX dw ?
    alien3aY dw ?

    alien3bX dw ?
    alien3bY dw ?

    alien3cX dw ?
    alien3cY dw ?

    temp dw ?

    ;; declare all the variables for ship

    leftWingX1 dw ?
    leftWingY1 dw ?
    leftWingX2 dw ?
    leftWingY2 dw ?

    rightWingX1 dw ?
    rightWingY1 dw ?
    rightWingX2 dw ?
    rightWingY2 dw ?

    halfLWingX1 dw ?
    halfLWingY1 dw ?
    halfLWingX2 dw ?
    halfLWingY2 dw ?

    halfRWingX1 dw ?
    halfRWingY1 dw ?
    halfRWingX2 dw ?
    halfRWingY2 dw ?

    downLeftDiagonalX dw ?
    downLeftDiagonalY dw ?

    downRightDiagonalX dw ?
    downRightDiagonalY dw ?

    leftBaseX2 dw ?
    leftBaseY2 dw ?

    rightBaseX2 dw ?
    rightBaseY2 dw ?

    betweenBasesX dw ?
    betweenBasesY dw ?

    leftVerticalX2 dw ?
    leftVerticalY2 dw ?

    rightVerticalX1 dw ?
    rightVerticalY1 dw ?

    upLeftHorizontalX2 dw ?
    upLeftHorizontalY2 dw ?

    upRightHorizontalX2 dw ?
    upRightHorizontalY2 dw ?

    shipX dw ?
    shipC db ?

    black db 0
    red db 4
    blue db 3

    shipColor db ?

    fireX dw ?
    fireY dw ?
    fireLen dw ?
    fireWid dw ?







    ;;;;;;;;;;;; alien 3 Variables

    leftVerticallineX1 dw ?
    leftVerticallineY1 dw ?
    leftVerticallineX2 dw ?
    leftVerticallineY2 dw ?

    rightVerticallineX1 dw ?
    rightVerticallineY1 dw ?
    rightVerticallineX2 dw ?
    rightVerticallineY2 dw ?


    downLeftDiagonalX1 dw ?
    downLeftDiagonalY1 dw ?
    downLeftDiagonalX2 dw ?
    downLeftDiagonalY2 dw ?

    downRightDiagonalX1 dw ?
    downRightDiagonalY1 dw ?
    downRightDiagonalX2 dw ?
    downRightDiagonalY2 dw ?

    topLeftDiagonalX1 dw ?
    topLeftDiagonalY1 dw ?
    topLeftDiagonalX2 dw ?
    topLeftDiagonalY2 dw ?

    topRightDiagonalX1 dw ?
    topRightDiagonalY1 dw ?
    topRightDiagonalX2 dw ?
    topRightDiagonalY2 dw ?


    upLeftX1 dw ?
    upLeftY1 dw ?
    upLeftX2 dw ?
    upLeftY2 dw ?

    upRightX1 dw ?
    upRightY1 dw ?
    upRightX2 dw ?
    upRightY2 dw ?

    lDiagonalUnderWingX1 dw ?
    lDiagonalUnderWingY1 dw ?
    lDiagonalUnderWingX2 dw ?
    lDiagonalUnderWingY2 dw ?

    rDiagonalUnderWingX1 dw ?
    rDiagonalUnderWingY1 dw ?
    rDiagonalUnderWingX2 dw ?
    rDiagonalUnderWingY2 dw ?


    leftBaselineX1 dw ?
    leftBaselineY1 dw ?
    leftBaselineX2 dw ?
    leftBaselineY2 dw ?

    rightBaselineX1 dw ?
    rightBaselineY1 dw ?
    rightBaselineX2 dw ?
    rightBaselineY2 dw ?

    lDiagonalAboveWingX1 dw ?
    lDiagonalAboveWingY1 dw ?
    lDiagonalAboveWingX2 dw ?
    lDiagonalAboveWingY2 dw ?

    rDiagonalAboveWingX1 dw ?
    rDiagonalAboveWingY1 dw ?
    rDiagonalAboveWingX2 dw ?
    rDiagonalAboveWingY2 dw ?

    leftMostVerticalX1 dw ?
    leftMostVerticalY1 dw ?
    leftMostVerticalX2 dw ?
    leftMostVerticalY2 dw ?

    rightMostVerticalX1 dw ?
    rightMostVerticalY1 dw ?
    rightMostVerticalX2 dw ?
    rightMostVerticalY2 dw ?



    finished db "Game Over",0

    strCount byte ?
    colno byte ?
    nameColor byte ?

    alien1Killed dw ?

    win db "You Win, On to Level 2",0

    level1 db "LEVEL 1",0

    frame_Y_counter dw ?
    frame_X_counter dw ?

.code
main proc
    
    mov ax, @data
    mov ds, ax

    setVideoMode


    jmp start




    delay proc
        pushAll

        mov cx,1000
        mydelay:
            mov bx,750      ;; increase this number if you want to add more delay, and decrease this number if you want to reduce delay.
            mydelay1:
            dec bx
            jnz mydelay1
        loop mydelay

        popall

    ret
    delay endp


    start:


    setVideoMode

    gameBoundary

    printGraphicString level1, 15, 35, 1, 2

    call delay

    clear

    setVideoMode

    gameBoundary

    mov shipX, 400
    ship shipX, red
    
    alien3 50, 100, 2


    .while ah != 1      ;; until escape is entered

            .IF alien1Killed == 1
                clear
                setVideoMode
                gameBoundary
                alien3 50, 100, 0
                printGraphicString win, 15, 30, 1, 2
                call delay
                call delay
                jmp exit
                
            .ENDIF


        mov ah, 00h         ;; get keyboard input
        int 16h

        .IF ah == 1             ;; escape key
        
            clear
            jmp exit

        .ENDIF

        .IF (ah == 57)    ;; space key - fire
            
            mov di, halfLWingX2
            mov fireX, di                   ;; x of fire same as mid of ship
            sub fireX, 2


            mov di, halfLWingY2
            mov fireY, di                   ;; y of fire same as ship

            mov di, fireY
            mov fireLen, di
            add fireLen, 5                 ;; fireLen = fireY + 5

            mov di, fireX
            mov fireWid, di
            add fireWid, 5                 ;; fireWid = fireX + 5

            .while fireY != 10 

                sub fireY, 10               ;; fire moves 10 pixels up

                mov di, fireY
                mov fireLen, di
                add fireLen, 10

                box fireX, fireY, fireLen, fireWid, 04          ;; fire draw , box with fire wid thickness and firelen length

                delayfire                                       ;; delay for moving effect

                box fireX, fireY, fireLen, fireWid, 00          ;; redraw black fire on previous position for moving effect
            
                push si
                push di
                push dx
                push cx
                push bx
                push ax


                    mov si, fireX
                    mov di, fireY

                    .IF si >= 50 && si <= 170 && di >= 100
                        mov alien1Killed, 1

                    .ENDIF


                pop ax
                pop bx
                pop cx
                pop dx
                pop si
                pop di

            .endw


        .ENDIF

        outOfLoop:

        


        .IF (ah == 4DH)       ;; right key pressed
            
                ship shipX, black
                add shipX, 10

            .IF (rightWingX2 >= 630)
                mov shipX, 20
            .endif

        .ELSEIF (ah == 4BH)   ;; left key pressed
        
                ship shipX, black
                sub shipX, 10
            
            .IF (leftWingX1 <= 10 )
            mov shipX, 490
            .endif

        .ENDIF


        draw:
        ship shipX, red

    .endw


    
exit:
mov ah,4ch
int 21h
    
main endp
end main