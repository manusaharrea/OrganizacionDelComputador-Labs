/*
	Em este archivo se encuentran las funciones que se encargan de dibujar las figuras en pantalla.
 */

.ifndef shapes_s
.equ shapes_s, 0 // 0 = false, 1 = true
.equ UPDATE, 65000 // 65000 = 1 segundo aproximadamente

.include "data.s"

/*
  Funcion Rectangle: Dibuja un cudrado de ancho y alto asignado en las posiciones (x,y).
  Registros predefinidos: x1: X, x2: Y, x3: Width, x4: Height, x10: Color
  Registros seteados: x5:Pixel, x6.

*/
rectangle: 
rectangle_draw_row: //x5 = x20 +  4*[X + (Y*640)]
	mov x5, SCREEN_WIDTH
	mul x5, x2, x5
	add x5, x5, x1
	lsl x5, x5, #2
	add x5, x5, x20
	mov x6, x3
rectangle_draw_col:
		stur w10, [x5]
		add x5, x5, #4
		sub x6, x6, #1
		cbnz x6, rectangle_draw_col
	add x2, x2, #1
	sub x4, x4, #1
	cbnz x4, rectangle_draw_row

	ret

/* 
	Funcion Circle: Dibuja un circulo de radio asignado en las posiciones (x,y).
  	Registros predefinidos: x1: X, x2: Y, x3: R, x10: Color
  	Registros seteados: x4: i, x5: j, x6: Pixel, x7: (i-y)^2, x9: R^2, x11: y+R, x12: x+R, x13: (j-x)^2
 */
circle:
		
	//Top left coords
	sub x4, x1, x3 	//i = y-R
	sub x5, x2, x3 	//j	= x-R

	//Bottom right coords
	add x11, x1, x3 	//x11 = y+R
	add x12, x2, x3 	//x12 = x+R	

circle_next_row:		//x0 = x20 +  4*[X + (Y*640)]
	sub x5, x2, x3
	mov x6, SCREEN_WIDTH
	mul x6, x6, x4
	add x6, x6, x5
	lsl x6, x6, #2
	add x0, x20, x6


circle_draw_row:		//IF (i-y)^2 + (j-x)^2 <= R^2	 THEN	draw_pixel(j,i)
	sub x7, x4, x1		//x7 = i - y
	mul x7, x7, x7		//x7 = (i-y)^2
	sub x13, x5, x2 	//x13 = j - x
	mul x13, x13, x13	//x13 = (j-x)^2
	add x7, x7, x13		//x7 = (i-y)^2 + (j-x)^2 
	mul x9, x3, x3		//x9 = R^2
	
	cmp x5, x12
	b.gt cir_continue_next_row

	cmp x7, x9
	b.gt cir_next_pixel
	
	stur w10, [x0]		//Draw actual pixel
	
	b cir_next_pixel

cir_continue_next_row:
	add x4, x4, #1
	cmp x4, x11
	b.le circle_next_row
	ret

cir_next_pixel:
	add x5, x5, #1		//x5 = j + 1		
	add x0, x0, #4		//fb next pixel
	b circle_draw_row



/*
	Funcion delay : esta funcion se encarga de hacer un delay para que se pueda ver el dibujo en pantalla.
	Registros predefinidos: x23: UPDATE
	Registros seteados: x23
 */ 
delay:
    mov x23, UPDATE
delay_loop:
    sub x23, x23, 1
    cbnz x23, delay_loop
    ret x30

.endif
