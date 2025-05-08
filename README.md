# OrganizacionDelComputador-Labs
##Ejercicio 1
Escribir un programa en assembler ARMv8 sobre el código de ejemplo dado, que genere
una imagen diseñada por el grupo. Luego, utilizar al menos una de las teclas disponibles
para cambiar alguna característica de la imagen (agregar o mover alguna figura, cambiar un
color, cambiar alguna forma, etc.). Por ejemplo: al iniciar se pinta un paisaje de día en
pantalla y al presionar la tecla “w” (GPIO 1) se cambia el color del cielo para mostrar el
mismo paisaje de noche.
Cada imagen debe ser estática (sin movimiento) y debe cumplir con los siguientes
requisitos:
- Utilizar toda la extensión de la pantalla.
- No puede tratarse de un patrón aleatorio (excepto el fondo).
- Se deben utilizar al menos 3 colores diferentes.
- La imagen debe involucrar al menos dos figuras de distinta forma.
- La imagen debe generarse en el código, preferentemente mediante el uso de
procedimientos para dibujar figuras básicas (círculos, rectángulos, líneas, triángulos,
etc.) parametrizadas. No está permitido implementar un código que levante una
imagen mapeada en memoria.
- La imagen debe poder explicarse en dos líneas de texto.
##Ejercicio 2
Escribir un programa en assembler ARMv8 que genere una animación por pantalla, siendo
posible reutilizar el código del ejercicio 1 pero considerando que la secuencia de movimiento
debe tener una duración no menor a 10 segundos (pudiendo no concluir jamás). Utilizar las
teclas: “w”, “a”, “s”, “d” y la barra espaciadora (GPIOs 1, 2, 3, 4 y 5, respectivamente) para
interactuar con las imágenes (cambiar forma, dirección del movimiento de una figura, etc.).
Por ejemplo: recrear el juego “Pac-Man” y usar las teclas “w”, “a”, “s”, “d” para mover el
jugador hacia arriba, izquierda, abajo y derecha, respectivamente, y la barra espaciadora
para avanzar a mayor velocidad.
Las condiciones que debe cumplir el ejercicio son:
- Utilizar toda la extensión de la pantalla y todas las teclas disponibles.
- No puede tratarse de un patrón aleatorio (excepto el fondo).
- Se debe utilizar al menos 3 colores diferentes y dos figuras de distinta forma.
- Las imágenes deben generarse en el código, preferentemente mediante el uso de
procedimientos para dibujar figuras básicas (círculos, rectángulos, líneas, triángulos,
etc.) parametrizadas. No está permitido implementar un código que levante una
secuencia de imágenes mapeadas en memoria.
- El ejercicio debe poder explicarse en pocas líneas de texto.
Se valorará especialmente la relación del efecto logrado vs. el tamaño del código generado.

