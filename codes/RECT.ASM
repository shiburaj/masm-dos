.model small
.stack 100h
.code
main proc
    mov ax, 13h
    int 10h

    mov cx, 50   ; X start
    mov dx, 50   ; Y start
    mov bx, 100  ; width
    mov si, 50   ; height

draw_rect:
    push cx
    mov di, 0
line_x:
    mov ah, 0Ch
    mov al, 11
    int 10h
    inc cx
    inc di
    cmp di, bx
    jl line_x
    pop cx
    inc dx
    dec si
    cmp si, 0
    jg draw_rect

    mov ah, 0
    int 16h
    mov ax, 03h
    int 10h
    ret
main endp
end main
