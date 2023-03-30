section .data
   s1 db 'nhap chuoi: '
   len1 equ $-s1
   s2 db 'chuoi da chuyen doi: '
   len2 equ $-s2

section .bss
   chuoi resb 64

section .text
   global _start

toupper:
   mov al, byte [edi]
   cmp al,0
   je done
   cmp al,'a'
   jb continue
   cmp al, 'z'
   ja continue
   sub al,32
   mov byte[edi],al
   inc edi 
   jmp toupper

continue:
   inc edi
   jmp toupper

done:
   ret

_start:
   mov eax,4
   mov ebx,1
   mov ecx,s1
   mov edx,len1
   int 0x80

   mov eax,3
   mov ebx,2
   mov ecx,chuoi
   mov edx,64
   int 0x80

   lea edi, [chuoi]
   call toupper

   mov eax,4
   mov ebx,1
   mov ecx,s2
   mov edx,len2
   int 0x80

   mov eax,4
   mov ebx,1
   mov ecx,chuoi
   mov edx,64
   int 0x80

   mov eax,1
   xor ebx,ebx
   int 0x80




