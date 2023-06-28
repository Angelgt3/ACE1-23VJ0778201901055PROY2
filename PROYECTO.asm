NADA        equ      00
JUGADOR     equ      01
PARED       equ      02
CAJA        equ      03
OBJETIVO    equ      04
SUELO       equ      05
.MODEL SMALL
.RADIX 16
.STACK
.DATA
;;sprites
;;VACIO
dim_sprite_vacio  db   08, 08
data_sprite_vacio db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
;;FLECHA
dim_sprite_flcha  db   08, 08
data_sprite_flcha   db   00, 00, 04, 00, 00, 00, 00, 00
                    db   00, 00, 04, 04, 00, 00, 00, 00
                    db   04, 04, 04, 04, 04, 00, 00, 00
                    db   04, 04, 04, 04, 04, 04, 00, 00
                    db   04, 04, 04, 04, 04, 04, 00, 00
                    db   04, 04, 04, 04, 04, 00, 00, 00
                    db   00, 00, 04, 04, 00, 00, 00, 00
                    db   00, 00, 04, 00, 00, 00, 00, 00
;;PARED
dim_sprite_pared  db   08, 08
data_sprite_pared db   02, 02, 02, 00, 02, 02, 02, 00
                  db   02, 02, 02, 02, 02, 02, 02, 02
                  db   02, 02, 02, 02, 02, 02, 02, 02
                  db   02, 02, 02, 02, 02, 02, 02, 02
                  db   02, 02, 02, 02, 02, 02, 02, 00
                  db   06, 06, 06, 00, 06, 06, 06, 00
                  db   06, 06, 06, 00, 06, 06, 06, 00
                  db   06, 06, 06, 00, 06, 06, 06, 00
;;JUGADOR
dim_sprite_jug  db   08, 08
data_sprite_jug   db   00, 08, 02, 44, 44, 00, 00, 00
                  db   02, 08, 44, 58, 58, 44, 00, 00
                  db   02, 08, 44, 58, 58, 00, 00, 00
                  db   00, 08, 58, 58, 58, 00, 00, 00
                  db   11, 11, 11, 02, 02, 00, 08, 00
                  db   00, 58, 00, 43, 00, 02, 08, 00
                  db   00, 00, 02, 02, 02, 00, 08, 00
                  db   00, 00, 06, 00, 06, 00, 00, 00
;;SUELO
dim_sprite_suelo  db   08, 08
data_sprite_suelo db   75, 78, 75, 78, 75, 78, 75, 78
                  db   78, 75, 78, 75, 78, 75, 78, 75
                  db   75, 78, 75, 78, 75, 78, 75, 78
                  db   78, 75, 78, 75, 78, 75, 78, 75
                  db   75, 78, 75, 78, 75, 78, 75, 78
                  db   78, 75, 78, 75, 78, 75, 78, 75
                  db   75, 78, 75, 78, 75, 78, 75, 78
                  db   78, 75, 78, 75, 78, 75, 78, 75
;;CAJA
dim_sprite_caja  db   08, 08
data_sprite_caja  db   00, 00, 00, 00, 00, 00, 2c, 00
                  db   00, 7f, 7f, 7f, 00, 06, 29, 2c
                  db   7f, 7f, 7f, 7f, 06, 06, 2c, 00
                  db   7f, 7f, 7f, 7f, 7f, 00, 00, 00
                  db   7f, 7f, 7f, 7f, 7f, 00, 00, 00
                  db   7f, 7f, 7f, 7f, 7f, 00, 00, 00
                  db   7f, 7f, 7f, 7f, 7f, 00, 00, 00
                  db   00, 7f, 7f, 7f, 00, 00, 00, 00
;;OBJETIVO
dim_sprite_obj    db   08, 08
data_sprite_obj   db   08, 08, 08, 08, 08, 08, 08, 08
                  db   08, 28, 08, 08, 08, 08, 28, 08
                  db   08, 08, 28, 08, 08, 28, 08, 08
                  db   08, 08, 08, 28, 28, 08, 08, 08
                  db   08, 08, 08, 28, 28, 08, 08, 08
                  db   08, 08, 28, 08, 08, 28, 08, 08
                  db   08, 28, 08, 08, 08, 08, 28, 08
                  db   08, 08, 08, 08, 08, 08, 08, 08
;;EXTRA
valor1                       db     2 dup (0),'$'
valor2                       db     2 dup (0),'$'
buffer_linea                 db     0ff dup (0)
tam_liena_leida              db     00
estado                       db     00

;; Tokens
tk_pared                    db     05, "pared"
tk_jugador                  db     07, "jugador"
tk_caja                     db     04, "caja"
tk_objetivo                 db     08, "objetivo"
tk_suelo                    db     05, "suelo"

hola_mundo                  db     "Hola mundo","$"
ln  					  	db    	0d,0a,"$"

;Menu principal
iniciar_juego db "INICIAR JUEGO","$"
cargar_nivel  db "CARGAR NIVEL","$"
configuracion db "CONFIGURACION","$"
puntajes      db "PUNTAJES ALTOS","$"
salir         db "SALIR$"
iniciales     db "Angel Aragon - 201901055","$"
opcion        db 0
maximo        db 0
xFlecha       dw 0
yFlecha       dw 0

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
;; MODO VIDEO ;;
    mov AH, 00
    mov AL, 13
    int 10
    jmp menu_principal
    ;jmp leer_nivel_1
    jmp fin

menu_principal:
    call clear_pantalla
    mov AL, 0
    mov [opcion], AL      ;; reinicio de la variable de salida
    mov AL, 5
    mov [maximo], AL
    mov AX, 50
    mov BX, 28
    mov [xFlecha], AX
    mov [yFlecha], BX
    ;; IMPRIMIR OPCIONES ;;
    ;;;; INICIAR JUEGO
    mov DL, 0c
    mov DH, 05
    mov BH, 00
    mov AH, 02
    int 10
    ;; <<-- posicionar el cursor
    push DX
    mov DX, offset iniciar_juego
    mov AH, 09
    int 21
    pop DX
    ;;
    ;;;; CARGAR NIVEL
    add DH, 02
    mov BH, 00
    mov AH, 02
    int 10
    push DX
    mov DX, offset cargar_nivel
    mov AH, 09
    int 21
    pop DX
    ;;
    ;;;; PUNTAJES ALTOS
    add DH, 02
    mov BH, 00
    mov AH, 02
    int 10
    push DX
    mov DX, offset puntajes
    mov AH, 09
    int 21
    pop DX
    ;;
    ;;;; CONFIGURACION
    add DH, 02
    mov BH, 00
    mov AH, 02
    int 10
    push DX
    mov DX, offset configuracion
    mov AH, 09
    int 21
    pop DX
    ;;
    ;;;; SALIR
    add DH, 02
    mov BH, 00
    mov AH, 02
    int 10
    push DX
    mov DX, offset salir
    mov AH, 09
    int 21
    pop DX
    ;;
    ;;;; FLECHA
    call pintar_flecha
    ;;MOVERSE PARA ELEGIR OP
entrada_menu_principal:
		mov AH, 00
		int 16
		cmp AH, 48
		je restar_opcion_menu_principal
		cmp AH, 50
		je sumar_opcion_menu_principal
		cmp AH, 3b  ;; le doy F1
		je fin_menu_principal
		jmp entrada_menu_principal
restar_opcion_menu_principal:
		mov AL, [opcion]
		dec AL
		cmp AL, 0ff
		je volver_a_cero
		mov [opcion], AL
		jmp mover_flecha_menu_principal
sumar_opcion_menu_principal:
		mov AL, [opcion]
		mov AH, [maximo]
		inc AL
		cmp AL, AH
		je volver_a_maximo
		mov [opcion], AL
		jmp mover_flecha_menu_principal
volver_a_cero:
		mov AL, 0
		mov [opcion], AL
		jmp mover_flecha_menu_principal
volver_a_maximo:
		mov AL, [maximo]
		dec AL
		mov [opcion], AL
		jmp mover_flecha_menu_principal
mover_flecha_menu_principal:
		mov AX, [xFlecha]
		mov BX, [yFlecha]
		mov SI, offset dim_sprite_vacio
		mov DI, offset data_sprite_vacio
		call pintar_sprite
		mov AX, 50
		mov BX, 28
		mov CL, [opcion]
ciclo_ubicar_flecha_menu_principal:
		cmp CL, 0
		je pintar_flecha_menu_principal
		dec CL
		add BX, 10
		jmp ciclo_ubicar_flecha_menu_principal
pintar_flecha_menu_principal:
		mov [xFlecha], AX
		mov [yFlecha], BX
		call pintar_flecha
		jmp entrada_menu_principal
;;Ir a la opcion elegida
fin_menu_principal:
		mov AL, [opcion]
        cmp AL, 4
        je fin
        jmp menu_principal


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
    mov AL, 04
    cmp [estado], AL   ;; veficar si es objetivo
    je verificar_cadena_suelo
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

verificar_cadena_suelo:
    cmp CX, 0000
    je intentar_de_nuevo ;retorno_fallido
    mov CH, 00
    mov CL, [tk_suelo]
    mov SI, offset tk_suelo
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

;; pintar_pixel - pintar un pixel
;; ENTRADA:
;;     AX --> x pixel
;;     BX --> y pixel
;;     CL --> color
;; SALIDA: pintar pixel
;; AX + 320*BX
pintar_pixel:
    push AX
    push BX
    push CX
    push DX
    push DI
    push SI
    push DS
    mov DX, 0a000
    mov DS, DX
    ;; (
    ;; 	posicionarse en X
    mov SI, AX
    mov AX, 140
    mul BX
    add AX, SI
    mov DI, AX
    ;;
    mov [DI], CL  ;; pintar
    ;; )
    pop DS
    pop SI
    pop DI
    pop DX
    pop CX
    pop BX
    pop AX
    ret

;; pintar_sprite - pinta un sprite
;; Entrada:
;;    - DI: offset del sprite
;;    - SI: offset de las dimensiones
;;    - AX: x sprite 320x200
;;    - BX: y sprite 320x200
pintar_sprite:
    push DI
    push SI
    push AX
    push BX
    push CX
    inc SI
    mov DH, [SI]  ;; vertical
    dec SI        ;; dirección de tam horizontal
    ;;
inicio_pintar_fila:
    cmp DH, 00
    je fin_pintar_sprite
    push AX
    mov DL, [SI]
pintar_fila:
    cmp DL, 00
    je pintar_siguiente_fila
    mov CL, [DI]
    call pintar_pixel
    inc AX
    inc DI
    dec DL
    jmp pintar_fila
pintar_siguiente_fila:
    pop AX
    inc BX
    dec DH
    jmp inicio_pintar_fila
fin_pintar_sprite:
    pop CX
    pop BX
    pop AX
    pop SI
    pop DI
    ret

;; pintar_flecha - pinta una flecha
pintar_flecha:
    mov AX, [xFlecha]
    mov BX, [yFlecha]
    mov SI, offset dim_sprite_flcha
    mov DI, offset data_sprite_flcha
    call pintar_sprite
    ret

;;Mira si 2 cadenas son iguales
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

;;limpia un buffer
limpiar:
ciclo_limpiar:
	mov AL, 00
	mov [DI], AL
	inc DI
	loop ciclo_limpiar
	ret

;;limpia la pantalla
clear_pantalla:
		mov CX, 19  ;; 25
		mov BX, 00
clear_v:
		push CX
		mov CX, 28  ;; 40
		mov AX, 00
clear_h:
		mov SI, offset dim_sprite_vacio
		mov DI, offset data_sprite_vacio
		call pintar_sprite
		add AX, 08
		loop clear_h
		add BX, 08
		pop CX
		loop clear_v
		ret


;-------------------------------------FIN---------------------------------------------------
fin:
.EXIT
END