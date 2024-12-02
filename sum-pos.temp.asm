INCLUDE c:\Users\Lenovo\.vscode\extensions\istareatscreens.masm-runner-0.4.5\native\irvine\Irvine32.inc

.data
str1 db "The Sum of positive elements is: ",0
str2 db "The total positive numbers are: ",0
array DWORD 3,6,1,10,20,30,40,4
sum DWORD 0
count DWORD 0

.code
main proc
    call clrscr
    mov esi, OFFSET array
    mov ecx, LENGTHOF array

next:
    test DWORD PTR [esi], 80000000h ; Check if negative
    jnz skip                        ; If negative, skip
    mov eax, sum                   
    add eax, [esi]                  ; Add the array element
    mov sum, eax                    
    mov eax, count                 
    inc eax                         ; Increment count
    mov count, eax                  
skip:
    add esi, TYPE array             
    dec ecx                         ; Decrement the loop counter
    jnz next                        ; Repeat if ecx != 0
    ; Display sum
    mov edx, OFFSET str1
    call writestring
    mov eax, sum
    call WriteInt
    call crlf
    ; Display count
    mov edx, OFFSET str2
    call writestring
    mov eax, count
    call WriteInt
    call crlf

    exit
main endp
end main
