include MACRO.INC
include all.INC

.model small
.stack 1000h
.data 
    temp dw 0
    temp_x dw 0
    temp_y dw 0
    x_axis dw 0
    y_axis dw 0
    x dw 0
    y dw 0
    col dw 0

    monsterX dw 50
    monsterY dw 50

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

    shipX dw 400
    shipC db ?

    black db 0
    red db 4
    blue db 3


    fireX dw ?
    fireY dw ?
    fireLen dw ?
    fireWid dw ?

    bossReached db "Boss Touched You, Game Over",0

    strCount byte ?
    colno byte ?
    nameColor byte ?

    monsterHit dw ?
    hitTimes dw ?
    timesHitStr db "Monster Hit =: ",0
    strHitTimes dw ?

    monsterHealthstr db "Monster Health =: ",0

    monsterKilled db "You killed the monster, YOU WIN !!",0

    ready db "ARE YOU READY ???",0
    level3 db "LEVEL 3",0

    healthY dw ?
    healthLen dw ?

    health dw 500
    strHealth dw 0

    rule db "Hit the monster 5 times to win",0

    frame_Y_counter dw ?
    frame_X_counter dw ?

.code
main proc

    mov ax,@data
    mov ds,ax

    mov ah,00h  ;set video mode 
    mov al,12h ;choose mode 3
    int 10h

    jmp start


    ;;;;;;;;;;;;;;;;;;
    delay proc
        pushAll

        mov cx,1000
        mydelay:
            mov bx,1500      ;; increase this number if you want to add more delay, and decrease this number if you want to reduce delay.
            mydelay1:
            dec bx
            jnz mydelay1
        loop mydelay

        popall

    ret
    delay endp
    ;;;;;;;;;;;;;;;;;;;;;;


    start:

    gameBoundary

    printGraphicString ready, 15, 35, 1, 2

    call delay

    clear

    setVideoMode

    gameBoundary

    printGraphicString level3, 15, 35, 1, 2

    call delay

    clear

    setVideoMode

    gameBoundary

    printGraphicString rule, 15, 24, 1, 2

    call delay

    clear

    setVideoMode

    gameBoundary

    mov hitTimes, 0
    monster monsterX,monsterY,red
    mov ah, 0

    ship shipX, red


    mov healthY, 100


    mov di, healthY
    mov healthLen, di
    add healthLen, 300
    box 580, healthY, healthLen, 620, 02  
    
    printGraphicString timesHitStr, 2, 50, 1, 3


    .while ah != 1      ;; until escape is entered


    printGraphicString timesHitStr, 2, 50, 1, 3
    mov di, hitTimes
    mov strHitTimes, di
    add strHitTimes, '0'
    printGraphicString  strHitTimes, 2, 68, 1, 3


    printGraphicString monsterHealthstr, 5, 50, 1, 3



        .IF monsterHit != 1 
            
            monster monsterX,monsterY,black
            add monsterX, 5
            add monsterY, 5
            monster monsterX,monsterY,red

            .IF monsterY >= 250   ;; ship upper y limit 
            clear
            setVideoMode 

            printGraphicString bossReached, 15, 26, 1, 6
            jmp exit
            .ENDIF

        .elseif monsterHit == 1 && hitTimes < 5 
            mov monsterHit, 0
            ; inc hitTimes
            box 580, healthY, healthLen, 620, 00  
            sub healthLen, 60
            box 580, healthY, healthLen, 620, 02  

        .elseif monsterHit == 1 && hitTimes >= 5
            monster monsterX,monsterY,black
            
            clear
            setVideoMode
            printGraphicString monsterKilled, 15, 26, 1, 5
            
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

                    mov dx, monsterX
                    sub dx, 50
                    mov cx, monsterX
                    add cx, 110

                    .IF (si >= dx && si <= cx) &&( di <= monsterY ) && hitTimes <5
                        mov monsterHit, 1
                    .ENDIF

                pop ax
                pop bx
                pop cx
                pop dx
                pop si
                pop di

            .endw


        .ENDIF

        .IF monsterHit == 1 
            inc hitTimes
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

