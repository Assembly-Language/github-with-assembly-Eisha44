INCLUDE c:\Users\Lenovo\.vscode\extensions\istareatscreens.masm-runner-0.4.5\native\irvine\Irvine32.inc

.data
array DWORD 3, 6, 1, 10, 40, 4
str1 db "The sum of all odd numbers is: ", 0
str2 db "The total number of odd numbers is: ", 0
sum DWORD 0
count DWORD 0

.code
main proc
    call clrscr
    mov esi, OFFSET array         
    mov ecx, LENGTHOF array       

next:
    test DWORD PTR [esi], 1       ; Check if the number is odd (LSB = 1)
    jz skip                      ; If even, skip the addition
    mov eax, sum                  
    add eax, [esi]                
    mov sum, eax                  
    mov eax, count                
    inc eax                       ; Increment the count
    mov count, eax               
skip:
    add esi, TYPE array           
    loop next                     

    ; Display the sum of odd numbers
    mov edx, OFFSET str1
    call writestring
    mov eax, sum
    call WriteInt
 call crlf
 exit
 main endp
 end main
