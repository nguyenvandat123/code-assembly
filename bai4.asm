section .data
    prompt db "Nhập chuỗi: ", 0
    output db "Chuỗi đảo ngược: ", 0
    max_len equ 100

section .bss
    input resb max_len
    reverse resb max_len

section .text
    global _start

_start:
    ; In ra câu hỏi nhập chuỗi
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 13
    int 0x80

    ; Nhập chuỗi từ người dùng
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, max_len
    int 0x80

    ; Tính độ dài của chuỗi
    mov esi, input
    xor ecx, ecx
    mov cl, [esi+1]

    ; Lưu trữ địa chỉ của chuỗi đảo ngược
    mov edi, reverse
    add edi, ecx

    ; Đảo ngược chuỗi
    loop_start:
        mov al, [esi+ecx]
       
        inc ecx
        cmp ecx, [esi+1]
        jne loop_start

    ; In ra chuỗi đảo ngược
    mov eax, 4
    mov ebx, 1
    mov ecx, output
    mov edx, 19
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, reverse
    mov edx, [esi+1]
    int 0x80

    ; Thoát chương trình
    mov eax, 1
    xor ebx, ebx
    int 0x80
