; Ej   (restatercero1 '(8 5 4))
; Ej   Resultado (8 5 3)

(defun restatercero1 (listao)
   (list (car listao) (cadr listao) (- (caddr listao) 1))
  ; (mapcar '- listao '(0 0 1))
)


;  Ejemplo    (eliminaelemento  lista entero_posicion nil)
;  Ejemplo    (eliminaelemento  '(1 2 3 4 5 6 7 8 9) 3 nil)
;  Resultado  (1 2 4 5 6 7 8 9)   Elimino el 3

(defun eliminaelemento  (listao n listares)
  (cond
     ( (cdr listao)
        (if (/= n 1)
           (eliminaelemento (cdr listao) (- n 1) (cons (car listao) listares))
           (eliminaelemento (cdr listao) (- n 1) listares)
        )
     )
     (t  
        (if (/= n 1)
           (reverse (cons (car listao) listares))
           (reverse listares)
        )
     )
  )
)

;  Ejemplo: (quitamarca 3 '((1 2 3) (4 5 6) (7 8 9) (4 5 6)))
;  Command: (quitamarca 3 '((1 2 3) (4 5 6) (7 8 9)(7 5 6)))
;  Resultado  ((1 2 3) (4 5 6) (7 8 9) (7 5 5))
;  Command: (quitamarca 0 '((1 2 3) (4 5 6) (7 8 9)(7 5 6)))
; ((1 2 2) (4 5 6) (7 8 9) (7 5 6))
;  Command: (quitamarca 1 '((1 2 3) (4 5 6) (7 8 9)(7 5 6)))
; ((1 2 3) (4 5 5) (7 8 9) (7 5 6))
;  Command: (quitamarca 2 '((1 2 3) (4 5 6) (7 8 9)(7 5 6)))
; ((1 2 3) (4 5 6) (7 8 8) (7 5 6))
;  Command: (quitamarca 3 '((1 2 3) (4 5 6) (7 8 9)(7 5 6)))
; ((1 2 3) (4 5 6) (7 8 9) (7 5 5))
;  Command: (quitamarca 4 '((1 2 3) (4 5 6) (7 8 9)(7 5 6)))
; ((1 2 3) (4 5 6) (7 8 9) (7 5 6))
;  Command: (quitamarca 0 '((1 2 3) (4 5 6) (7 8 9)(7 5 6)))
; ((1 2 2) (4 5 6) (7 8 9) (7 5 6))
;  Command: (quitamarca 0 '((1 2 1) (4 5 6) (7 8 9)(7 5 6)))
; ((4 5 6) (7 8 9) (7 5 6))
;  Command: (quitamarca 1 '((1 2 1) (4 5 1) (7 8 9)(7 5 6)))
; ((1 2 1) (7 8 9) (7 5 6))
;  Command: (quitamarca 3 '((1 2 1) (4 5 1) (7 8 9)(7 5 1)))
; ((1 2 1) (4 5 1) (7 8 9))

(defun quitamarca (posi lista0)
  (if (> (caddr (nth posi lista0)) 1)
    (subst (restatercero1 (nth posi lista0)) (nth posi lista0) lista0)
    (eliminaelemento lista0 (1+ posi) nil)
  )
)


;****************
(defun aumenta_marca(lista20)
  (setq lista21 lista20)
  (if lista20
    	(setq contar 0 cantidad 0)
        (while (setq aa (nth contar lista20))
	    () 
	 )   
  ) 
)
(defun contar_incremento(lista)
  (cond
    (lista      
      (incremente_tercero (nth 0 lista) lista 0)     
    )
    (t
      (setq lista_total_respaldo lista_total) 
      (setq tem "Waste")
      (setq lista_total (append lista_total (list tem)))
      (setq lista_total (append lista_total (list (rtos(car b))))) ; lista_total (marca distancia numero reiduo valor_residuo)
      (cond
	((/= lista_total_anterior nil)
	  (if (equal lista_total lista_total_anterior) ; compara si la cantidad de marcas , tipos y residuos son iguales para varillas	        
		(setq cantidad_varillas (1+ cantidad_varillas)) ; aumenta el número de varillas	 	
	 	(progn
		     (setq listdim13 (list dxmarca))
	   	     (setq lista_total1 nil)
           	     (setq lista_total1 (append lista_total1 (list (rtos cantidad_varillas))))
		     (setq varillas_total (+ varillas_total cantidad_varillas))
		     (setq dddxxx1 (+ dxmarca dxmarca dxnumero dxmarca dxmarca dxnumero dxmarca dxmarca dxnumero dxmarca dxmarca dxnumero dxmarca))
      	   	     (PONERTEXT (polar p33 (gra 0) dddxxx1) (atof altdato) listdim13 lista_total1 stylodato alttdato 1)     
           	     (setq p33 (polar p33 (gra 270) (atof altdato)))
		     (command "_line" p33 (polar p33 (gra 0) dddxxx) "")        
	             (PONERTEXT p33 (atof altdato) listdim12 lista_total_respaldo stylodato alttdato 1)     	  
		     (setq listdim13 (list dxmarca))
		     (setq lista_total1 nil)
           	     (setq lista_total1 (append lista_total1 (list (rtos(car b)))))
		     (setq dddxxx2 (+ dxmarca dxmarca dxnumero dxmarca dxmarca dxnumero dxmarca dxmarca dxnumero dxmarca dxmarca dxnumero))
      	   	     (PONERTEXT (polar p33 (gra 0) dddxxx2) (atof altdato) listdim13 lista_total1 stylodato alttdato 1)                	     
	   	     (setq cantidad_varillas 1)
		     (setq lista_total_anterior lista_total)		      
	 	)
      	   );cierra if    	 
	 );cierra lista_total_anterior
	 (t
	  	
      	   	(PONERTEXT p33 (atof altdato) listdim12 lista_total_respaldo stylodato alttdato 1)
	  	(setq listdim13 (list dxmarca))
		(setq lista_total1 nil)
           	(setq lista_total1 (append lista_total1 (list (rtos(car b)))))
		(setq dddxxx2 (+ dxmarca dxmarca dxnumero dxmarca dxmarca dxnumero dxmarca dxmarca dxnumero dxmarca dxmarca dxnumero))
      	   	(PONERTEXT (polar p33 (gra 0) dddxxx2) (atof altdato) listdim13 lista_total1 stylodato alttdato 1)                	     
	   	(setq cantidad_varillas 1)
	        (setq lista_total_anterior lista_total)
	 )
      )
        (setq lista_total nil)
      	(setq listdim12 nil)
        
     )
  )
  
 )
(defun incremente_tercero(elemento lista cantidad)
  (cond
    ((member elemento lista)
      (setq l1 (length lista))
      (setq l2 (length(member elemento lista)))
      (setq valor (+ (- l1 l2) 1))           
      (incremente_tercero elemento (eliminaelemento_corte lista valor nil  ) (1+ cantidad))
     )    
    (t
        (setq lista_parcial (append elemento (list cantidad)))
        (setq lista_total (append lista_total (list (nth 0 lista_parcial))))        
        (setq lista_total (append lista_total (list (rtos(nth 1 lista_parcial)))))        
	(setq lista_total (append lista_total (list (rtos(nth 2 lista_parcial)))))
        (setq listdim12(append listdim12 (list dxmarca dxmarca dxnumero)))
	(contar_incremento lista)
     )
   )
  )
(defun eliminaelemento_corte  (listao n listares)
  (cond
     ( (cdr listao)
        (if (/= n 1)
           (eliminaelemento (cdr listao) (- n 1) (cons (car listao) listares))
           (eliminaelemento (cdr listao) (- n 1) listares)
        )
     )
     (t  
        (if (/= n 1)
           (reverse (cons (car listao) listares))
           (reverse listares)
        )
     )
  )
)
;  (ordenarlista '(1 4 6 3 2 7) nil)
(defun ordenarlista (lista0 listares / posi)
 (setq posi
      (-
        (length lista0)
        (length (member (apply 'max lista0) lista0))
      )
 )
 (cond 
  ((cdr lista0) 
    (ordenarlista
      (eliminaelemento lista0 (1+ posi) nil)
      (cons (nth posi lista0) listares)
    )
  )
  (T  (cons (car lista0) listares)
  )
 )
)




; (ordenar2lista '(1 3 2 7 2) '((1 1)(3 5)(2 4) (7 ) (2 6)) nil nil)
; ((1 2 2 3 7) ((1 1) (2 6) (2 4) (3 5) (7)))
(defun ordenar2lista (lista0 lista2 listares listares2 / posi)
 (setq posi
      (-
        (length lista0)
        (length (member (apply 'max lista0) lista0))
      )
 )
 (cond 
  ((cdr lista0) 
    (ordenar2lista
      (eliminaelemento lista0 (1+ posi) nil)
      (eliminaelemento lista2 (1+ posi) nil)
      (cons (nth posi lista0) listares)
      (cons (nth posi lista2) listares2)
    )
  )
  (T (list (cons (car lista0) listares)
           (cons (car lista2) listares2)
      )
  )
 )
)


(defun resultaxx1 (listax valorx rres)
  (setq prim  (car listax))
  (setq ulti (last listax))
  (if (= (length listax) 1)
     (setq suma (+ 1 valorx))
     (setq suma (+ (cadr prim) (cadr ulti) ))
  )
  (cond( (>= valorx suma)
         (setq listaxx (eliminaelemento listax (length listax) nil))
         (resultaxx1
           (eliminaelemento listaxx 1 nil)
           (- valorx suma)
           (cons ulti (cons prim rres))
         )
       )
       ( (>= valorx (cadr prim) )
         (resultaxx1
           (eliminaelemento listax 1 nil)
           (- valorx (cadr prim) )
           (cons prim rres)
         )
       )
       ( (>= valorx (cadr ulti) )
         (resultaxx1
           (eliminaelemento listax (length listax) nil)
           (- valorx (cadr ulti) )
           (cons ulti rres)
         )
       )
       (t (list listax rres)
       )
   )
)

(defun verifixx (listaxx valorxx posicion / res)
   (if (= posicion 1)
     (setq res (car listaxx))
   )
   (if (= posicion 2)
     (setq res (last listaxx))
   )
   (if (>= valorxx (cadr res))
      (reverse (cdr (reverse res)))
      nil
   )
)


;;;;  (analiss '((1 2 3) (8 7 6) (4 5 32) (45 6 8)) 12)
;;;;  Resultado= ((0 (1 2) (1 2) (45 6) (1 2)) ((8 7 6) (4 5 32) (45 6 7)))
;;;;  original
;;;(defun analiss (listax valorxx / a bb resultado)
;;;   (setq resultado nil)
;;;   (setq a 1)
;;;   (while (= a 1)
;;;    (setq a 0)
;;;    (if (setq bb (verifixx listax valorxx 1))
;;;      (progn
;;;          (setq listax (quitamarca 0 listax ) )
;;;;     (print listax)
;;;          (setq resultado (cons bb resultado))
;;;          (setq a 1)
;;;          (setq valorxx (- valorxx (cadr bb)))
;;;      )
;;;    )
;;;    (if (setq bb (verifixx listax valorxx 2))
;;;      (progn
;;;          (setq listax (quitamarca (1- (length listax)) listax ) )
;;;;     (print listax)
;;;          (setq resultado (cons bb resultado))
;;;          (setq a 1)
;;;          (setq valorxx (- valorxx (cadr bb)))
;;;      )
;;;    )
;;;  )
;;;  (list (cons valorxx resultado) listax)
;;;)

;  (analiss '((1 2 3) (8 7 6) (4 5 32) (45 6 8)) 12)
;  Resultado= ((0 (1 2) (1 2) (45 6) (1 2)) ((8 7 6) (4 5 32) (45 6 7)))
;   gnr oct2004
(defun analiss (listax valorxx / a bb resultado valorxxaux) ; gnr oct2004
 (if (<= (cadar listax) valorxx)       ; gnr oct2004
   (setq valorxxaux valorxx)           ; gnr oct2004
   (setq valorxxaux (cadar listax))    ; gnr oct2004
 )  
   (setq resultado nil)
   (setq a 1)
   (while (= a 1)
    (setq a 0)
    (if (setq bb (verifixx listax valorxxaux 1))  ; gnr oct2004
      (progn
          (setq listax (quitamarca 0 listax ) )
;     (print listax)
          (setq resultado (cons bb resultado))
          (setq a 1)
          (setq valorxxaux (- valorxxaux (cadr bb))) ; gnr oct2004
      )
    )
    (if (setq bb (verifixx listax valorxxaux 2))     ; gnr oct2004
      (progn
          (setq listax (quitamarca (1- (length listax)) listax ) )
;     (print listax)
          (setq resultado (cons bb resultado))
          (setq a 1)
          (setq valorxxaux (- valorxxaux (cadr bb)))   ; gnr oct2004
      )
    )
  )
  (list (cons valorxxaux resultado) listax)   ; gnr oct2004
)



(defun analifinal (listax valorxx / resultado)
   (cond
     ((cadr (analiss listax valorxx))
;        (cons (cons valorxx (car (analiss listax valorxx) )) (analifinal (cadr (analiss listax valorxx) )  valorxx))
       (cons (car (analiss listax valorxx)) (analifinal (cadr (analiss listax valorxx) )  valorxx))

      )
     (t (list (car (analiss listax valorxx) )))
   )
)


(DEFUN saqueli (numero1 lista1)
  (cond
    ((car lista1)
        (if (= (caar lista1) numero1)
	   (cons (car lista1)(saqueli numero1 (cdr lista1)))
	   (saqueli numero1 (cdr lista1))
        )
    )        
    (t nil
     )   
  )
)

(defun listarepetir (valor lista1 )
    (cond
       ((car lista1)
	  (cons valor (listarepetir valor (cdr lista1)) )
       )
       (t nil)
    )
)
