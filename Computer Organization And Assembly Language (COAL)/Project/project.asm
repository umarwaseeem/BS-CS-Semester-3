;; Muhammad Umar Waseem i200762
;; Umais i200854
;; Muhammad Haider Yar i200879

printStr macro string
    mov dx , offset string
    mov ah, 09
    int 21h
endm

;;;;;;;;;;;;;;;;;;;;;

loadingTextEffect macro
    mov pixelloading_x, 360
    mov pixelloading_Y, 170
    mov pixelCount, 5

    .while pixelCount != 0
        printPixel 4, pixelloading_x, pixelloading_y
        add pixelloading_x, 5
        call delay
        dec pixelCount
    .endw
endm

;;;;;;;;;;;;;;;;;;;;;;;;

usernameInput macro
    stringinput:
        mov ah, 01
        int 21h
    
        cmp al, 13
        je break

        mov [si], al
        inc si
    jmp stringinput
endm

;;;;;;;;;;;;;;;;;;;;;;;;
gameBoundary macro
    mov frame_Y_counter, 10

    .REPEAT
        printPixel 5, 10, frame_Y_counter
        inc frame_Y_counter
    .UNTIL frame_Y_counter == 470

    mov frame_X_counter, 10

    .REPEAT
        printPixel 5, frame_X_counter, frame_y_counter
        inc frame_X_counter
    .UNTIL frame_X_counter == 630

    .REPEAT
        printPixel 5, frame_X_counter, frame_y_counter
        dec frame_y_counter
    .UNTIL frame_y_counter == 10

    .REPEAT
        printPixel 5, frame_X_counter, frame_y_counter
        dec frame_X_counter
    .UNTIL frame_X_counter == 10

endm


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;s
keyboardPrompt macro
    mov ah,0    ;; wait for keyboard input
    int 16h
    ;Set to text mode
    mov ax,3 
    int 10h
endm





;;;;;;;;;;;;;;;;;;;;;
clear macro
    mov ax,03h
    int 10h
endm


;;;;;;;;;;;;;;;;;;;;;
loadingEffect macro
    ;;;;;;;;->Right Of Box
    mov right_Y, 260

        .repeat 
            printPixel 6, 370, right_Y
            call delayit 

            inc right_Y
        .until right_Y == 370

    ;;;;;;;;->Down Of Box
    mov down_X, 370

        .repeat
            printPixel 6, down_X, 370
            call  delayit

            dec down_X
        .until down_X == 260

    ;;;;;;;;;->Left Of Box
    mov left_Y, 370     

    .repeat
        printPixel 6, 260, left_Y
        call  delayit

        dec left_Y
    .until left_Y ==260


    ;;;;;;;;;;->Up Of Box
    mov up_X, 260

    .repeat
        printPixel 6, up_X, 260
        call  delayit

        inc up_X
    .until up_X == 370
endm

;;;;;;;;;;;;;;;;;;;;;;;;;;;;

removeColorAroundBox macro
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;~> Color Remove
    
    ;;;;;;;;;;;;;;;
    mov right_Y, 260

        .repeat 
            printPixel 00, 370, right_Y
            call delayit

            inc right_Y
        .until right_Y == 370
    
    ;;;;;;;;;;;
    mov down_X, 370

        .repeat
            printPixel 00, down_X, 370
            call  delayit


            dec down_X
    .until down_X == 260
    
    ;;;;;;;;;;;;;;;;
    mov left_Y, 370     
    
    .repeat
        printPixel 00, 260, left_Y
        call  delayit


        dec left_Y
    .until left_Y ==260
    
    ;;;;;;;;;;;;;;;;
    mov up_X, 260

    .repeat
        printPixel 00, up_X, 260
        call  delayit

        inc up_X
    .until up_X == 370
endm

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

printGraphicString macro string, row, col, space, color
    mov si, offset string
    mov colno, col
    mov strCount, 0
    mov nameColor, color

    .while strCount != lengthof string
        mov ah,2    ;mov cursor to specific position
        mov bh,0    ;page no =0
        mov dh,row   ;mov to row#
        mov dl,colno   ;mov to column#
        int 10h	    ;print graphic

        mov ah,9    ;print char w.r.t attributes
        mov al,[si]  ;character to print
        mov bl,nameColor  ;attributes
        mov bh,0	;page number
        mov cx,1	;times of printing
        int 10h		;print graphics

        add colno, space
        inc si
        inc strCount
    .endw
endm

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

pushAll macro
    push ax
    push bx
    push cx
    push dx
endm

popall macro
    pop dx
    pop cx
    pop bx
    pop ax
endm

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
setVideoMode macro

    mov ah, 0
    mov al, 12h
    int 10h

endm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
printPixel macro color, xAxis, yAxis

    mov ah, 0ch
    mov al, color
    mov cx, xAxis
    mov dx, yAxis
    int 10h

endm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
printFrom macro color, from_x, from_y, to_x , to_y

    mov si, from_x
    mov di, from_y

    .while temp != 0
        mov ah, 0ch
        mov al, color
        mov cx, si
        mov dx, di
        int 10h

        .IF si < to_x && di < to_y
            inc si
            inc di
        .ELSEIF si < to_x
            inc si
        .ELSEIF di < to_y
            inc di
        .ELSE
            mov temp, 0
        .ENDIF
    .endw

    mov si, 0
    mov di, 0
    mov temp, 1

endm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\
delayfire macro
        push ax
        push bx
        push cx
        push dx

        mov cx,1000
        my1:
            mov bx,50      ;; increase this number if you want to add more delay, and decrease this number if you want to reduce delay.
            my2:
            dec bx
            jnz my2
        loop my1

        pop dx
        pop cx
        pop bx
        pop ax
endm


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

box macro x, y, len, wid, color

    mov si, x          
    mov di, y          

    .while di < len
    
        mov si, x
    
            .while si < wid
                
                printPixel color, si, di
                inc si
            
            .endw
        
        inc di
    
    .endw

endm

.model small
.stack 100h
.data

    temp byte ?

    loading byte "Loading ",0
    gamename byte "ALIEN SHOOTER ",0
    inputPrompt byte "Press Any Key To Continue",0

    enterName byte "----Enter Your Name: ",0
    nameInput byte 50 dup(" "),0

    welcome byte "Welcome ",0

    right_Y dw ?
    down_X dw ?
    left_Y dw ?
    up_X dw ?

    x dw ?
    y dw ?
    wid dw ?
    len dw ?

    fire_len dw ?
    fire_wid dw ?

    fire_X dw ?
    fire_Y dw ?

    frame_Y_counter dw ?
    frame_X_counter dw ?

    pixelloading_x dw ?
    pixelloading_y dw ?
    pixelCount dw ?

    colno byte ?

    star dw "*",0

    strCount byte ?

    nameColor byte ?

    msg1 db 10,10,"        **************************Before The Game*******************************$"
    msg2 db 10,10,"                     The planet is attacked by lethal aliens$"
    msg3 db 10,10,"                         Only a single spaceship is left$"
    msg4 db 10,10,"  Your job is to get into the spaceship and kill the aliens and save the planet$"
    msg5 db "Use right or left buttons to move your space ship",0
    msg6 db "Fire using space button",0
    msg7 db 10,10,"     You are dead if any alien crosses you and so is the planet so be careful$"
    msg8 db 10,10,"                       2 points for each alien destroyed$"
    msg9 db 10,10,"                       You get limited number of bullets so be wise! $"
    msg10 db 10,10,"                          Make your planet proud !!$"

    bullet_count dw ?

    finished db "Game Over",0

    level1 db "LEVEL 1",0
    level2 db "LEVEL 2",0
    level3 db "LEVEL 3",0

    bulletsLeft db "Bullets Left: ",0
    bulletsFinished db "Bullets Finished",0
    strBullet dw ?

    enemiesKilled db "Enemies Killed: ",0

.code
main proc
    
    mov ax, @data
    mov ds, ax

    jmp start

    delayit proc
        pushAll

        mov cx,1000
        mydelay3:
            mov bx,15      ;; increase this number if you want to add more delay, and decrease this number if you want to reduce delay.
            mydelay2:
            dec bx
            jnz mydelay2
        loop mydelay3

        popall

    ret
    delayit endp

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

    printRules proc
        printStr msg1
        printStr msg2
        printStr msg3
        printStr msg4
        printGraphicString msg5, 11, 15, 1, 4
        printGraphicString msg6, 13, 22, 1, 4
        printStr msg7
        printStr msg8
        printStr msg9
        printStr msg10

        printGraphicString inputPrompt, 23, 25, 1, 3
        
        ret
    printRules endp


    start:

    setVideoMode        ;; video mode with 13h color mode

    gameBoundary

    box 280, 280, 350, 350, 07

    printGraphicString loading, 10, 30, 2, 4

    loadingTextEffect
    
    loadingEffect

    removeColorAroundBox

    clear

    setVideoMode
    gameBoundary
    
    printGraphicString gamename, 10, 26, 2, 1
    printGraphicString inputPrompt, 14, 26, 1, 3

    keyboardPrompt

    clear

    setVideoMode
    gameBoundary

    printGraphicString enterName, 10, 16, 1, 5

    usernameInput

    break:

    clear

    setVideoMode
    gameBoundary

    printGraphicString welcome, 8, 16, 1, 7
    printGraphicString nameInput, 10, 25, 1, 6
    printGraphicString inputPrompt, 14, 16, 1, 3

    keyboardPrompt

    setVideoMode
    gameBoundary

    call printRules

    keyboardPrompt

    setVideoMode
    gameBoundary

    ; make a moving space ship in graphics
    printGraphicString level1, 15, 35, 1, 2
    
    call delay
    call delay
    call delay

    clear

    setVideoMode
    gameBoundary

    box 30, 100, 120, 50, 05
    box 60, 100, 120, 80, 05
    box 90, 100, 120, 110, 05
    box 120, 100, 120, 140, 05
    box 150, 100, 120, 170, 05
    box 180, 100, 120, 200, 05
    box 210, 100, 120, 230, 05
    box 240, 100, 120, 260, 05




    mov ah, 0
    mov x, 20
    mov y, 440

    mov len, 460
    mov wid, 40

    box x, y, len, wid, 03 

    mov bullet_count, 9



    printGraphicString bulletsLeft, 2, 60, 1, 3
    mov di, bullet_count
    mov strBullet, di
    add strBullet, '0'
    printGraphicString strBullet, 2, 75, 1, 3 



    printGraphicString enemiesKilled, 4, 60, 1, 4


    .while ah != 1  ;; escape 

        gameBoundary

        mov ah, 00h
        int 16h

        .IF (ah == 1 || bullet_count == 0  )  
            clear
            setVideoMode

            printGraphicString finished, 15, 30, 1, 06

            .IF bullet_count == 0
            printGraphicString bulletsFinished, 17, 28, 1, 4
            .ENDIF
            
            jmp exit
        .ENDIF

        .IF (ah == 57 )          ;; fire on space
            dec bullet_count

            printGraphicString bulletsLeft, 2, 60, 1, 3
            mov di, bullet_count
            mov strBullet, di
            add strBullet, '0'
            printGraphicString strBullet, 2, 75, 1, 3 

            mov cx, x
            mov fire_X, cx
            ; add fire_X, 9

            ; mov cx, fire_X
            ; mov fire_wid, cx
            ; add fire_wid, 3

            mov cx, wid
            mov fire_wid, cx

            mov dx, y
            mov fire_Y, dx
            sub fire_Y, 20    

            

            .WHILE fire_Y != 10

                mov dx, fire_Y
                mov fire_len, dx
                ; add fire_len, 10

                sub fire_Y, 20
                box fire_X, fire_Y, fire_len, fire_wid, 04

                delayfire

                box fire_X, fire_Y, fire_len, fire_wid, 00
                
            .ENDW
        .ENDIF

        .IF (ah == 48h)       ;;  up arrow key
            .IF (y < 470 && y > 10)
            box x, y, len, wid, 0 
            sub y, 10
            .ELSE
            mov y, 460
            .ENDIF
        .ENDIF


        cmp1:   
        cmp ah, 4Dh         ;; right key
        je right
        jne cmp2

        right:
            .IF x > 10 && x < 610
            box x, y, len, wid, 0 
            add x, 10
            .ELSE
            mov x, 20
            .ENDIF


        cmp2:
        cmp ah, 4Bh         ;; left key
        je left
        jne cmp3

        left:
            .IF x > 10 && x < 610
            box x, y, len, wid, 0 
            sub x, 10
            .ELSE
            mov x, 600
            .ENDIF

        cmp3:   
        cmp ah, 50h         ;; down key
        je down
        jne make

        down:
            .IF (y < 470 && y > 10)
            box x, y, len, wid, 0          ;; make black pixel on prev position to show clearing effect
            add y, 10
            .ELSE
            mov y, 20
            .ENDIF


        make:
        
        mov cx, x
        mov wid, cx
        add wid, 20


        mov dx, y
        mov len, dx
        add len, 20

        box x, y, len, wid, 03

    .endw



    keyboardPrompt
    
    exit:
        mov ah,4ch
        int 21h
    
main endp
end main