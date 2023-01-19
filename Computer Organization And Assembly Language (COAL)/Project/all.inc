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

printPixel macro color, xAxis, yAxis

    mov ah, 0ch
    mov al, color
    mov cx, xAxis
    mov dx, yAxis
    int 10h

endm

printFrom macro color, from_x, from_y, to_x , to_y

    mov si, from_x
    mov di, from_y

    ;; when si is less than to_x and di is less than to_y
    .IF si < to_x && di < to_y 
    
            .while temp != 0
            printPixel color, si, di

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

    ;; when si is less than to_x and di is greater than to_y
    .ELSEIF si < to_x && di > to_y
    
            .WHILE temp != 0 
            printPixel color, si, di

                .IF si < to_x && di > to_y
                    inc si
                    dec di
                .ELSEIF si < to_x
                    inc si
                .ELSEIF di > to_y
                    dec di
                .ELSE
                    mov temp, 0
                .ENDIF

    .ENDW

    ;; when si is greater than to_x and di is less than to_y
    .ELSEIF si > to_x && di < to_y
    
            .WHILE temp != 0
            printPixel color, si, di

                .IF si > to_x && di < to_y
                    dec si
                    inc di
                .ELSEIF si > to_x
                    dec si
                .ELSEIF di < to_y
                    inc di
                .ELSE
                    mov temp, 0
                .ENDIF
    .endw

    ;; when si is greater than to_x and di is greater than to_y
    .ELSEIF si > to_x && di > to_y
    
            .WHILE temp != 0
            printPixel color, si, di

                    .IF si > to_x && di > to_y
                        dec si
                        dec di
                    .ELSEIF si > to_x
                        dec si
                    .ELSEIF di > to_y
                        dec di
                    .ELSE
                        mov temp, 0
                    .ENDIF
            .ENDW

    .ELSEIF si == to_x && di == to_y
        printPixel color, si, di 
    
    .ELSEIF si == to_x && di < to_y
        
        printPixel color, si, di
        
        inc di
        .WHILE di < to_y
            printPixel color, si, di
            inc di
        .ENDW
    
    .ELSEIF si == to_x && di > to_y
        
        printPixel color, si, di
        
        dec di
        .WHILE di > to_y
            printPixel color, si, di
            dec di
        .ENDW

    .ELSEIF si < to_x && di == to_y
            
            printPixel color, si, di
            
            inc si
            .WHILE si < to_x
                printPixel color, si, di
                inc si
            .ENDW

    .ELSEIF si > to_x && di == to_y
                
                printPixel color, si, di
                
                dec si
                .WHILE si > to_x
                    printPixel color, si, di
                    dec si
                .ENDW
    
    .ENDIF

    mov si, 0
    mov di, 0
    mov temp, 1
    mov al, 0

endm

setVideoMode macro

    mov ah, 0
    mov al, 12h
    int 10h

endm

triangle macro color, x1, y1, x2, y2, x3, y3

    printFrom color, x1, y1, x2, y2
    printFrom color, x2, y2, x3, y3
    printFrom color, x3, y3, x1, y1

endm


defaultLeftValues macro

    mov leftWingX1, 30
    mov leftWingY1, 420
    mov leftWingX2, 80
    mov leftWingY2, 420

    mov rightWingX1, 130
    mov rightWingY1, 420
    mov rightWingX2, 180
    mov rightWingY2, 420

    mov halfLWingX1, 55
    mov halfLWingY1, 420
    mov halfLWingX2, 105
    mov halfLWingY2, 370

    mov halfRWingX1, 155
    mov halfRWingY1, 420
    mov halfRWingX2, 105
    mov halfRWingY2, 370

    mov downLeftDiagonalX, 55
    mov downLeftDiagonalY, 445

    mov downRightDiagonalX, 155
    mov downRightDiagonalY, 445

    mov leftBaseX2, 80
    mov leftBaseY2, 445

    mov rightBaseX2, 130
    mov rightBaseY2, 445

    mov betweenBasesX, 105
    mov betweenBasesY, 420

    mov leftVerticalX2, 80
    mov leftVerticalY2, 395

    mov rightVerticalX1, 130
    mov rightVerticalY1, 395

    mov upLeftHorizontalX2, 55
    mov upLeftHorizontalY2, 395

    mov upRightHorizontalX2, 155
    mov upRightHorizontalY2, 395

endm


defaultRightValues macro

    mov leftWingX1, 450
    mov leftWingY1, 420
    mov leftWingX2, 500
    mov leftWingY2, 420

    mov rightWingX1, 550
    mov rightWingY1, 420
    mov rightWingX2, 600
    mov rightWingY2, 420

    mov halfLWingX1, 475
    mov halfLWingY1, 420
    mov halfLWingX2, 525
    mov halfLWingY2, 370

    mov halfRWingX1, 575
    mov halfRWingY1, 420
    mov halfRWingX2, 525
    mov halfRWingY2, 370

    mov downLeftDiagonalX, 475
    mov downLeftDiagonalY, 445

    mov downRightDiagonalX, 575
    mov downRightDiagonalY, 445

    mov leftBaseX2, 500
    mov leftBaseY2, 445

    mov rightBaseX2, 550
    mov rightBaseY2, 445

    mov betweenBasesX, 525
    mov betweenBasesY, 420

    mov leftVerticalX2, 500
    mov leftVerticalY2, 395

    mov rightVerticalX1, 550
    mov rightVerticalY1, 395

    mov upLeftHorizontalX2, 475
    mov upLeftHorizontalY2, 395

    mov upRightHorizontalX2, 575
    mov upRightHorizontalY2, 395




endm



ship macro xAxis , shipColor   

    mov di, xAxis

    mov leftWingX1, di 
    mov leftWingY1, 420

    ; mov di, xAxis
    mov leftWingX2, di       ;; leftWingX2 = xAxis + 50
    add leftWingX2, 50

    ; mov leftWingX2, 250
    mov leftWingY2, 420

    mov rightWingX1, di        ;; rightWingX1 = xAxis + 100
    add rightWingX1, 100
    
    mov rightWingY1, 420

    mov rightWingX2, di            ;; rightWingX2 = xAxis + 150
    add rightWingX2, 150

    mov rightWingY2, 420

    mov halfLWingX1, di            ;; halfLWingX1 = xAxis + 25
    add halfLWingX1, 25
    
    mov halfLWingY1, 420

    mov halfLWingX2, di            ;; halfLWingX2 = xAxis + 75
    add halfLWingX2, 75

    mov halfLWingY2, 370

    mov halfRWingX1, di              ;; halfRWingX1 = xAxis + 125
    add halfRWingX1, 125
    
    mov halfRWingY1, 420

    mov halfRWingX2, di                ;; halfRWingX2 = xAxis + 75
    add halfRWingX2, 75
    
    mov halfRWingY2, 370

    mov downLeftDiagonalX, di                ;; downLeftDiagonalX = xAxis + 25
    add downLeftDiagonalX, 25
    
    mov downLeftDiagonalY, 445

    mov downRightDiagonalX, di                 ;; downRightDiagonalX = xAxis + 125
    add downRightDiagonalX, 125
    
    mov downRightDiagonalY, 445

    mov leftBaseX2, di                               ;; leftBaseX2 = xAxis + 50  
    add leftBaseX2, 50
    
    mov leftBaseY2, 445

    mov rightBaseX2, di                            ;; rightBaseX2 = xAxis + 100       
    add rightBaseX2, 100

    mov rightBaseY2, 445

    mov betweenBasesX, di                             ;; betweenBasesX = xAxis + 75
    add betweenBasesX, 75
    
    mov betweenBasesY, 420

    mov leftVerticalX2, di                               ;; leftVerticalX2 = xAxis + 50
    add leftVerticalX2, 50
    
    mov leftVerticalY2, 395

    mov rightVerticalX1, di            ;; rightVerticalX1 = xAxis + 100
    add rightVerticalX1, 100
    
    mov rightVerticalY1, 395

    mov upLeftHorizontalX2, di                    ;; upLeftHorizontalX2 = xAxis + 25
    add upLeftHorizontalX2, 25
    
    mov upLeftHorizontalY2, 395

    mov upRightHorizontalX2, di            ;; upRightHorizontalX2 = xAxis + 125
    add upRightHorizontalX2, 125
    
    mov upRightHorizontalY2, 395


    ; .IF leftWingX1 <= 10  ;; if moves out of left of screem
    ;     defaultRightValues
    ; .ELSEIF rightWingX2 >= 620  ;; if moves out of right of screem
    ;     defaultLeftValues
    ; .ENDIF
    


    printFrom shipColor, leftWingX1, leftWingY1, leftWingX2, leftWingY2     ;; left horizontal wing
    printFrom shipColor, rightWingX1,rightWingY1,rightWingX2 ,rightWingY2     ;; right horizontal wing

    printFrom shipColor, halfLWingX1, halfLWingY1, halfLWingX2, halfLWingY2    ;; left diagonal over left wing
    printFrom shipColor, halfRWingX1, halfRWingY1, halfRWingX2, halfRWingY2   ;; right diagonal over right wing

    printFrom shipColor, leftWingX2, leftWingY2, downLeftDiagonalX, downLeftDiagonalY    ;; down left diagonal under left wing
    printFrom shipColor, rightWingX1, rightWingY1, downRightDiagonalX, downRightDiagonalY    ;; down right diagonal under right wing

    printFrom shipColor, downLeftDiagonalX, downLeftDiagonalY, leftBaseX2, leftBaseY2      ;; horizontal down base of left engine
    printFrom shipColor, downRightDiagonalX, downRightDiagonalY, rightBaseX2, rightBaseY2     ;; horizontal down base of right engine

    printFrom shipColor, leftBaseX2, leftBaseY2, betweenBasesX, betweenBasesY     ;; right diagonal starting from left horizontal base
    printFrom shipColor, rightBaseX2, rightBaseY2, betweenBasesX, betweenBasesY     ;; left diagonal starting from right horizontal base

    printFrom shipColor, leftWingX2, leftWingY2, leftVerticalX2,leftVerticalY2    ;; vertical line from right end of left wing
    printFrom shipColor, rightWingX1, rightWingY1, rightVerticalX1, rightVerticalY1    ;; vertical line from left end of right wing

    printFrom shipColor, leftVerticalX2, leftVerticalY2, upLeftHorizontalX2, upLeftHorizontalY2      ;; upper left horizontal line above left wing
    printFrom shipColor, rightVerticalX1, rightVerticalY1, upRightHorizontalX2, upRightHorizontalY2     ;; upper right horizontal line above right wing

    printFrom shipColor, upLeftHorizontalX2, upLeftHorizontalY2, leftWingX1, leftWingY1       ;; left diagonal over left side of right wing 
    printFrom shipColor, upRightHorizontalX2, upRightHorizontalY2, rightWingX2, rightWingY2         ;; right diagonal over right side of right wing


endm

clear macro
    mov ax,03h
    int 10h
endm



delayfire macro
        push ax
        push bx
        push cx
        push dx

        mov cx,1000
        my1:
            mov bx,5      ;; increase this number if you want to add more delay, and decrease this number if you want to reduce delay.
            my2:
            dec bx
            jnz my2
        loop my1

        pop dx
        pop cx
        pop bx
        pop ax
endm




alien3 macro xAxis, yAxis , alien3Color  

    mov si, xAxis
    mov di, yAxis


    mov leftMostVerticalX1, si
    mov leftMostVerticalY1, di
    mov leftMostVerticalX2, si
    mov leftMostVerticalY2, di
    add leftMostVerticalY2, 50




    mov rightMostVerticalX1, si    ; +=120
    add rightMostVerticalX1, 120

    mov rightMostVerticalY1, di
    mov rightMostVerticalX2, si    ; +=120
    add rightMostVerticalX2, 120

    mov rightMostVerticalY2, di
    add rightMostVerticalY2, 50




    mov leftVerticallineX1, si
    add leftVerticallineX1, 50

    mov leftVerticallineY1, di
    add leftVerticallineY1, 50

    mov leftVerticallineX2, si
    add leftVerticallineX2, 50

    mov leftVerticallineY2, di
    add leftVerticallineY2, 80






    mov rightVerticallineX1, si
    add rightVerticallineX1, 70

    mov rightVerticallineY1, di
    add rightVerticallineY1, 50

    mov rightVerticallineX2, si
    add rightVerticallineX2, 70

    mov rightVerticallineY2, di
    add rightVerticallineY2, 80




    mov downLeftDiagonalX1, si
    add downLeftDiagonalX1, 50

    mov downLeftDiagonalY1, di
    add downLeftDiagonalY1, 80

    mov downLeftDiagonalX2, si
    add downLeftDiagonalX2, 60

    mov downLeftDiagonalY2, di
    add downLeftDiagonalY2, 90





    mov downRightDiagonalX1, si
    add downRightDiagonalX1, 70

    mov downRightDiagonalY1, di
    add downRightDiagonalY1, 80

    mov downRightDiagonalX2, si
    add downRightDiagonalX2, 60

    mov downRightDiagonalY2, di
    add downRightDiagonalY2, 90




    mov topLeftDiagonalX1, si
    add topLeftDiagonalX1, 50

    mov topLeftDiagonalY1, di
    add topLeftDiagonalY1, 50

    mov topLeftDiagonalX2, si
    add topLeftDiagonalX2, 60

    mov topLeftDiagonalY2, di
    add topLeftDiagonalY2, 60





    mov topRightDiagonalX1, si
    add topRightDiagonalX1, 70

    mov topRightDiagonalY1, di
    add topRightDiagonalY1, 50

    mov topRightDiagonalX2, si
    add topRightDiagonalX2, 60

    mov topRightDiagonalY2, di
    add topRightDiagonalY2, 60




    mov upLeftX1, si
    add upLeftX1, 50

    mov upLeftY1, di
    add upLeftY1, 50

    mov upLeftX2, si

    mov upLeftY2, di
    add upLeftY2, 50




    mov upRightX1, si
    add upRightX1, 70

    mov upRightY1, di
    add upRightY1, 50

    mov upRightX2, si
    add upRightX2, 120

    mov upRightY2, di
    add upRightY2, 50



    mov lDiagonalUnderWingX1, si
    mov lDiagonalUnderWingY1, di
    add lDiagonalUnderWingY1, 50
    mov lDiagonalUnderWingX2, si
    add lDiagonalUnderWingX2, 50

    mov lDiagonalUnderWingY2, di
    add lDiagonalUnderWingY2, 80





    mov rDiagonalUnderWingX1, si
    add rDiagonalUnderWingX1, 120

    mov rDiagonalUnderWingY1, di
    add rDiagonalUnderWingY1, 50

    mov rDiagonalUnderWingX2, si
    add rDiagonalUnderWingX2, 90

    mov rDiagonalUnderWingY2, di
    add rDiagonalUnderWingY2, 80




    mov leftBaselineX1, si
    add leftBaselineX1, 30

    mov leftBaselineY1, di
    add leftBaselineY1, 80

    mov leftBaselineX2, si
    add leftBaselineX2, 50

    mov leftBaselineY2, di
    add leftBaselineY2, 80




    mov rightBaselineX1, si
    add rightBaselineX1, 90

    mov rightBaselineY1, di
    add rightBaselineY1, 80

    mov rightBaselineX2, si
    add rightBaselineX2, 70

    mov rightBaselineY2, di
    add rightBaselineY2, 80


    mov lDiagonalAboveWingX1, si
    add lDiagonalAboveWingX1, 50

    mov lDiagonalAboveWingY1, di
    add lDiagonalAboveWingY1, 50

    mov lDiagonalAboveWingX2, si

    mov lDiagonalAboveWingY2, di




    mov rDiagonalAboveWingX1, si
    add rDiagonalAboveWingX1, 70

    mov rDiagonalAboveWingY1, di
    add rDiagonalAboveWingY1, 50
    
    mov rDiagonalAboveWingX2, si
    add rDiagonalAboveWingX2, 120

    mov rDiagonalAboveWingY2, di


    printFrom alien3Color, leftVerticallineX1, leftVerticallineY1, leftVerticallineX2, leftVerticallineY2        ;; left line
    printFrom alien3Color, rightVerticallineX1, rightVerticallineY1, rightVerticallineX2, rightVerticallineY2        ;; right line
    
    printFrom alien3Color, downLeftDiagonalX1, downLeftDiagonalY1, downLeftDiagonalX2, downLeftDiagonalY2        ;; down left diagonal - up left to down right
    printFrom alien3Color, downRightDiagonalX1, downRightDiagonalY1, downRightDiagonalX2, downRightDiagonalY2        ;; down right diagonal - up right to down left

    printFrom alien3Color, topLeftDiagonalX1, topLeftDiagonalY1, topLeftDiagonalX2, topLeftDiagonalY2        ;; top left inner diagonal
    printFrom alien3Color, topRightDiagonalX1, topRightDiagonalY1, topRightDiagonalX2, topRightDiagonalY2        ;; top right inner diagonal

    printFrom alien3Color, upLeftX1, upLeftY1, upLeftX2, upLeftY2        ;; upper left line wing horizontal
    printFrom alien3Color, upRightX1, upRightY1, upRightX2, upRightY2        ;; upper right line wing horizontal

    printFrom alien3Color, lDiagonalUnderWingX1, lDiagonalUnderWingY1, lDiagonalUnderWingX2, lDiagonalUnderWingY2        ;; left diagonal below left line wing horizontal
    printFrom alien3Color, rDiagonalUnderWingX1, rDiagonalUnderWingY1, rDiagonalUnderWingX2, rDiagonalUnderWingY2        ;; right diagonal below right line wing horizontal

    printFrom alien3Color, leftBaselineX1, leftBaselineY1, leftBaselineX2, leftBaselineY2         ;; down left base line under wing horizontal
    printFrom alien3Color, rightBaselineX1, rightBaselineY1, rightBaselineX2, rightBaselineY2        ;; down right base line under wing horizontal

    printFrom alien3Color, lDiagonalAboveWingX1, lDiagonalAboveWingY1, lDiagonalAboveWingX2, lDiagonalAboveWingY2        ;; upper left diagonal above left wing horizontal  
    printFrom alien3Color, rDiagonalAboveWingX1, rDiagonalAboveWingY1, rDiagonalAboveWingX2, rDiagonalAboveWingY2        ;; upper right diagonal above right wing horizontal

    printFrom alien3Color, leftMostVerticalX1, leftMostVerticalY1, leftMostVerticalX2, leftMostVerticalY2        ;; upper left vertical
    printFrom alien3Color, rightMostVerticalX1, rightMostVerticalY1, rightMostVerticalX2, rightMostVerticalY2        ;; upper right vertical



endm



printGraphicString macro string, row, col, space, color

    push si
    push di

    mov si, offset string
    mov colno, col
    mov strCount, 0
    ; mov nameColor, color

    .while strCount != lengthof string
        mov ah,2    ;mov cursor to specific position
        mov bh,0    ;page no =0
        mov dh,row   ;mov to row#
        mov dl,colno   ;mov to column#
        int 10h	    ;print graphic

        mov ah,9    ;print char w.r.t attributes
        mov al,[si]  ;character to print
        mov bl,color  ;attributes
        mov bh,0	;page number
        mov cx,1	;times of printing
        int 10h		;print graphics

        add colno, space
        inc si
        inc strCount
    .endw

    pop di
    pop si

endm


popall macro
    pop dx
    pop cx
    pop bx
    pop ax
endm

pushAll macro
    push ax
    push bx
    push cx
    push dx
endm


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




monster macro x,y,color

    mov si,x
    mov temp_x,si
    mov x_axis,si

    mov si,y
    mov temp_y,si
    mov y_axis,si

    add temp_x,20
    add temp_y,17
    box x_axis,y_axis,temp_y,temp_x,color

    add x_axis,40
    add temp_x,40
    box x_axis,y_axis,temp_y,temp_x,color

    sub x_axis,55
    add temp_x,15
    add y_axis,17
    add temp_y,10
    box x_axis,y_axis,temp_y,temp_x,color
    
    sub x_axis,10
    add y_axis,10
    add temp_y,10
    add temp_x,10
    box x_axis,y_axis,temp_y,temp_x,color

    sub x_axis,10
    add y_axis,10
    add temp_y,10
    add temp_x,10
    box x_axis,y_axis,temp_y,temp_x,color

    sub x_axis,10
    add y_axis,10
    add temp_y,10
    add temp_x,10
    box x_axis,y_axis,temp_y,temp_x,color

    add y_axis,10
    add temp_y,5
    sub temp_x,103
    box x_axis,y_axis,temp_y,temp_x,color
    add x_axis,67
    add temp_x,36
    box x_axis,y_axis,temp_y,temp_x,color
    add x_axis,36
    add temp_x,67
    box x_axis,y_axis,temp_y,temp_x,color

    sub x_axis,103
    add y_axis,5
    add temp_y,13
    sub temp_x,133
    box x_axis,y_axis,temp_y,temp_x,color
    add x_axis,33
    add temp_x,30
    box x_axis,y_axis,temp_y,temp_x,color

    add x_axis,34
    add temp_x,36
    box x_axis,y_axis,temp_y,temp_x,color

    add x_axis,36
    add temp_x,34
    box x_axis,y_axis,temp_y,temp_x,color
    add x_axis,30
    add temp_x,33
    box x_axis,y_axis,temp_y,temp_x,color

    sub x_axis,133
    add y_axis,13
    add temp_y,4
    sub temp_x,133
    box x_axis,y_axis,temp_y,temp_x,color
    add x_axis,33
    add temp_x,100
    box x_axis,y_axis,temp_y,temp_x,color
    add x_axis,100
    add temp_x,33
    box x_axis,y_axis,temp_y,temp_x,color

    sub x_axis,133
    add y_axis,4
    add temp_y,15
    sub temp_x,133
    box x_axis,y_axis,temp_y,temp_x,color
    add x_axis,43
    add temp_x,90
    box x_axis,y_axis,temp_y,temp_x,color
    add x_axis,90
    add temp_x,43
    box x_axis,y_axis,temp_y,temp_x,color

    sub x_axis,90
    add y_axis,11
    add temp_y,28
    sub temp_x,85
    box x_axis,y_axis,temp_y,temp_x,color
    add x_axis,42
    add temp_x,42
    box x_axis,y_axis,temp_y,temp_x,color

    sub x_axis,61
    add y_axis,17
    sub temp_x,64
    box x_axis,y_axis,temp_y,temp_x,color
    add x_axis,83
    add temp_x,83
    box x_axis,y_axis,temp_y,temp_x,color

endm



triangle macro color, x1, y1, x2, y2, x3, y3

    printFrom color, x1, y1, x2, y2
    printFrom color, x2, y2, x3, y3
    printFrom color, x3, y3, x1, y1

endm


defaultLeftValues macro

    mov leftWingX1, 30
    mov leftWingY1, 420
    mov leftWingX2, 80
    mov leftWingY2, 420

    mov rightWingX1, 130
    mov rightWingY1, 420
    mov rightWingX2, 180
    mov rightWingY2, 420

    mov halfLWingX1, 55
    mov halfLWingY1, 420
    mov halfLWingX2, 105
    mov halfLWingY2, 370

    mov halfRWingX1, 155
    mov halfRWingY1, 420
    mov halfRWingX2, 105
    mov halfRWingY2, 370

    mov downLeftDiagonalX, 55
    mov downLeftDiagonalY, 445

    mov downRightDiagonalX, 155
    mov downRightDiagonalY, 445

    mov leftBaseX2, 80
    mov leftBaseY2, 445

    mov rightBaseX2, 130
    mov rightBaseY2, 445

    mov betweenBasesX, 105
    mov betweenBasesY, 420

    mov leftVerticalX2, 80
    mov leftVerticalY2, 395

    mov rightVerticalX1, 130
    mov rightVerticalY1, 395

    mov upLeftHorizontalX2, 55
    mov upLeftHorizontalY2, 395

    mov upRightHorizontalX2, 155
    mov upRightHorizontalY2, 395

endm


defaultRightValues macro

    mov leftWingX1, 450
    mov leftWingY1, 420
    mov leftWingX2, 500
    mov leftWingY2, 420

    mov rightWingX1, 550
    mov rightWingY1, 420
    mov rightWingX2, 600
    mov rightWingY2, 420

    mov halfLWingX1, 475
    mov halfLWingY1, 420
    mov halfLWingX2, 525
    mov halfLWingY2, 370

    mov halfRWingX1, 575
    mov halfRWingY1, 420
    mov halfRWingX2, 525
    mov halfRWingY2, 370

    mov downLeftDiagonalX, 475
    mov downLeftDiagonalY, 445

    mov downRightDiagonalX, 575
    mov downRightDiagonalY, 445

    mov leftBaseX2, 500
    mov leftBaseY2, 445

    mov rightBaseX2, 550
    mov rightBaseY2, 445

    mov betweenBasesX, 525
    mov betweenBasesY, 420

    mov leftVerticalX2, 500
    mov leftVerticalY2, 395

    mov rightVerticalX1, 550
    mov rightVerticalY1, 395

    mov upLeftHorizontalX2, 475
    mov upLeftHorizontalY2, 395

    mov upRightHorizontalX2, 575
    mov upRightHorizontalY2, 395




endm



ship macro xAxis , shipColor   

    mov di, xAxis

    mov leftWingX1, di 
    mov leftWingY1, 420

    ; mov di, xAxis
    mov leftWingX2, di       ;; leftWingX2 = xAxis + 50
    add leftWingX2, 50

    ; mov leftWingX2, 250
    mov leftWingY2, 420

    mov rightWingX1, di        ;; rightWingX1 = xAxis + 100
    add rightWingX1, 100
    
    mov rightWingY1, 420

    mov rightWingX2, di            ;; rightWingX2 = xAxis + 150
    add rightWingX2, 150

    mov rightWingY2, 420

    mov halfLWingX1, di            ;; halfLWingX1 = xAxis + 25
    add halfLWingX1, 25
    
    mov halfLWingY1, 420

    mov halfLWingX2, di            ;; halfLWingX2 = xAxis + 75
    add halfLWingX2, 75

    mov halfLWingY2, 370

    mov halfRWingX1, di              ;; halfRWingX1 = xAxis + 125
    add halfRWingX1, 125
    
    mov halfRWingY1, 420

    mov halfRWingX2, di                ;; halfRWingX2 = xAxis + 75
    add halfRWingX2, 75
    
    mov halfRWingY2, 370

    mov downLeftDiagonalX, di                ;; downLeftDiagonalX = xAxis + 25
    add downLeftDiagonalX, 25
    
    mov downLeftDiagonalY, 445

    mov downRightDiagonalX, di                 ;; downRightDiagonalX = xAxis + 125
    add downRightDiagonalX, 125
    
    mov downRightDiagonalY, 445

    mov leftBaseX2, di                               ;; leftBaseX2 = xAxis + 50  
    add leftBaseX2, 50
    
    mov leftBaseY2, 445

    mov rightBaseX2, di                            ;; rightBaseX2 = xAxis + 100       
    add rightBaseX2, 100

    mov rightBaseY2, 445

    mov betweenBasesX, di                             ;; betweenBasesX = xAxis + 75
    add betweenBasesX, 75
    
    mov betweenBasesY, 420

    mov leftVerticalX2, di                               ;; leftVerticalX2 = xAxis + 50
    add leftVerticalX2, 50
    
    mov leftVerticalY2, 395

    mov rightVerticalX1, di            ;; rightVerticalX1 = xAxis + 100
    add rightVerticalX1, 100
    
    mov rightVerticalY1, 395

    mov upLeftHorizontalX2, di                    ;; upLeftHorizontalX2 = xAxis + 25
    add upLeftHorizontalX2, 25
    
    mov upLeftHorizontalY2, 395

    mov upRightHorizontalX2, di            ;; upRightHorizontalX2 = xAxis + 125
    add upRightHorizontalX2, 125
    
    mov upRightHorizontalY2, 395


    ; .IF leftWingX1 <= 10  ;; if moves out of left of screem
    ;     defaultRightValues
    ; .ELSEIF rightWingX2 >= 620  ;; if moves out of right of screem
    ;     defaultLeftValues
    ; .ENDIF
    


    printFrom shipColor, leftWingX1, leftWingY1, leftWingX2, leftWingY2     ;; left horizontal wing
    printFrom shipColor, rightWingX1,rightWingY1,rightWingX2 ,rightWingY2     ;; right horizontal wing

    printFrom shipColor, halfLWingX1, halfLWingY1, halfLWingX2, halfLWingY2    ;; left diagonal over left wing
    printFrom shipColor, halfRWingX1, halfRWingY1, halfRWingX2, halfRWingY2   ;; right diagonal over right wing

    printFrom shipColor, leftWingX2, leftWingY2, downLeftDiagonalX, downLeftDiagonalY    ;; down left diagonal under left wing
    printFrom shipColor, rightWingX1, rightWingY1, downRightDiagonalX, downRightDiagonalY    ;; down right diagonal under right wing

    printFrom shipColor, downLeftDiagonalX, downLeftDiagonalY, leftBaseX2, leftBaseY2      ;; horizontal down base of left engine
    printFrom shipColor, downRightDiagonalX, downRightDiagonalY, rightBaseX2, rightBaseY2     ;; horizontal down base of right engine

    printFrom shipColor, leftBaseX2, leftBaseY2, betweenBasesX, betweenBasesY     ;; right diagonal starting from left horizontal base
    printFrom shipColor, rightBaseX2, rightBaseY2, betweenBasesX, betweenBasesY     ;; left diagonal starting from right horizontal base

    printFrom shipColor, leftWingX2, leftWingY2, leftVerticalX2,leftVerticalY2    ;; vertical line from right end of left wing
    printFrom shipColor, rightWingX1, rightWingY1, rightVerticalX1, rightVerticalY1    ;; vertical line from left end of right wing

    printFrom shipColor, leftVerticalX2, leftVerticalY2, upLeftHorizontalX2, upLeftHorizontalY2      ;; upper left horizontal line above left wing
    printFrom shipColor, rightVerticalX1, rightVerticalY1, upRightHorizontalX2, upRightHorizontalY2     ;; upper right horizontal line above right wing

    printFrom shipColor, upLeftHorizontalX2, upLeftHorizontalY2, leftWingX1, leftWingY1       ;; left diagonal over left side of right wing 
    printFrom shipColor, upRightHorizontalX2, upRightHorizontalY2, rightWingX2, rightWingY2         ;; right diagonal over right side of right wing

endm



alien3 macro xAxis, yAxis , alien3Color  

    mov si, xAxis
    mov di, yAxis


    mov leftMostVerticalX1, si
    mov leftMostVerticalY1, di
    mov leftMostVerticalX2, si
    mov leftMostVerticalY2, di
    add leftMostVerticalY2, 50




    mov rightMostVerticalX1, si    ; +=120
    add rightMostVerticalX1, 120

    mov rightMostVerticalY1, di
    mov rightMostVerticalX2, si    ; +=120
    add rightMostVerticalX2, 120

    mov rightMostVerticalY2, di
    add rightMostVerticalY2, 50




    mov leftVerticallineX1, si
    add leftVerticallineX1, 50

    mov leftVerticallineY1, di
    add leftVerticallineY1, 50

    mov leftVerticallineX2, si
    add leftVerticallineX2, 50

    mov leftVerticallineY2, di
    add leftVerticallineY2, 80






    mov rightVerticallineX1, si
    add rightVerticallineX1, 70

    mov rightVerticallineY1, di
    add rightVerticallineY1, 50

    mov rightVerticallineX2, si
    add rightVerticallineX2, 70

    mov rightVerticallineY2, di
    add rightVerticallineY2, 80




    mov downLeftDiagonalX1, si
    add downLeftDiagonalX1, 50

    mov downLeftDiagonalY1, di
    add downLeftDiagonalY1, 80

    mov downLeftDiagonalX2, si
    add downLeftDiagonalX2, 60

    mov downLeftDiagonalY2, di
    add downLeftDiagonalY2, 90





    mov downRightDiagonalX1, si
    add downRightDiagonalX1, 70

    mov downRightDiagonalY1, di
    add downRightDiagonalY1, 80

    mov downRightDiagonalX2, si
    add downRightDiagonalX2, 60

    mov downRightDiagonalY2, di
    add downRightDiagonalY2, 90




    mov topLeftDiagonalX1, si
    add topLeftDiagonalX1, 50

    mov topLeftDiagonalY1, di
    add topLeftDiagonalY1, 50

    mov topLeftDiagonalX2, si
    add topLeftDiagonalX2, 60

    mov topLeftDiagonalY2, di
    add topLeftDiagonalY2, 60





    mov topRightDiagonalX1, si
    add topRightDiagonalX1, 70

    mov topRightDiagonalY1, di
    add topRightDiagonalY1, 50

    mov topRightDiagonalX2, si
    add topRightDiagonalX2, 60

    mov topRightDiagonalY2, di
    add topRightDiagonalY2, 60




    mov upLeftX1, si
    add upLeftX1, 50

    mov upLeftY1, di
    add upLeftY1, 50

    mov upLeftX2, si

    mov upLeftY2, di
    add upLeftY2, 50




    mov upRightX1, si
    add upRightX1, 70

    mov upRightY1, di
    add upRightY1, 50

    mov upRightX2, si
    add upRightX2, 120

    mov upRightY2, di
    add upRightY2, 50



    mov lDiagonalUnderWingX1, si
    mov lDiagonalUnderWingY1, di
    add lDiagonalUnderWingY1, 50
    mov lDiagonalUnderWingX2, si
    add lDiagonalUnderWingX2, 50

    mov lDiagonalUnderWingY2, di
    add lDiagonalUnderWingY2, 80





    mov rDiagonalUnderWingX1, si
    add rDiagonalUnderWingX1, 120

    mov rDiagonalUnderWingY1, di
    add rDiagonalUnderWingY1, 50

    mov rDiagonalUnderWingX2, si
    add rDiagonalUnderWingX2, 90

    mov rDiagonalUnderWingY2, di
    add rDiagonalUnderWingY2, 80




    mov leftBaselineX1, si
    add leftBaselineX1, 30

    mov leftBaselineY1, di
    add leftBaselineY1, 80

    mov leftBaselineX2, si
    add leftBaselineX2, 50

    mov leftBaselineY2, di
    add leftBaselineY2, 80




    mov rightBaselineX1, si
    add rightBaselineX1, 90

    mov rightBaselineY1, di
    add rightBaselineY1, 80

    mov rightBaselineX2, si
    add rightBaselineX2, 70

    mov rightBaselineY2, di
    add rightBaselineY2, 80


    mov lDiagonalAboveWingX1, si
    add lDiagonalAboveWingX1, 50

    mov lDiagonalAboveWingY1, di
    add lDiagonalAboveWingY1, 50

    mov lDiagonalAboveWingX2, si

    mov lDiagonalAboveWingY2, di




    mov rDiagonalAboveWingX1, si
    add rDiagonalAboveWingX1, 70

    mov rDiagonalAboveWingY1, di
    add rDiagonalAboveWingY1, 50
    
    mov rDiagonalAboveWingX2, si
    add rDiagonalAboveWingX2, 120

    mov rDiagonalAboveWingY2, di


    printFrom alien3Color, leftVerticallineX1, leftVerticallineY1, leftVerticallineX2, leftVerticallineY2        ;; left line
    printFrom alien3Color, rightVerticallineX1, rightVerticallineY1, rightVerticallineX2, rightVerticallineY2        ;; right line
    
    printFrom alien3Color, downLeftDiagonalX1, downLeftDiagonalY1, downLeftDiagonalX2, downLeftDiagonalY2        ;; down left diagonal - up left to down right
    printFrom alien3Color, downRightDiagonalX1, downRightDiagonalY1, downRightDiagonalX2, downRightDiagonalY2        ;; down right diagonal - up right to down left

    printFrom alien3Color, topLeftDiagonalX1, topLeftDiagonalY1, topLeftDiagonalX2, topLeftDiagonalY2        ;; top left inner diagonal
    printFrom alien3Color, topRightDiagonalX1, topRightDiagonalY1, topRightDiagonalX2, topRightDiagonalY2        ;; top right inner diagonal

    printFrom alien3Color, upLeftX1, upLeftY1, upLeftX2, upLeftY2        ;; upper left line wing horizontal
    printFrom alien3Color, upRightX1, upRightY1, upRightX2, upRightY2        ;; upper right line wing horizontal

    printFrom alien3Color, lDiagonalUnderWingX1, lDiagonalUnderWingY1, lDiagonalUnderWingX2, lDiagonalUnderWingY2        ;; left diagonal below left line wing horizontal
    printFrom alien3Color, rDiagonalUnderWingX1, rDiagonalUnderWingY1, rDiagonalUnderWingX2, rDiagonalUnderWingY2        ;; right diagonal below right line wing horizontal

    printFrom alien3Color, leftBaselineX1, leftBaselineY1, leftBaselineX2, leftBaselineY2         ;; down left base line under wing horizontal
    printFrom alien3Color, rightBaselineX1, rightBaselineY1, rightBaselineX2, rightBaselineY2        ;; down right base line under wing horizontal

    printFrom alien3Color, lDiagonalAboveWingX1, lDiagonalAboveWingY1, lDiagonalAboveWingX2, lDiagonalAboveWingY2        ;; upper left diagonal above left wing horizontal  
    printFrom alien3Color, rDiagonalAboveWingX1, rDiagonalAboveWingY1, rDiagonalAboveWingX2, rDiagonalAboveWingY2        ;; upper right diagonal above right wing horizontal

    printFrom alien3Color, leftMostVerticalX1, leftMostVerticalY1, leftMostVerticalX2, leftMostVerticalY2        ;; upper left vertical
    printFrom alien3Color, rightMostVerticalX1, rightMostVerticalY1, rightMostVerticalX2, rightMostVerticalY2        ;; upper right vertical



endm