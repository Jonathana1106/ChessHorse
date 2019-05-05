#lang racket
;; Tarea Progamada Problema del Caballo
;; Prof: Marco Vinicio
;; Alumnos: Dario Rodriguez
;;          Jonathan Guzman
;;          Kenneth Hernandez


;;##########################################################################Definición de variables para GUI#########################################################################

(require (lib "graphics.ss" "graphics")) ;; Se importa la librería graphics para desarrollar la interfaz gráfica.
(open-graphics) ;; Se abre el modo gráfico de DrRacket.

(define horseWindow (open-viewport "ChessHorse" 660 660)) ;; Se crea la ventana, se define su nombre y tamaño.

(define gris (make-rgb 0.40 0.40 0.40)) ;; cuadros grises.
(define u 0) ;; Intercalar los cuadros.
(define h 0) ;;Posicion del tablero en X.
(define v 0) ;; Posicion del tablero en Y.

;;####################################### Ventana Menu ################################

(define menu (open-viewport "MENU"  300 325)) ;; Se crea la ventana que contendrá el menú del problema.

((draw-solid-rectangle menu) (make-posn 110 30) 100 50 "gray") ;; Se dibuja un rectángulo sólido en las coordenadas dadas.
((draw-rectangle menu) (make-posn 110 30) 100 50 "black") ;; Se dibuja un rectángulo en las coordenadas dadas.

((draw-solid-rectangle menu) (make-posn 110 100) 100 50 "gray") ;; Se dibuja un rectángulo sólido en las coordenadas dadas.
((draw-rectangle menu) (make-posn 110 100) 100 50 "black") ;; Se dibuja un rectángulo en las coordenadas dadas.

((draw-solid-rectangle menu) (make-posn 110 175) 100 50 "gray") ;; Se dibuja un rectángulo sólido en las coordenadas dadas.
((draw-rectangle menu) (make-posn 110 175) 100 50 "black") ;; Se dibuja un rectángulo en las coordenadas dadas.

((draw-solid-rectangle menu) (make-posn 110 250) 100 50 "gray") ;; Se dibuja un rectángulo sólido en las coordenadas dadas.
((draw-rectangle menu) (make-posn 110 250) 100 50 "black") ;; Se dibuja un rectángulo en las coordenadas dadas.

((draw-string menu)(make-posn 80 20) "Problema del Caballo" "black") ;; Texto en la ventana.
((draw-string menu)(make-posn 145 60) "5x5" "blue") ;; Texto para elegir una matriz 5x5.
((draw-string menu)(make-posn 145 135) "6x6" "blue") ;; Texto para elegir una matriz 6x6.
((draw-string menu)(make-posn 145 210) "7x7" "blue") ;; Texto para elegir una matriz 7x7.
((draw-string menu)(make-posn 145 285) "8x8" "blue") ;; Texto para elegir una matriz 8x8.

;;#####################################################################################

;;##################################################################################### Tablero #####################################################################################


(define (game n)
;;  (for ((v (in-range 11 651 (/ 640 n))))
;;    (if (equal? u 0)
;;        (for ((h (in-range 11 651 (* 2 (/ 640 n)))))
;;          ((draw-solid-rectangle horseWindow) (make-posn h v) (- (/ 640 n) 1) (- (/ 640 n) 1) gris)
;;          (set! u (+ 0 1)))
;;        (for ((h (in-range (+ 11 (/ 640 n)) (- 650 (/ 640 n)) (* 2 (/ 640 n)))))
;;          ((draw-solid-rectangle horseWindow) (make-posn h v) (- (/ 640 n) 1) (- (/ 640 n) 1) gris)
;;          (set! u (- 1 1)))))

; Para h iniciando en 10, incrementanto 80 y terminando en 660.
(for ((h (in-range 10 660 (/ 640 n))))
  ;; Dibuja en la variable z (ventana) inicie h en X = 10 y termine h en Y = 650 con azul.
  ((draw-line horseWindow) (make-posn h 10) (make-posn h 650) "blue"))

; Para v iniciando en 10, incrementanto 80 y terminando en 660.
(for ((v (in-range 10 660 (/ 640 n))))
  ;; Dibuja en la variable z (ventana) inicie v en X = 10 y termine v en Y = 650 con azul.
  ((draw-line horseWindow) (make-posn 10 v) (make-posn 650 v) "blue")))

;;###################################################################################################################################################################################

;;###################################################################################################################################################################################
;;############################################################################## Selección del menú #################################################################################

(define (control click) ;; Función que llama a la función game y le pasa los parámetros de la misma según la región donde se detecte una acción de click por parte del usuario.
    (cond
      ((and (>= (posn-x (mouse-click-posn click)) 100)(<= (posn-x (mouse-click-posn click))200)(>= (posn-y (mouse-click-posn click))30)(<= (posn-y (mouse-click-posn click))80))
       (begin (close-viewport menu) (game 5)))
      ((and (>= (posn-x (mouse-click-posn click)) 100)(<= (posn-x (mouse-click-posn click))200)(>= (posn-y (mouse-click-posn click))100)(<= (posn-y (mouse-click-posn click))150))
       (begin (close-viewport menu) (game 6)))
      ((and (>= (posn-x (mouse-click-posn click)) 100)(<= (posn-x (mouse-click-posn click))200)(>= (posn-y (mouse-click-posn click))175)(<= (posn-y (mouse-click-posn click))225))
       (begin (close-viewport menu) (game 7)))
      ((and (>= (posn-x (mouse-click-posn click)) 100)(<= (posn-x (mouse-click-posn click))200)(>= (posn-y (mouse-click-posn click))250)(<= (posn-y (mouse-click-posn click))300))
       (begin (close-viewport menu) (game 8)))
      (else (control (get-mouse-click menu)))))

(control (get-mouse-click menu))

;;##################################################################################################################################################################################
