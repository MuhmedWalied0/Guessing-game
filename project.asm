.model small
.stack 100h

.data
    msg1 db "Enter a number between 0 and 9 for your friend to guess: $"
    msg2 db 10, "Friend's challenge: Enter your guess: $"
    msg3 db 10, "Is your friend's guess correct? $"
    msg4 db 10, "Your friend's guess is: $"
    msg5 db 10, "Your guess is: $"
    newline db 0Ah, "$"
    correct db "Correct!$"
    incorrect db "Incorrect!$"

    user_guess db ?
    friend_guess db ?

.code
main proc far
    .startup

    mov ah, 09h
    mov dx, offset msg1
    int 21h

    mov ah, 08h
    int 21h
    mov [user_guess], al

    mov ah, 09h
    lea dx, msg2
    int 21h

    mov ah, 08h
    int 21h
    mov [friend_guess], al

    mov al, [friend_guess]
    cmp al, [user_guess]
    je correct_guess
    jmp incorrect_guess

main endp

incorrect_guess proc near
    mov ah, 09h
    lea dx, newline
    int 21h

    mov ah, 09h
    lea dx, incorrect
    int 21h

    mov ah, 09h
    lea dx, msg4
    int 21h
    mov ah, 02h
    mov dl, [friend_guess]
    int 21h

    mov ah, 09h
    lea dx, msg5
    int 21h
    mov ah, 02h
    mov dl, [user_guess]
    int 21h

    .exit
    incorrect_guess endp

correct_guess proc near
    mov ah, 09h
    lea dx, newline
    int 21h

    mov ah, 09h
    lea dx, correct
    int 21h

    mov ah, 09h
    lea dx, msg4
    int 21h
    mov ah, 02h
    mov dl, [friend_guess]
    int 21h

    mov ah, 09h
    lea dx, msg5
    int 21h
    mov ah, 02h
    mov dl, [user_guess]
    int 21h

    .exit
    correct_guess endp

end main
