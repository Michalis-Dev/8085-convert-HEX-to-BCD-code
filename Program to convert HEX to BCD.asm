
;<Program title>

jmp start

;data


;code
start: nop
LXI H,8000H	; initialize memory point
MVI D,00H	; clear D - reg for most significant byte
XRA A		; clear accumulator
MOV C,M		; get hex data
LOOP: ADI 01H	; count the number one by one
DAA		; adjust for BCD count
JNC SKIP	; jump to skip line 19
INR D		; increase D
SKIP: DCR C	; decrease C register
JNZ LOOP 	; jump to loop
MOV L,A		; load the last significant byte
MOV H,D		; load the most Significant byte

RRC
RRC
RRC
RRC
MOV B,A


SHLD 8050H	; store the BCD
HLT		; terminate the program
