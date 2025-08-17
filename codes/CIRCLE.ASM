.model small
.stack 100h
.code
main proc
    mov ax, 13h
    int 10h

    mov cx, 160      ; circle center X
    mov dx, 100      ; circle center Y
    mov si, 50       ; radius

    ; Bresenham circle algorithm
    mov ax, 0
    mov bx, si
    mov di, 1 - si

draw_circle:
    ; Plot 8 symmetric points
    mov ah, 0Ch
    mov al, 12       ; color

    mov si, cx
    add si, ax
    mov bp, dx
    add bp, bx
    mov cx, si
    mov dx, bp
    int 10h

    ; Other 7 points (omitted for brevity, replicate symmetrically)
    ; ...

    inc ax
    cmp ax, bx
    jg done_circle
    cmp di, 0
    jle circle_adjust1
    dec bx
circle_adjust1:
    dec di
    jmp draw_circle

done_circle:
    mov ah, 0
    int 16h
    mov ax, 03h
    int 10h
    ret
main endp
end main
