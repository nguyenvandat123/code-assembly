section .data
s1 db 'nhap chuoi: '
len1 equ $-s1
s2 db 'xuat chuoi da nhap: '
len2 equ $-s2

section .bss
num resb 64

section .text
global _start

_start:
mov eax,4
mov ebx,1
mov ecx,s1
mov edx,len1
int 0x80

mov eax,3
mov ebx,2
mov ecx,num
mov edx,64
int 0x80

mov eax,4
mov ebx,1
mov ecx,s2
mov edx,len2
int 0x80

mov eax,4
mov ebx,1
mov ecx,num
mov edx,64
int 0x80

mov eax,1
xor ebx,ebx
int 0x80