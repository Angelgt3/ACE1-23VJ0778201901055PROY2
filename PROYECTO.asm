.MODEL SMALL
.RADIX 16
.STACK
.DATA

;;EXTRA
valor1                       db     2 dup (0),'$'
valor2                       db     2 dup (0),'$'
buffer_linea                 db     0ff dup (0)
tam_liena_leida              db     00
estado                       db     00,'$'

;; Tokens
tk_pared                    db     05, "pared"
tk_jugador                  db     07, "jugador"
tk_caja                     db     04, "caja"
tk_objetivo                 db     08, "objetivo"
tk_coma                     db     01, ","

hola_mundo                  db     "Hola mundo",'$'
ln  					  	db    	0d,0a,"$"

;;nivel 1 
archivo_nivel1              db     "NIV.00", 00
handle_nivel1               dw     0000

.CODE
.STARTUP
;;---------------------------------------------------- Macros ---------------------------------------------------------------

;imprime una cadena en pantalla
print macro buffer 
	mov ah, 09
	mov dx, offset buffer
	int 21h
endm

;-------------------------------------CODIGO------------------------------------------------
inicio:
    jmp leer_nivel_1
    jmp fin

leer_nivel_1:
    ;; abrir archivo de nvl1
    mov AH, 3d
    mov AL, 00
    mov DX, offset archivo_nivel1
    int 21
    mov [handle_nivel1], AX
    ciclo_lineaXlinea:
        ;volver el estado 0
        mov DI, offset estado
        mov CX, 1
        call limpiar

        mov DI, offset buffer_linea
        mov AL, 00
        mov [tam_liena_leida], AL
        ciclo_obtener_linea:
            mov AH, 3f
            mov BX, [handle_nivel1]
            mov CX, 0001
            mov DX, DI
            int 21
            cmp AX, 00 ;se sale si es 0
		    je fin
            cmp CX, 0000
            je fin ;;regresar al menu
            mov AL, [DI]
            cmp AL, 0a ;salto de linea
            je fin_leer_linea
            mov AL, [tam_liena_leida]
            inc AL
            mov [tam_liena_leida], AL
            inc DI
            jmp ciclo_obtener_linea

fin_leer_linea:
    mov AL, [tam_liena_leida]
    mov AL, 00
    cmp [estado], AL   ;; verificar si es pared
    je verificar_cadena_pared
    mov AL, 01
    cmp [estado], AL   ;; verificar si es jugador
    je verificar_cadena_jugador
    mov AL, 02
    cmp [estado], AL   ;; veficar si es caja
    je verificar_cadena_caja
    mov AL, 03
    cmp [estado], AL   ;; veficar si es objetivo
    je verificar_cadena_objetivo
    jmp fin ;;linea hecha 

verificar_cadena_pared:
    cmp CX, 0000
    je intentar_de_nuevo ;retorno_fallido
    mov CH, 00
    mov CL, [tk_pared]
    mov SI, offset tk_pared
    inc SI
    mov DI, offset buffer_linea
    call cadenas_iguales
    cmp DL, 0ff
    je verificar_coordenadas
    jmp intentar_de_nuevo

verificar_cadena_jugador:
    cmp CX, 0000
    je intentar_de_nuevo ;retorno_fallido
    mov CH, 00
    mov CL, [tk_jugador]
    mov SI, offset tk_jugador
    inc SI
    mov DI, offset buffer_linea
    call cadenas_iguales
    cmp DL, 0ff
    je verificar_coordenadas
    jmp intentar_de_nuevo

verificar_cadena_caja:
    cmp CX, 0000
    je intentar_de_nuevo ;retorno_fallido
    mov CH, 00
    mov CL, [tk_caja]
    mov SI, offset tk_caja
    inc SI
    mov DI, offset buffer_linea
    call cadenas_iguales
    cmp DL, 0ff
    je verificar_coordenadas
    jmp intentar_de_nuevo

verificar_cadena_objetivo:
    cmp CX, 0000
    je intentar_de_nuevo ;retorno_fallido
    mov CH, 00
    mov CL, [tk_objetivo]
    mov SI, offset tk_objetivo
    inc SI
    mov DI, offset buffer_linea
    call cadenas_iguales
    cmp DL, 0ff
    je verificar_coordenadas
    jmp intentar_de_nuevo

verificar_coordenadas:
    ciclo_espacios1:
        inc DI
        mov AL, [DI]
        cmp AL, 20    ;; ver si es espacio
        jne capturar_coordenada1
        inc DI
        jmp ciclo_espacios1
    
capturar_coordenada1:
    mov CX, 0002     ;; leer 2 bytes
    mov SI, offset valor1
    ciclo_capturar_valor1:
		mov AL, [DI]
		mov [SI], AL
        inc DI
		inc SI
		loop ciclo_capturar_valor1
        print ln
        print valor1
        print ln
        jmp ciclo_espacios2
ciclo_espacios2:
    inc DI
    mov AL, [DI]
    cmp AL, 20    ;; ver si es espacio
    jne capturar_coordenada2
    inc DI
    jmp ciclo_espacios2
    
capturar_coordenada2:
    mov CX, 0002     ;; leer 2 bytes
    mov SI, offset valor2
    ciclo_capturar_valor2:
		mov AL, [DI]
		mov [SI], AL
        inc DI
		inc SI
		loop ciclo_capturar_valor2
        print valor2
        print ln
        jmp ciclo_lineaXlinea

intentar_de_nuevo:
    mov AL, [estado]
    inc AL
    mov [estado], AL
    jmp fin_leer_linea
    

;-------------------------------------SUBRUTINAS---------------------------------------------------
;;ENTRADA: SI Y DI, CX = tamaño
;;SALIDA: DL = 00 si no son iguales ; Off si son iguales
cadenas_iguales:
    ciclo_cadenas_iguales:
		mov AL, [SI]
		cmp [DI], AL
		jne no_son_iguales
		inc DI
		inc SI
		loop ciclo_cadenas_iguales
		mov DL, 0ff
		ret
    no_son_iguales:	mov DL, 00
		ret

limpiar:
ciclo_limpiar:
	mov AL, 00
	mov [DI], AL
	inc DI
	loop ciclo_limpiar
	ret

;-------------------------------------FIN---------------------------------------------------
fin:
.EXIT
END