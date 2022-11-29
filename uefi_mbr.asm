;
; Copyright 2022 Steffen Winterfeldt
;
; See LICENSE for details.
;

			bits 16

			section .text

			org 7c00h

			jmp 0:main_10
main_10:
			mov ax,cs
			mov ss,ax
			xor sp,sp
			mov ds,ax
			mov es,ax
			cld
			sti

			mov si,msg
final_msg:
			call print
			mov si,msg_next
			call print
			mov ah,0
			int 16h
			mov si,msg_nl
			call print
			int 18h
final_msg_10:
			hlt
			jmp final_msg_10

print:
			lodsb
			or al,al
			jz print_90
			mov bx,7
			mov ah,14
			int 10h
			jmp print
print_90:
			ret

msg_next                db 10, "Press a key to continue boot sequence.", 0
msg			db 10, "This disk is only UEFI bootable."
msg_nl			db 13, 10, 0
