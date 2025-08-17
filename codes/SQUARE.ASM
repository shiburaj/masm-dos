.model small
.stack 100h
.code
main proc
    mov ax, 13h
    int 10h

    mov si, 50        ; start X
    mov di, 50        ; start Y
    mov cx, 50        ; square size

draw_square:
    mov ah, 0Ch
    mov al, 14       ; yellow
    mov bx, si
    mov dx, di
    int 10h
    inc si
    cmp si, 50+cx
    jl draw_square

    ; Wait key & exit
    mov ah, 0
    int 16h
    mov ax, 03h
    int 10h
    ret
main endp
end main
