.model small
.stack 100h
.code
main proc
    mov ax, 13h
    int 10h

    mov cx, 50       ; start X
    mov dx, 100      ; Y fixed
line_loop:
    mov ah, 0Ch
    mov al, 15       ; white
    int 10h
    inc cx
    cmp cx, 200
    jle line_loop

    mov ah, 0
    int 16h
    mov ax, 03h
    int 10h
    ret
main endp
end main
