NADA                equ      00
JUGADOR             equ      01
PARED               equ      02
CAJA                equ      03
OBJETIVO            equ      04
SUELO               equ      05
CAJA_OBJETIVO       equ      06
JUGADOR_OBJETIVO    equ      07
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
data_sprite_pared db   02, 02, 02, 78, 02, 02, 02, 78
                  db   02, 02, 02, 02, 02, 02, 02, 02
                  db   02, 02, 02, 02, 02, 02, 02, 02
                  db   02, 02, 02, 02, 02, 02, 02, 02
                  db   02, 02, 02, 02, 02, 02, 02, 78
                  db   06, 06, 06, 75, 06, 06, 06, 75
                  db   06, 06, 06, 78, 06, 06, 06, 78
                  db   06, 06, 06, 75, 06, 06, 06, 75
;;JUGADOR
dim_sprite_jug  db   08, 08
data_sprite_jug   db   75, 08, 03, 44, 44, 78, 75, 78
                  db   03, 08, 44, 58, 58, 44, 78, 75
                  db   03, 08, 44, 58, 58, 78, 75, 78
                  db   78, 08, 58, 58, 58, 75, 78, 75
                  db   11, 11, 11, 03, 03, 78, 08, 78
                  db   78, 58, 00, 43, 00, 03, 08, 75
                  db   75, 78, 03, 03, 03, 78, 08, 78
                  db   78, 75, 06, 75, 06, 75, 78, 75
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
data_sprite_caja  db   06, 06, 06, 06, 06, 06, 06, 06
                  db   06, 06, 42, 42, 42, 42, 06, 06
                  db   06, 42, 06, 42, 42, 06, 42, 06
                  db   06, 42, 42, 06, 06, 42, 42, 06
                  db   06, 42, 42, 06, 06, 42, 42, 06
                  db   06, 42, 06, 42, 42, 06, 42, 06
                  db   06, 06, 42, 42, 42, 42, 06, 06
                  db   06, 06, 06, 06, 06, 06, 06, 06
;data_sprite_caja  db   75, 78, 75, 78, 75, 78, 2c, 78
;                  db   78, 7f, 7f, 7f, 78, 06, 29, 2c
;                  db   7f, 7f, 7f, 7f, 06, 06, 2c, 78
;                  db   7f, 7f, 7f, 7f, 7f, 75, 78, 75
;                  db   7f, 7f, 7f, 7f, 7f, 78, 75, 78
;                 db   7f, 7f, 7f, 7f, 7f, 75, 78, 75
;                  db   7f, 7f, 7f, 7f, 7f, 78, 75, 78
;                  db   78, 7f, 7f, 7f, 78, 75, 78, 75

;;CAJA_EN_OBJETIVO
dim_sprite_caja_obj  db   08, 08
data_sprite_caja_obj    db   0e, 0e, 0e, 0e, 0e, 0e, 0e, 0e
                        db   0e, 0e, 5c, 5c, 5c, 5c, 0e, 0e
                        db   0e, 5c, 0e, 5c, 5c, 0e, 5c, 0e
                        db   0e, 5c, 5c, 0e, 0e, 5c, 5c, 0e
                        db   0e, 5c, 5c, 0e, 0e, 5c, 5c, 0e
                        db   0e, 5c, 0e, 5c, 5c, 0e, 5c, 0e
                        db   0e, 0e, 5c, 5c, 5c, 5c, 0e, 0e
                        db   0e, 0e, 0e, 0e, 0e, 0e, 0e, 0e
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
;;MAPA
mapa              db   3e8 dup (0)
;;EXTRA
numero 						db	 	 5 dup (30)
valor1                       db     5 dup (0)
num_valor1                   db      00
valor2                       db     5 dup (0)
num_valor2                   db      00
buffer_linea                 db     0ff dup (0)
archivo_x                    db     0ff dup (0)
tam_liena_leida              db     00
estado                       db     00

;; Tokens
tk_pared                    db     05, "pared"
tk_jugador                  db     07, "jugador"
tk_caja                     db     04, "caja"
tk_objetivo                 db     08, "objetivo"
tk_suelo                    db     05, "suelo"
ln  					  	db    	0d,0a,"$"

;Menu principal
m_usac	        db	'USAC','$'
m_facultad      db  'Facultad de ingenieria','$'
m_escuela       db  'Escuela de vacaciones' ,'$'
m_curso         db  'Arqui 1','$'
m_nombre        db  'Angel Geovany Aragon Perez ','$'
m_carnet        db  '201901055','$'
m_continuar     db  'PRESIONE [F1] PARA CONTINUAR','$'
m_abajo         db  'Abajo: ','$'
m_arriba        db  'Arriba: ','$'
m_derecha       db  'Derecha: ','$'
m_izquierda     db  'Izquierda: ','$'
iniciar_juego   db "INICIAR JUEGO","$"
cargar_nivel    db "CARGAR NIVEL","$"
configuracion   db "CONFIGURACION","$"
puntajes        db "PUNTAJES ALTOS","$"
salir           db "SALIR$"
m_controles     db "CONTROLES ACTUALES","$"

m_regresar      db "REGRESAR",'$'
iniciales       db "Angel Aragon - 201901055","$"
m_pedir_arch    db "Ingrese el Nombre del archivo a cargar",'$'
opcion          db 0
maximo          db 0
xFlecha         dw 0
yFlecha         dw 0

;juego
xJugador      db 3
yJugador      db 3
;controles
m_control_arriba        db 1e,'$'
m_control_abajo         db 1f,'$'
m_control_izquierda     db 11,'$'
m_control_derecha       db 10,'$'
control_arriba    db  48
control_abajo     db  50
control_izquierda db  4b
control_derecha   db  4d

;;nivel 1 
archivo_nivel1              db     "NIV.00", 00
handle_nivel1               dw     0000
handle_x                     dw     0000


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
    jmp pantalla_inicial
    jmp fin

pantalla_inicial:
    call clear_pantalla
    ;; IMPRIMIR MENSAJE INICIAL ;;
    mov DL, 05
    mov DH, 02
    mov BH, 00
    mov AH, 02
    int 10
    push DX
    mov DX, offset m_usac
    mov AH, 09
    int 21
    pop DX
    mov DL, 05
    mov DH, 04
    mov BH, 00
    mov AH, 02
    int 10
    push DX
    mov DX, offset m_facultad
    mov AH, 09
    int 21
    pop DX
    mov DL, 05
    mov DH, 06
    mov BH, 00
    mov AH, 02
    int 10
    push DX
    mov DX, offset m_escuela
    mov AH, 09
    int 21
    pop DX
    mov DL, 05
    mov DH, 08
    mov BH, 00
    mov AH, 02
    int 10
    push DX
    mov DX, offset m_curso
    mov AH, 09
    int 21
    pop DX
    mov DL, 05
    mov DH, 0c
    mov BH, 00
    mov AH, 02
    int 10
    push DX
    mov DX, offset m_nombre
    mov AH, 09
    int 21
    pop DX
    mov DL, 05
    mov DH, 0e
    mov BH, 00
    mov AH, 02
    int 10
    push DX
    mov DX, offset m_carnet
    mov AH, 09
    int 21
    pop DX
    mov DL, 05
    mov DH, 12
    mov BH, 00
    mov AH, 02
    int 10
    push DX
    mov DX, offset m_continuar
    mov AH, 09
    int 21
    pop DX
    mov AH, 00
    int 16
    cmp AH, 3b
    je menu_principal
    jmp pantalla_inicial

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
    mov AL, [opcion] ;;inicio juego
    cmp AL, 0
    je inicio_juego
    mov AL, [opcion] ;;CARGAR
    cmp AL, 1
    je leer_nivel_x
    mov AL, [opcion] ;;CARGAR
    cmp AL, 3
    je menu_configuracion
    mov AL, [opcion] ;;salida
    cmp AL, 4
    je fin
    jmp menu_principal

menu_configuracion:
    call clear_pantalla
    mov AL, 0
    mov [opcion], AL      ;; reinicio de la variable de salida
    mov AL, 5
    mov [maximo], AL
    mov AX, 15
    mov BX, 28
    mov [xFlecha], AX
    mov [yFlecha], BX
    ;; IMPRIMIR OPCIONES ;;
    ;;CONTROLES
    mov DL, 05
    mov DH, 02
    mov BH, 00
    mov AH, 02
    int 10
    push DX
    mov DX, offset m_controles
    mov AH, 09
    int 21
    pop DX
    ;;abajo
    mov DL, 05
    mov DH, 05
    mov BH, 00
    mov AH, 02
    int 10
    push DX
    mov DX, offset m_abajo
    mov AH, 09
    int 21
    pop DX
    ;;tecla actual abajo
    mov DL, 15
    mov DH, 05
    mov BH, 00
    mov AH, 02
    int 10
    push DX
    mov DX, offset m_control_abajo
    mov AH, 09
    int 21
    pop DX
    ;;arriba
    mov DL, 05
    mov DH, 07
    mov BH, 00
    mov AH, 02
    int 10
    push DX
    mov DX, offset m_arriba
    mov AH, 09
    int 21
    pop DX
    ;;tecla actual arriba
    mov DL, 15
    mov DH, 07
    mov BH, 00
    mov AH, 02
    int 10
    push DX
    mov DX, offset m_control_arriba
    mov AH, 09
    int 21
    pop DX
    ;;derecha
    mov DL, 05
    mov DH, 09
    mov BH, 00
    mov AH, 02
    int 10
    push DX
    mov DX, offset m_derecha
    mov AH, 09
    int 21
    pop DX
    ;;tecla actual derecha
    mov DL, 15
    mov DH, 09
    mov BH, 00
    mov AH, 02
    int 10
    push DX
    mov DX, offset m_control_derecha
    mov AH, 09
    int 21
    pop DX
    ;;izquierda
    mov DL, 05
    mov DH, 0b
    mov BH, 00
    mov AH, 02
    int 10
    push DX
    mov DX, offset m_izquierda
    mov AH, 09
    int 21
    pop DX
    ;;tecla actual izquierda
    mov DL, 15
    mov DH, 0b
    mov BH, 00
    mov AH, 02
    int 10
    push DX
    mov DX, offset m_control_izquierda
    mov AH, 09
    int 21
    pop DX
    ;;regresar
    mov DL, 05
    mov DH, 0d
    mov BH, 00
    mov AH, 02
    int 10
    push DX
    mov DX, offset m_regresar
    mov AH, 09
    int 21
    pop DX
    ;; hacer la flecha
    call pintar_flecha
    ;;moverse para elegir op 
    entrada_menu_conf:
        mov AH, 00
        int 16
        cmp AH, 48
        je restar_opcion_menu_conf
        cmp AH, 50
        je sumar_opcion_menu_conf
        cmp AH, 3b  ;; le doy F1
        je fin_menu_conf
        jmp entrada_menu_conf
    restar_opcion_menu_conf:
		mov AL, [opcion]
		dec AL
		cmp AL, 0ff
		je volver_a_cero_conf
		mov [opcion], AL
		jmp mover_flecha_menu_conf
    sumar_opcion_menu_conf:
		mov AL, [opcion]
		mov AH, [maximo]
		inc AL
		cmp AL, AH
		je volver_a_maximo_conf
		mov [opcion], AL
		jmp mover_flecha_menu_conf
    volver_a_cero_conf:
		mov AL, 0
		mov [opcion], AL
		jmp mover_flecha_menu_conf
    volver_a_maximo_conf:
		mov AL, [maximo]
		dec AL
		mov [opcion], AL
		jmp mover_flecha_menu_conf
    mover_flecha_menu_conf:
		mov AX, [xFlecha]
		mov BX, [yFlecha]
		mov SI, offset dim_sprite_vacio
		mov DI, offset data_sprite_vacio
		call pintar_sprite
		mov AX, 15
		mov BX, 28
		mov CL, [opcion]
    ciclo_ubicar_flecha_menu_conf:
		cmp CL, 0
		je pintar_flecha_menu_conf
		dec CL
		add BX, 10
		jmp ciclo_ubicar_flecha_menu_conf
    pintar_flecha_menu_conf:
		mov [xFlecha], AX
		mov [yFlecha], BX
		call pintar_flecha
		jmp entrada_menu_conf
    fin_menu_conf:
    mov AL, [opcion] ;;ABAJO
    cmp AL, 0
    je pedir_control_abajo
    mov AL, [opcion] ;;ARRIBA
    cmp AL, 1
    je pedir_control_arriba
    mov AL, [opcion] ;;DERECHA
    cmp AL, 2
    je pedir_control_derecha
    mov AL, [opcion] ;;IZQUIERDA
    cmp AL, 3
    je pedir_control_izquierda
    mov AL, [opcion] ;;REGRESAR
    cmp AL, 4
    je menu_principal
    jmp menu_configuracion

 pedir_control_abajo:
    mov AH,00
    int 16
    mov control_abajo, AH
    mov m_control_abajo, AL
    jmp menu_configuracion
pedir_control_arriba:
    mov AH,00
    int 16
    mov control_arriba, AH
    mov m_control_arriba, AL
    jmp menu_configuracion
pedir_control_derecha:
    mov AH,00
    int 16
    mov control_derecha, AH
    mov m_control_derecha, AL
    jmp menu_configuracion
pedir_control_izquierda:
    mov AH,00
    int 16
    mov control_izquierda, AH
    mov m_control_izquierda, AL
    jmp menu_configuracion

inicio_juego:
    call clear_pantalla
    mov AX, 01
    call leer_nivel_x
    ciclo_juego:
        call colocar_iniciales
        call pintar_mapa
        call entrada_juego
        jmp ciclo_juego
    jmp fin

colocar_iniciales:
    mov DL, 00
    mov DH, 18
    mov BH, 00
    mov AH, 02
    int 10
    
    mov DX, offset iniciales
    mov AH, 09
    int 21
    ret

;;AX = OP, 01=NIV1 00=NIVX
leer_nivel_x:
    cmp AX, 00
    je leer_nvlx
    cmp AX, 01
    je leer_nvl1
    call clear_pantalla
    leer_nvlx:
        ;;pedir el nombre del archivo
        mov DL, 00
        mov DH, 03
        mov BH, 00
        mov AH, 02
        int 10
        push DX
        mov DX, offset m_pedir_arch
        mov AH, 09
        int 21
        pop DX
        mov DX, offset archivo_nivel1 
        mov AH, 0a
        int 21
        jmp seguir_leer
    leer_nvl1:
        ;; abrir archivo de nvl1
        mov AH, 3d
        mov AL, 00
        mov DX, offset archivo_nivel1
        int 21
        mov [handle_nivel1], AX
        jmp seguir_leer
    seguir_leer:
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
		    je retorno_nvl
            cmp CX, 0000
            je retorno_nvl ;;regresar al menu
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
    je intentar_de_nuevo
    mov AL, 02
    cmp [estado], AL   ;; verificar si es pared
    je verificar_cadena_pared
    mov AL, 01
    cmp [estado], AL   ;; verificar si es jugador
    je verificar_cadena_jugador
    mov AL, 03
    cmp [estado], AL   ;; veficar si es caja
    je verificar_cadena_caja
    mov AL, 04
    cmp [estado], AL   ;; veficar si es objetivo
    je verificar_cadena_objetivo
    mov AL, 05
    cmp [estado], AL   ;; veficar si es objetivo
    je verificar_cadena_suelo
    ret
    ;jmp fin ;;linea hecha 

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
        ;print ln
        ;print valor1
        ;print ln
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
        ;print valor2
        ;print ln
        call colocarlo_mapa
        jmp ciclo_lineaXlinea

colocarlo_mapa:
    ;convierto en numero la coordenada2
    mov DI, offset valor1
    call cadena_numero
    mov [num_valor1], AL  ;;guardo el numero
    ;convierto en numero la coordenada2
    mov DI, offset valor2
    call cadena_numero
    mov [num_valor2], AL  ;;guardo el numero
    
    ;guardo el posicionamiento inicial del jugador
    mov AL, 01
    cmp [estado], AL   ;; verificar si es jugador
    jne seguir_colocarlo_mapa
    mov AH, [num_valor1]
    mov AL, [num_valor2]
    mov [xJugador], AH
    mov [yJugador], AL
    seguir_colocarlo_mapa:
    ;guardo objeto
    mov DL, estado       ;que objeto
    mov AH, num_valor1       ;x
    mov AL, num_valor2       ;y
    ;coloco objeto en el mapa
    call colocar_en_mapa
    ret
intentar_de_nuevo:
    mov AL, [estado]
    inc AL
    mov [estado], AL
    jmp fin_leer_linea

retorno_nvl:
    ret
    

;-------------------------------------SUBRUTINAS---------------------------------------------------

;;cadena a numero
;; ENTRADA: DI -> dirección a una cadena numérica
;; SALIDA: AX -> número convertido
cadena_numero:
		mov AL, 00    ; inicializar la salida
		mov CX, 0002    ; inicializar contador
		;;
seguir_convirtiendo:
		mov BL, [DI]
		cmp BL, 00
		je retorno_cadenaAnum
		sub BL, 30      ; BL es el valor numérico del caracter
		mov DL, 000a	; 10
		mul DL          ; AX * DX -> DX:AX
		mov BH, 00
		add AL, BL
		inc DI          ; puntero en la cadena
		loop seguir_convirtiendo
retorno_cadenaAnum:
		ret


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

;; adaptar_coordenada - 40x25->320x200
;; ENTRADA:
;;    AH -> x 40x25
;;    AL -> y 40x25
;; SALIDA:
;;    AX -> x 320x200
;;    BX -> y 320x200
adaptar_coordenada:
    mov DL, 08
    mov CX, AX
    mul DL
    mov BX, AX

    mov AL, CH
    mul DL
    ret
		
;; colocar_en_mapa - coloca un elemento en el mapa
;; ENTRADA:
;;    - DL -> código numérico del elemento
;;    - AH -> x
;;    - AL -> y
;; ...
colocar_en_mapa:
    mov CX, AX     ;;;   AH -> x -> CH
    mov BL, 28
    mul BL   ;; AL * BL  = AX
    mov CL, CH
    mov CH, 00     ;;; CX el valor de X completo
    add AX, CX
    mov DI, offset mapa
    add DI, AX
    mov [DI], DL
    ret


;; obtener_de_mapa - obtiene un elemento en el mapa
;; ENTRADA:
;;    - AH -> x
;;    - AL -> y
;; SALIDA:
;;    - DL -> código numérico del elemento
obtener_de_mapa:
    mov CX, AX
    mov BL, 28
    mul BL
    mov CL, CH
    mov CH, 00
    add AX, CX
    mov DI, offset mapa
    add DI, AX
    mov DL, [DI]
    ret


;; pintar_mapa - pinta los elementos del mapa
;; ENTRADA:
;; SALIDA:
pintar_mapa:
		mov AL, 00   ;; fila
ciclo_v:
    cmp AL, 19
    je fin_pintar_mapa
    mov AH, 00   ;; columna
ciclo_h:
    cmp AH, 28
    je continuar_v
    push AX
    call obtener_de_mapa
    pop AX
    cmp DL, NADA
    je pintar_vacio_mapa
    cmp DL, JUGADOR
    je pintar_jugador_mapa
    cmp DL, PARED
    je pintar_pared_mapa
    cmp DL, CAJA
    je pintar_caja_mapa
    cmp DL, OBJETIVO
    je pintar_objetivo_mapa
    cmp DL, SUELO
    je pintar_suelo_mapa
    cmp DL, CAJA_OBJETIVO
    je pintar_caja_obj_mapa
    cmp DL, JUGADOR_OBJETIVO
    je pintar_jugador_obj_mapa
    jmp continuar_h
pintar_vacio_mapa:
    push AX
    call adaptar_coordenada
    mov SI, offset dim_sprite_vacio
    mov DI, offset data_sprite_vacio
    call pintar_sprite
    pop AX
    jmp continuar_h
pintar_suelo_mapa:
    push AX
    call adaptar_coordenada
    mov SI, offset dim_sprite_suelo
    mov DI, offset data_sprite_suelo
    call pintar_sprite
    pop AX
    jmp continuar_h
pintar_jugador_mapa:
    push AX
    call adaptar_coordenada
    mov SI, offset dim_sprite_jug
    mov DI, offset data_sprite_jug
    call pintar_sprite
    pop AX
    jmp continuar_h
pintar_jugador_obj_mapa:
    push AX
    call adaptar_coordenada
    mov SI, offset dim_sprite_jug
    mov DI, offset data_sprite_jug
    call pintar_sprite
    pop AX
    jmp continuar_h
pintar_pared_mapa:
    push AX
    call adaptar_coordenada
    mov SI, offset dim_sprite_pared
    mov DI, offset data_sprite_pared
    call pintar_sprite
    pop AX
    jmp continuar_h
pintar_caja_mapa:
    push AX
    call adaptar_coordenada
    mov SI, offset dim_sprite_caja
    mov DI, offset data_sprite_caja
    call pintar_sprite
    pop AX
    jmp continuar_h
pintar_caja_obj_mapa:
    push AX
    call adaptar_coordenada
    mov SI, offset dim_sprite_caja_obj
    mov DI, offset data_sprite_caja_obj
    call pintar_sprite
    pop AX
    jmp continuar_h
pintar_objetivo_mapa:
    push AX
    call adaptar_coordenada
    mov SI, offset dim_sprite_obj
    mov DI, offset data_sprite_obj
    call pintar_sprite
    pop AX
    jmp continuar_h
continuar_h:
    inc AH
    jmp ciclo_h
continuar_v:
    inc AL
    jmp ciclo_v
fin_pintar_mapa:
    ret

;; entrada_juego - manejo de las entradas del juego
entrada_juego:
    mov AH, 01
    int 16
    jz fin_entrada_juego  ;; nada en el buffer de entrada
    mov AH, 00
    int 16  
    cmp AH, 3c ; F2
    je menu_principal ;; este es el pausa
    ;; AH <- scan code
    cmp AH, [control_arriba]
    je mover_jugador_arr
    cmp AH, [control_abajo]
    je mover_jugador_aba
    cmp AH, [control_izquierda]
    je mover_jugador_izq
    cmp AH, [control_derecha]
    je mover_jugador_der
    cmp AH, 3c
    ret
mover_jugador_arr:
    mov AH, [xJugador]
    mov AL, [yJugador]
    dec AL
    push AX
    call obtener_de_mapa
    pop AX
    ;; DL <- elemento en mapa
    cmp DL, PARED
    je hay_pared_arriba
    ;;Verifico que la siguinete posucion esta libre para mover la caja si no no la mueve
    cmp DL, CAJA
    jne no_mover_caja_arriba
    push AX
    dec AL
    push AX
    call obtener_de_mapa
    pop AX
    pop AX
    cmp DL, CAJA
    je hay_pared_arriba
    cmp DL, PARED
    je hay_pared_arriba
    ;cmp DL, OBJETIVO
    ;jne no_converitr_amarrilla_caja_arriba
    
    ;mov DL, CAJA_OBJETIVO
    ;push AX
    ;dec AL
    ;call colocar_en_mapa
    ;pop AX
    ;jmp no_mover_caja_arriba
    ;no_converitr_amarrilla_caja_arriba:
    
    ;;muve la caja para arriba
    mov DL, CAJA
    push AX
    dec AL
    call colocar_en_mapa
    pop AX
    no_mover_caja_arriba:
    mov [yJugador], AL
    mov DL, JUGADOR
    push AX
    call colocar_en_mapa
    pop AX

    mov DL, SUELO
    inc AL
    call colocar_en_mapa
    
    ret
hay_pared_arriba:
    ret


mover_jugador_aba:
    mov AH, [xJugador]
    mov AL, [yJugador]
    inc AL
    push AX
    call obtener_de_mapa
    pop AX
    ;; DL <- elemento en mapa
    cmp DL, PARED
    je hay_pared_abajo

    ;;Verifico que la siguinete posucion esta libre para mover la caja si no no la mueve
    cmp DL, CAJA
    jne no_mover_caja_abajo
    push AX
    inc AL
    push AX
    call obtener_de_mapa
    pop AX
    pop AX
    cmp DL, CAJA
    je hay_pared_abajo
    cmp DL, PARED
    je hay_pared_abajo
    ;cmp DL, OBJETIVO
    ;jne no_converitr_amarrilla_caja_abajo
    
    ;mov DL, CAJA_OBJETIVO
    ;push AX
    ;inc AL
    ;call colocar_en_mapa
    ;pop AX
    ;jmp no_mover_caja_abajo
    ;no_converitr_amarrilla_caja_abajo:
    
    ;;muve la caja para abajo
    mov DL, CAJA
    push AX
    inc AL
    call colocar_en_mapa
    pop AX
    no_mover_caja_abajo:
    mov [yJugador], AL
    mov DL, JUGADOR
    push AX
    call colocar_en_mapa
    pop AX
    ;;si hay un objetivo el jugador se vuelve jugador_objetivo
    ;push AX
    ;call obtener_de_mapa
    ;pop AX
    ;cmp DL, OBJETIVO
    ;jne no_es_obj_abajo
    ;mov [yJugador], AL
    ;mov DL, JUGADOR_OBJETIVO
    ;push AX
    ;call colocar_en_mapa
    ;pop AX
    ;no_es_obj_abajo:
    ;; ver si es jugador objetivo
    ;push AX
    ;call obtener_de_mapa
    ;pop AX
    ;cmp DL, JUGADOR_OBJETIVO
    ;jne no_es_jug_obj_abajo
    ;mov DL, OBJETIVO
    ;dec AL
    ;call colocar_en_mapa
    ;ret
    no_es_jug_obj_abajo:
    mov DL, SUELO
    dec AL
    call colocar_en_mapa
    ret
hay_pared_abajo:
    ret

mover_jugador_izq:
    mov AH, [xJugador]
    mov AL, [yJugador]
    dec AH
    push AX
    call obtener_de_mapa
    pop AX
    ;;;;;;;;;;;; PARED
    cmp DL, PARED
    je hay_pared_izquierda 
    
    
    ;;;;;;;;;;;; CAJA
    ;;Verifico que la siguinete posucion esta libre para mover la caja si no no la mueve
    cmp DL, CAJA
    jne no_mover_caja_izquierda
    push AX
    dec AH
    push AX
    call obtener_de_mapa
    pop AX
    pop AX
    cmp DL, CAJA
    je hay_pared_izquierda
    cmp DL, PARED
    je hay_pared_izquierda
    ;cmp DL, OBJETIVO
    ;jne no_converitr_amarrilla_caja_izq
    
    ;mov DL, CAJA_OBJETIVO
    ;push AX
    ;dec AH
    ;call colocar_en_mapa
    ;pop AX
    ;jmp no_mover_caja_izquierda
    ;no_converitr_amarrilla_caja_izq:

    ;;muve la caja para izquierda
    mov DL, CAJA
    push AX
    dec AH
    call colocar_en_mapa
    pop AX
    no_mover_caja_izquierda:
    mov [xJugador], AH
    mov DL, JUGADOR
    push AX
    call colocar_en_mapa
    pop AX

    

    mov DL, SUELO
    inc AH
    call colocar_en_mapa
    ret
hay_pared_izquierda:
    ret
mover_jugador_der:
    mov AH, [xJugador]
    mov AL, [yJugador]
    inc AH
    push AX
    call obtener_de_mapa
    pop AX
    ;; DL <- elemento en mapa
    cmp DL, PARED
    je hay_pared_derecha
    
    ;;Verifico que la siguinete posucion esta libre para mover la caja si no no la mueve
    cmp DL, CAJA
    jne no_mover_caja_derecha
    push AX
    inc AH
    push AX
    call obtener_de_mapa
    pop AX
    pop AX
    cmp DL, CAJA
    je hay_pared_derecha
    cmp DL, PARED
    je hay_pared_derecha
    ;cmp DL, OBJETIVO
    ;jne no_converitr_amarrilla_caja_der
    
    ;mov DL, CAJA_OBJETIVO
    ;push AX
    ;inc AH
    ;call colocar_en_mapa
    ;pop AX
    ;jmp no_mover_caja_derecha
    ;no_converitr_amarrilla_caja_der:
    
    ;;muve la caja para derecha
    mov DL, CAJA
    push AX
    inc AH
    call colocar_en_mapa
    pop AX
    no_mover_caja_derecha:
    mov [xJugador], AH
    mov DL, JUGADOR
    push AX
    call colocar_en_mapa
    pop AX
    
    mov DL, SUELO
    dec AH
    call colocar_en_mapa
    ret
hay_pared_derecha:
    ret
fin_entrada_juego:
    ret

;-------------------------------------FIN---------------------------------------------------
fin:
.EXIT
END