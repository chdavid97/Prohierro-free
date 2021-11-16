;@@@@@@@@@@@@@@@@@@@@ A L I A S @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
(DEFUN C:HI ()
  (if (= (getvar "useri1") 0)
    (setvar "useri1" 1)
  )
  (setq codigo (itoa (getvar "useri1")))
  (setq modo 1 cero 1 laylay 1)
  (PH1)
)
(DEFUN C:PZ  () (C:PANZOON))
(DEFUN C:EDI () (C:EDIPLA))
(DEFUN C:PLA () (C:PLANILLA))

(DEFUN C:ENLA () (C:ENLAZAR))
(DEFUN C:AGRU () (C:AGRUPAR))
(DEFUN C:BMAR () (C:BORRARMARCAS))

(DEFUN C:LOSA   () (C:DIBLOSA))
(DEFUN C:INS    () (C:DIBCORTE))
(DEFUN C:MARCA  () (C:DIBMARCAS))
(DEFUN C:VIGA   () (setq vicol  "0") (C:DIBVIGAS))
(DEFUN C:COL    () (setq vicol  "1") (C:DIBVIGAS))
(DEFUN C:EVIGA  () (setq vicole "0") (C:DIBESTRIBOS))
(DEFUN C:ECOL   () (setq vicole "1") (C:DIBESTRIBOS))
(DEFUN C:GRADA  () (C:DIBGRADAS))
(DEFUN C:VARIOS () (C:DIBVARIOS))
(DEFUN C:BLO    () (C:DIBBLOQUES))

(defun LEEMSG();PARA LEER FILE DE SEGURIDAD 2007-02-22
      (setq path2 "C:/msg.woc")
      (setq arch2 (open path2 "r"))
      (setq acce2 (read-line arch2)) 
      (close arch2)
      acce2
  )


;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;----------------------------------------------
(DEFUN C:PH ()
 ;(if (findfile "c:/Windows/phdcl.bak")  ; gnr ener2002    "seguridd de PH2000"
;(if (= 5 5)                              ; gnr agosto 2002
;SE ACTUALIZO PARA PROTEGER LA CORRIDA 2007-02-08 LC  
(SETQ fech_final(menucmd "M=$(edtime, $(getvar,date),HH:MM)"))
(setq categoria (getvar "users2"))
;(if (= fech_final categoria)
 ;(progn                                  ; gnr ener2002
  ; (setq GOPH 1)
 ;)
  ;(progn
   ;   (setq GOPH 0)
    ;  (IF (= "0" (LEEMSG))
	;(PROGN
      	;	(Print "LA EJECUCIÓN DE PROHIERRO 2007® DEBE LLEVARSE A CABO DEL ICONO DE NOTIFICACIÓN, USTED PUEDE DAR EL CLIC DOBLE EN ESTE ICONO O PUEDE DAR EL CLIC CORRECTO Y DEL MENÚ PARA SELECCIONAR - EJECUTE PROHIERRO 2007®")  ; Actualizo para seguridad del sistema 2007-02-08 LC
      	;	(startapp "stopph.exe")
	 ; )
	;)
;  )
;)
(setq GOPH 1)
(if (= GOPH 1)
 (progn                                  ; gnr ener2002
  (setq ph_grafico 1)                    ; asignacion a variable
  (c:ph_new)        			 ; 
  (setq pro_grafico 1)
  (SETQ CAJA1 (NEW_DIALOG "presentacion" DCL1))  
  (TIPOGRA2 "phlogo4" "phlogo4" "imageD" 250)                     
  (ACTION_TILE "ad"  "(ACERCA2)")
  (ACTION_TILE "hierros" "(setq opcionPH 1 laylay 1)(done_dialog)")
  (ACTION_TILE "op"      "(setq opcionPH 2 laylay 1)(done_dialog)")
  (ACTION_TILE "ah"      "(setq opcionPH 3 laylay 1)(done_dialog)")
  (ACTION_TILE "ag"      "(setq opcionPH 4 laylay 1)(done_dialog)")
  (ACTION_TILE "edipla"  "(setq opcionPH 5 laylay 1)(done_dialog)")  
  (START_DIALOG)
  (DONE_DIALOG)
  (cond
    ((= opcionPH 1)
      (if (= (getvar "useri1") 0)
	(setvar "useri1" 1)
      )
      (setq codigo (itoa (getvar "useri1")))
      (setq modo 1)(setq cero   1)
      (PH1)
    )
    ((= opcionPH 5)
     (C:EDIPLA)
     (if (= pro_grafico 1)(C:PH)(c:PH_NEW))
    )
    ((= opcionPH 2)(C:PLANILLA))
    ((= opcionPH 3)(CARGAR "C:AGRUPAR" "cambiar") (C:AGRUPAR) (if (= pro_grafico 1)(C:PH)(c:PH_NEW)))
    ((= opcionPH 4)(CARGAR "C:ENLAZAR" "cambiar") (C:ENLAZAR) (if (= pro_grafico 1)(C:PH)(c:PH_NEW)))
    ((= opcionPH 0)
      (setvar "cmdecho" 0)
        (command "_view" "_d" (strcat "x1-" alayerplat));mf
	(command "_view" "_d" (strcat "x2-" alayerplal));mf
	(command "_view" "_d" (strcat "x3-" alayerest)) ;mf
	(command "_view" "_d" (strcat "x4-" alayerpos)) ;mf
	(command "_view" "_d" (strcat "x5-" alayerace)) ;mf
	(command "_view" "_d" (strcat "x6-" alayermar)) ;mf
	(command "_view" "_d" (strcat "x7-" alayerdib)) ;mf
	(command "_view" "_d" (strcat "x8-" alayerlin)) ;mf   
	(command "_view" "_s" (strcat "x1-" layerplat)) ;mf
	(command "_view" "_s" (strcat "x2-" layerplal)) ;mf
	(command "_view" "_s" (strcat "x3-" layerest))  ;mf
	(command "_view" "_s" (strcat "x4-" layerpos))  ;mf
	(command "_view" "_s" (strcat "x5-" layerace))  ;mf
	(command "_view" "_s" (strcat "x6-" layermar))  ;mf
	(command "_view" "_s" (strcat "x7-" layerdib))  ;mf
	(command "_view" "_s" (strcat "x8-" layerlin))  ;mf
      (setvar "cmdecho" old2)
      (setvar "clayer" layerANT)
      (setvar "osmode" os)
      (setvar "plinewid" wideANT)
      ;AQUI ASIGNO LA VARIABLE ANTERIOR DE PLINETYPE 2007-01-31 LC
      ;(setvar "plinetype" VAR_PLINETYPE) CDPJ
     (setvar "plinetype" 0) 
      (setq laylay 0)
    )
  )
 ); Verdadero  ; gnr ener2002
 ;(Print "Instalation Damage")  ; gnr ener2002
 ); gnr ener2002
)  

;---------------------------------------------------------
(DEFUN PH1 ()
  (if (/= os 0)(command "_osnap" "_none")) ;mfr
  (setq opcionPH1 0)
  (if (= tdibuj nil)(setq tdibuj "0"))

  (if (= numero   nil)(setq numero   "1"))
  (if (= tipo     nil)(setq tipo     "1"))
  (if (= fid      nil)(setq fid      "1"))
  (if (= angulo   nil)(setq angulo   "0"))
  (if (= oppremar nil)(setq oppremar  1))
  (if (= reflejo  nil)(setq reflejo   1))
  (if (= posic    nil)(setq posic     2))
  (if (= XXX      nil)(setq XXX      77.0))
  (if (= YYY      nil)(setq YYY       0.0))
  
  (if (= posic 1)(setq XXX  33.0))
  (if (= posic 2)(setq XXX  77.0))
  (if (= posic 3)(setq XXX 122.0))

  (if (= Mmarca  nil)(setq Mmarca  "0"))
  (if (= Mglobal nil)(setq Mglobal "100"))
  (if (= Mfija   nil)(setq Mfija   "0"))
  
  (SETQ listang (list "ang1" "ang2" "ang3" "ang4"))

  (if (= actua    nil) (SETQ actua     3))
  (if (= aaa nil)(SETQ aaa "2.00"))
  
  (if (= bbb nil)(SETQ bbb "0.50"))
  (if (= ccc nil)(SETQ ccc "1.00"))
  (if (= ddd nil)(SETQ ddd "0.00"))
  (if (= eee nil)(SETQ eee "0.00"))
  (if (= fff nil)(SETQ fff "0.00"))
  (if (= ggg nil)(SETQ ggg "0.30"))
  (if (= rrr nil)(SETQ rrr "0.05"))
  
  (SETQ CAJA2 (NEW_DIALOG "inicio" DCL1))
  
  (ROJO modo)
  
  (SET_TILE "codigo" codigo)
  (SET_TILE "numero" numero)
  (SET_TILE "tipo" tipo)
  (SET_TILE "fi" fid)
  (SET_TILE "angulo" angulo)
  (SET_TILE "a" aaa)
  (SET_TILE "b" bbb)
  (SET_TILE "c" ccc)
  (SET_TILE "d" ddd)
  (SET_TILE "e" eee)
  (SET_TILE "f" fff)
  (SET_TILE "g" ggg)
  (SET_TILE "r" rrr)
  (SET_TILE "marca"  Mmarca)
  (SET_TILE "global" Mglobal)
  (SET_TILE "fija"   Mfija)  
  (SET_TILE "tdibuj" tdibuj)
  (SET_TILE "tifio" tifio)
  (MODE_TILE "angulo" 1)
  (MODE_TILE "tifio" 1)
  (cond
    ((= angulo "0")  (SET_TILE "ang1" "1"))
    ((= angulo "90") (SET_TILE "ang2" "1"))
    ((= angulo "180")(SET_TILE "ang3" "1"))
    ((= angulo "270")(SET_TILE "ang4" "1"))
    (T 
      (MODE_TILE "ang1" 1)(MODE_TILE "ang2" 1)(MODE_TILE "ang3" 1)(MODE_TILE "ang4" 1)
      (MODE_TILE "angulo" 0)(SET_TILE "otroang" "1")
    )
  )
  (if (= oppremar 1)(SET_TILE "visualcod" "1"))
  (if (= oppremar 2)(SET_TILE "visualmar" "1"))
  
  (mode_tile "codigo" 0)

  (CEROS 0)
  (obra tipo)
  (fijar Mmarca Mglobal Mfija)
  (CORRECTO)
  (setq WWHHTTXX nil)
  (if (= modo 2)
    (progn
      (setq e (handent HHTX))
      (if (/= e nil)
	(if (/= (entget e) nil)
	  (progn
	    (setq mensajes (strcat " Bar grouping  to " (cdr (assoc 1 (entget e)))))
	    (set_tile "tmensajes" mensajes)
	    (setq WWHHTTXX HHTX)
	  )
	)
      )
    )
  )
  
  (ACTION_TILE "especiales" "(setq opcionPH1 111)(done_dialog)")
  (ACTION_TILE "axb" "(setq opcionPH1 222)(done_dialog)")  ;  gnr enero2002
  (ACTION_TILE "acerca22"   "(ACERCA2)")
  (ACTION_TILE "ejemplo"    "(EJEMPLO numero fid oppremar codigo Mmarca listfi listwm)")
  
  (ACTION_TILE "tipo"    "(setq tipo (atoa $value))(obra tipo)")
  (ACTION_TILE "tdibuj"  "(setq tdibuj (atoa $value))(CORRECTO)")
  (ACTION_TILE "mirrort" "(setq reflejo (refle reflejo))(obra tipo)")
  (action_tile "Slide_C" "(setq cuadro 1)(obra tipo)(setq cuadro nil)(if (/= tipo \"6\")(dibuja_vector (list $x $y)))")
  (ACTION_TILE "fi"  "(setq fid (atoa $value))(setq fi (nth (atoi fid) listfi))")
  (setq fi  (nth (atoi fid) listfi))
  
  (ACTION_TILE "ang1" "(setq angulo \"0\") (set_tile \"angulo\" angulo)")
  (ACTION_TILE "ang2" "(setq angulo \"90\") (set_tile \"angulo\" angulo)")
  (ACTION_TILE "ang3" "(setq angulo \"180\") (set_tile \"angulo\" angulo)")
  (ACTION_TILE "ang4" "(setq angulo \"270\") (set_tile \"angulo\" angulo)")
  
  (ACTION_TILE "otroang" "(activang $value listang (list \"angulo\"))")
  
  (action_tile "numero" "(setq numero  (AR $value 5 0 \"numero\")  )")
  (action_tile "marca"  "(setq Mmarca  (AR $value 5 0 \"marca\")  )")
  (action_tile "global" "(setq Mglobal (AR $value 5 0 \"global\")  )")
  (action_tile "fija"   "(setq Mfija   (atoa $value))(fijar Mmarca Mglobal Mfija)")
  (action_tile "angulo" "(setq tipoabc \"7\")(setq angulo  (AR $value 5 0 \"angulo\")  )")
  (action_tile "cero"   "(CEROS 1)")
  
  (action_tile "a"  "(setq tipoabc \"0\")(setq aaa  (AR $value 7 2 \"a\"))(corregdim)") ; MF
  (action_tile "b"  "(setq tipoabc \"1\")(setq bbb  (AR $value 7 2 \"b\"))(corregdim)"); MF
  (action_tile "c"  "(setq tipoabc \"2\")(setq ccc  (AR $value 7 2 \"c\"))"); MF
  (action_tile "d"  "(setq tipoabc \"3\")(setq ddd  (AR $value 7 2 \"d\"))"); MF
  (action_tile "e"  "(setq tipoabc \"4\")(setq eee  (AR $value 7 2 \"e\"))"); MF
  (action_tile "f"  "(setq tipoabc \"5\")(setq fff  (AR $value 7 2 \"f\"))"); MF
  (action_tile "g"  "(setq tipoabc \"6\")(setq ggg  (AR $value 7 2 \"g\"))(corregdim)")
  (action_tile "r"  "(setq rrr  (AR $value 7 2 \"r\"))(corregdim)")
  (action_tile "visualcod" "(setq oppremar 1)")
  (action_tile "visualmar" "(setq oppremar 2)")
  
  (action_tile "dibujarAM"        "(setq opcionPH1  1)(done_dialog)")
  (action_tile "planilla"         "(setq opcionPH1  3)(done_dialog)")

  (action_tile "hierromarca"      "(setq opcionPH1  5)(done_dialog)")
  (action_tile "cambiartext"      "(setq opcionPH1  6)(done_dialog)")
  (action_tile "borrarmarcas"     "(setq opcionPH1  7)(done_dialog)")
  (action_tile "actualizarmarcas" "(setq opcionPH1 10)(done_dialog)")
  (action_tile "Ob_new"           "(setq opcionPH1 20)(done_dialog)") ; MF
  (action_tile "Ob_new1"          "(setq opcionPH1 23)(done_dialog)") ; MF
  (action_tile "Ob_new2"          "(setq opcionPH1 24)(done_dialog)") ; MF
  (action_tile "donas"            "(setq opcionPH1 21)(done_dialog)") ; MF
  (action_tile "estribo"          "(setq opcionPH1 22)(done_dialog)") ; MF
  (action_tile "nuevamarca"       "(setq modo 1)(setq opcionPH1 8 cero 1)(done_dialog)")
  (action_tile "editarmarca"      "(setq opcionPH1 9 cero 1)(done_dialog)")
  (action_tile "tifio"            "(setq tifio $value)  			
			(setq Mtipo tifio)
			(ADD_LISTTIPO)"
  ) ; mf valor del otro tipo
  
  (action_tile "undol" "(setq opcionPH1 33)(done_dialog)")
  
  (START_DIALOG)
  (DONE_DIALOG)
 
  (cond
    ;condicion 1
    ((= opcionPH1 0)        
	(setvar "osmode" os)
	(if (= pro_grafico 1)(C:PH)(c:PH_NEW))
    )
    ;condicion 2
    ((= opcionPH1 33)
     (C:PANZOON1)       
     (setq modo 1 cero 1)
     (setq codigo (itoa (getvar "useri1")))
     (PH1)
    )
    ; condicion 3   
   ((= opcionPH1 10) 
    (CARGAR "C:ACTUALIZARM"   "cambiar")
    (C:ACTUALIZARM)
    (setvar "clayer" layerANT)
    (PH1)
   )
   ; condicion 4
   ((= opcionPH1 111) 
     (ESPECIAL)
     (setvar "clayer" layerANT)
     (PH1)
   )
   ; condicion 5
   ((= opcionPH1  6) 
    (CARGAR "C:CAMBIARTEXT"   "cambiar") 
    (C:CAMBIARTEXT 0)
    (setvar "clayer" layerANT)
    (PH1)
   )
   ; condicion 6
   ((= opcionPH1  7)
    (CARGAR "C:BORRARMARCAS"  "cambiar")
    (C:BORRARMARCAS)
    (setvar "clayer" layerANT)
    (PH1)
    )
   ; condicion 7
; 8888888888888888888888888888888888888888888
   ((and (= modo 2)(= opcionPH1 1)(= tdibuj "1") enpoly (= entext nil))    
     (CONDIPRI)
     (c:llamarPL enpoly)     
     (DATOPOLY)
     (OBTPUNTOPOLY entext enpoly)
     (command "_erase" enpoly "");mfr
     (LLAMAR_RESPALDO)
     (MTIPOFI)
     (setq lista1 "no")
     (GRATEXT)     
     (if (= WWHHTTXX nil)
       (setq HTX "no")
       (setq HTX WWHHTTXX)
     )
     (setq HPL "no")
     (setq HNT "no")     
     (setq codigoANT codigo)
     (if (= cero 0)(setq codigo "0"))
     (c:grabarTX entt)
     (setq codigo codigoANT)     
     (setq entext entt enpoly nil)
     (CONDIANT)
     (PH1)
   )
   ; condicion 8
   ((and (= modo 2)(= opcionPH1 1)(= tdibuj "2")(< (atoi tipo) 6) enpoly (= entext nil))        
     (CONDIPRI)
     (c:llamarPL enpoly)
     (DATOPOLY)
     (OBTPUNTOPOLY entext enpoly)
     (command "_erase" enpoly "");mfr
     (LLAMAR_RESPALDO)     
     (MTIPOFI)
     (GRAPOLY)     
     (setq HNT "no")
     (c:grabarPL ent)     
     (setq entext nil enpoly ent)
     (CONDIANT)(PH1)
   )
   ; condicion 9
   ((and (= modo 2)(= opcionPH1 1)(= tdibuj "0")(< (atoi tipo) 6) enpoly (= entext nil))    
     (CONDIPRI)
     (c:llamarPL enpoly)      
     (DATOPOLY)
     (OBTPUNTOPOLY entext enpoly)     
     (command "_erase" enpoly "");mf
     (LLAMAR_RESPALDO)     
     (MTIPOFI)
     (GRAPOLY)
     (setq lista1 (ARMAR ent))
     (GRATEXT)
     (setq propient  (entget ent))
     (setq propientt (entget entt))
     (setq HPL (cdr (assoc 5 propient)))
     (setq HNT (cdr (assoc 5 propientt)))
     (if (= WWHHTTXX nil)
       (setq HTX "no")
       (setq HTX WWHHTTXX)
     )     
     (setq codigoANT codigo)
     (if (= cero 0)(setq codigo "0"))
     (c:grabarTX entt)
     (c:grabarPL ent)
     (setq codigo codigoANT)     
     (setq entext entt enpoly ent)
     (CONDIANT)(PH1)
   )
   ; condicion 10
   ((and (= modo 2)(= opcionPH1 1)(= tdibuj "1") (= enpoly nil) entext)    
     (CONDIPRI)
     (c:llamarTX entext)      
     (DATOTEXT)
     (setq punto (cdr (assoc 11 (entget entext))))     
     (command "_erase" entext "")
     (LLAMAR_RESPALDO)     
     (MTIPOFI)     
     (setq lista1 "no")
     (GRATEXT)
     (setq HTX WHTX)
     (setq HPL "no")
     (setq HNT "no")     
     (setq codigoANT codigo)
     (if (= cero 0)(setq codigo "0"))
     (c:grabarTX entt)
     (setq codigo codigoANT)     
     (setq entext entt enpoly nil)
     (CONDIANT)(PH1)
   )
   ; condicion 11
   ((and (= modo 2)(= opcionPH1 1)(= tdibuj "2")(< (atoi tipo) 6) (= enpoly nil) entext)    
    (CONDIPRI)
     (c:llamarTX entext)      
     (DATOTEXT)
     (OBTPUNTOTEXT entext enpoly)     
     (command "_erase" entext "");mfr
     (LLAMAR_RESPALDO)     
     (MTIPOFI)
     (GRAPOLY)     
     (setq HNT "no")
     (c:grabarPL ent)     
     (setq entext nil enpoly ent)
     (CONDIANT)(PH1)
   )
   ; condicion 12
   ((and (= modo 2)(= opcionPH1 1)(= tdibuj "0")(< (atoi tipo) 6) (= enpoly nil) entext)
 (CONDIPRI)
     (c:llamarTX entext)     
     (DATOTEXT)
     (OBTPUNTOTEXT entext enpoly)      
     (command "_erase" entext "");mf
     (LLAMAR_RESPALDO)     
     (MTIPOFI)
     (GRAPOLY)
     (setq lista1 (ARMAR ent))
     (GRATEXT)
     (setq propient  (entget ent))
     (setq propientt (entget entt))
     (setq HPL (cdr (assoc 5 propient)))
     (setq HNT (cdr (assoc 5 propientt)))
     (setq HTX WHTX)     
     (setq codigoANT codigo)
     (if (= cero 0)(setq codigo "0"))
     (c:grabarTX entt)
     (c:grabarPL ent)
     (setq codigo codigoANT)     
     (setq entext entt enpoly ent)
     (CONDIANT)(PH1)
   )
   ; condicion 13
   ((and (= modo 2)(= opcionPH1 1)(= tdibuj "1") enpoly entext)
     (CONDIPRI)
     (c:llamarTX entext)
     (c:llamarPL enpoly)      
     (DATOTEXT)
     (setq punto (cdr (assoc 11 (entget entext))))     
     (command "_erase" entext enpoly "");mf
     (LLAMAR_RESPALDO)     
     (MTIPOFI)     
     (setq lista1 "no")
     (GRATEXT)
     (setq HTX WHTX)
     (setq HPL "no")
     (setq HNT "no")     
     (setq codigoANT codigo)
     (if (= cero 0)(setq codigo "0"))
     (c:grabarTX entt)
     (setq codigo codigoANT)     
     (setq entext entt enpoly nil)
     (CONDIANT)(PH1)
   )
   ; condicion 14
   ((and (= modo 2)(= opcionPH1 1)(= tdibuj "2")(< (atoi tipo) 6) enpoly entext)
     (CONDIPRI)
     (c:llamarTX entext)(c:llamarPL enpoly)      
     (DATOTEXT)
     (OBTPUNTOPOLY entext enpoly)     
     (command "_erase" entext enpoly "");
     (LLAMAR_RESPALDO)     
     (MTIPOFI)
     (GRAPOLY)
     (setq HNT "no")
     (c:grabarPL ent)     
     (setq entext nil enpoly ent)
     (CONDIANT)(PH1)
   )
   ; condicion 15 
   ((and (= modo 2)(= opcionPH1 1)(= tdibuj "0")(< (atoi tipo) 6) enpoly entext)
     (CONDIPRI)
     (c:llamarTX entext)
     (c:llamarPL enpoly)     
     (DATOTEXT)
     (OBTPUNTOPOLY entext enpoly)      
     (command "_erase" entext enpoly "");mf
     (LLAMAR_RESPALDO)     
     (MTIPOFI)
     (GRAPOLY)
     (setq lista1 (ARMAR ent))
     (GRATEXT)
     (setq propient  (entget ent))
     (setq propientt (entget entt))
     (setq HPL (cdr (assoc 5 propient)))
     (setq HNT (cdr (assoc 5 propientt)))
     (setq HTX WHTX)     
     (setq codigoANT codigo)
     (if (= cero 0)(setq codigo "0"))
     (c:grabarTX entt)
     (c:grabarPL ent)
     (setq codigo codigoANT)     
     (setq entext entt enpoly ent)
     (CONDIANT)(PH1)
   )
   ; condicion 16
   ((and (= modo 1)(= opcionPH1 1)(= tdibuj "0")(< (atoi tipo) 6))
     (setvar "cmdecho" 0)
     (setvar "blipmode" 0)
     (MTIPOFI)
     (setq punto (getvar "viewctr"))
     (GRAPOLY)
     (setq lista1 (ARMAR ent))
     (GRATEXT)
     (setq propient  (entget ent))
     (setq propientt (entget entt))
     (setq HPL (cdr (assoc 5 propient)))
     (setq HNT (cdr (assoc 5 propientt)))
     (setq HTX "no")
     (CARGAR "C:grabarTX" "datext")        
     (setq codigoANT codigo)
     (if (= cero 0)(setq codigo "0"))
     (c:grabarTX entt)
     (c:grabarPL ent)
     (setq codigo codigoANT)     
     (if (= cero 1)(setvar "useri1" (1+ (getvar "useri1"))))
     (setq codigo (itoa (getvar "useri1")))
     (CONDIANT)(PH1)
   )
   ; condicion 17
   ((and (= modo 1)(= opcionPH1 1)(= tdibuj "2")(< (atoi tipo) 6))
     (setvar "cmdecho" 0)
     (setvar "blipmode" 0)
     (MTIPOFI)
     (setq punto (getvar "viewctr"))
     (GRAPOLY)
     (setq HNT "no")
     (CARGAR "C:grabarPL" "datext")   
     (c:grabarPL ent)     
     (setq codigo (itoa (getvar "useri1")))
     (CONDIANT)(PH1)
   )
   ; condicion 18
   ((and (= opcionPH1 1)(or (= tdibuj "0")(= tdibuj "2"))(= (atoi tipo) 6))
     (alert "   It cannot draw Steel   ")
     (setq codigo (itoa (getvar "useri1")))
     (PH1)
   )
   ; condicion 19
   ((and (= modo 1)(= opcionPH1 1)(= tdibuj "1"))
     (setvar "cmdecho" 0)
     (setvar "blipmode" 0)
     (MTIPOFI)
     (setq punto (getvar "viewctr"))     
     (setq lista1 "no")
     (GRATEXT)
     (setq HPL "no")
     (setq HNT "no")
     (setq HTX "no")
     (CARGAR "C:grabarTX" "datext")        
     (setq codigoANT codigo)
     (if (= cero 0)(setq codigo "0"))
     (c:grabarTX entt)
     (setq codigo codigoANT)     
     (if (= cero 1)(setvar "useri1" (1+ (getvar "useri1"))))
     (setq codigo (itoa (getvar "useri1")))
     (CONDIANT)(PH1)
   )
   ; condicion 20
   ((= opcionPH1 3)(C:PLANILLA))
   ; condicion 21
   ((= opcionPH1 20)(AYUDAS1)) ;MF
   ((= opcionPH1 23)(MAITE)) ;MF
   ((= opcionPH1 24)(MAITE1)) ;MF
   ; condicion 22
   ((= opcionPH1 21)(AYUDAS3)) ;MF
   ; condicion 23
   ((= opcionPH1 22)(AYUDAS2)) ;MF
   ; condicion 24
   ((= opcionPH1 5)
     (CARGAR "HIERROMARCA" "obtener")
     (setvar "cmdecho" 0)
     (HIERROMARCA)
     (setvar "cmdecho" old2)
     (PH1)
   )
   ; condicion 25
   ((= opcionPH1 8)
     (setq codigo (itoa (getvar "useri1")))
     (PH1)
   )
  ; condicion 26
   ((= opcionPH1 9)
     (CARGAR "HIERROMARCA" "obtener")
     (setvar "cmdecho" 0)
     (HIERROMARCAT)
     (setvar "cmdecho" old2)
     (if (> poder 0)(setq modo 2))
     (PH1)
   )
   ; condicion 27  ; gnr enero2002
   ((= opcionPH1 222) 
     (axbcambio)
     (PH1)
   )    ;  fin gnr enero2002
 ) ; cierra el COND
  
  (setvar "clayer" layerANT)
  (setvar "osmode" os)
)

****************** Aumenta la nueva letra del tipo en la lista de tipos
(DEFUN ADD_LISTTIPO()
  (if (= (member tifio listtipo) nil)
    (PROGN
	(SETQ listtipo (append listtipo (LIST tifio)))        
    )
  )
)
***************
(DEFUN TEXTO (lista1 tipo angulo)
  (if (/= lista1 "no")
    (progn
      (cond
	((or (= tipo "0") (and (or (= tipo "1")(= tipo "3")(= tipo "4"))(< (atof ggg) 0.001)))
	  (setq p1 (nth 0 lista1) p2 (nth 1 lista1))
	)
	((and (= tipo "1")(> (atof ggg) 0.001))
	  (setq p1 (nth 2 lista1) p2 (nth 3 lista1))
	)
	((= tipo "2")
	  (setq p1 (nth 1 lista1) p2 (nth 2 lista1))
	)
	((and (= tipo "3")(> (atof ggg) 0.001))
	  (setq p1 (nth 2 lista1) p2 (nth 3 lista1))
	)
	((and (= tipo "4")(> (atof ggg) 0.001))
	  (setq p1 (nth 2 lista1) p2 (nth 3 lista1))
	)
	((= tipo "5")
	  (setq p1 (nth 1 lista1) p2 (nth 2 lista1))
	)
      )
      (setq pm (mapcar '/ (mapcar '+ p1 p2) (list 2 2 2)  )  )
      (setq anguloN (atoi angulo))
      (if (and (> anguloN 90)(<= anguloN 270))(setq anguloN (- anguloN 180)))
      (setq anguloT (+ anguloN 90))
      (setq pt (polar pm (gra anguloT) (* 1.0 (atof altmar))))
    )  
    (progn
      (setq pt punto)
      (setq anguloN (atoi angulo))
      (if (and (> anguloN 90)(<= anguloN 270))(setq anguloN (- anguloN 180)))
    )
  )
  
  (if (= accp 1)(setq pt pipin))
  (setq tt (TEXTOMARCA codigo cero Mfija Mmarca Mglobal oppremar fid numero Mtipo))
  
  (command "_layer" "_m" layermar "");mf
  (command "_text" "_s" stylomarca "_j" "_c" pt altmar anguloN tt);mf
  (setvar "TEXTSTYLE" stitextANT)
  (setq entt (entlast))
)

 -------------------------------
(DEFUN TEXTOMARCA (codigo1 cero1 Mfija1 Mmarca1 Mglobal1 oppremar1 fid1 numero1 Mtipo1)
  (setq fi1  (nth (atoi fid1) listfi))
  (if (= Mtipo1 "O")
    (setq ESPO "E")
    (setq ESPO "")
  )
  (cond
    ((and (= oppremar 1))
      (if (or (= cero1 0)(= codigo1 "0"))
	(setq tt (strcat numero1 ESPO "%%c" fi1 "Cd Cero"))
	(setq tt (strcat numero1 ESPO "%%c" fi1 "Cd" codigo1))
      )
    )
    ((and (= oppremar 2)(= Mfija1 "0"))
      (setq tt (strcat numero1 ESPO "%%c" fi1 "Mc" Mglobal1))
    )
    ((and (= oppremar 2)(= Mfija1 "1"))
      (setq tt (strcat numero1 ESPO "%%c" fi1 "Mc" Mmarca1))
    )
  )
  tt
)

 -----------------------------------------
(DEFUN MOVERROTAR (ent aa posic punto angulo)
  (if (= posic 1)(command "_move" ent "" punto (polar punto (gra   0) (/ aa 2.0))));mf
  (if (= posic 2)(setq punto punto))
  (if (= posic 3)(command "_move" ent "" punto (polar punto (gra 180) (/ aa 2.0))));mf

  (command "_rotate" ent "" punto angulo)

)

; --------------------------------
(DEFUN REFLEJE (ent punto reflejo)
  (cond
    ((= reflejo 2)
      (command "_mirror" ent "" punto (polar punto (gra 90) 1) "_y");mf
    )
    ((= reflejo 3)
      (command "_mirror" ent "" punto (polar punto (gra 90) 1) "_y");mf
      (command "_mirror" ent "" punto (polar punto (gra  0) 1) "_y")
    )
    ((= reflejo 4)
      (command "_mirror" ent "" punto (polar punto (gra  0) 1) "_y")
    )
  )

)

;---------------------------------------------------------
(DEFUN DIBUJO (punto tipo layerace espace aa bb cc gg rr)
  (setvar "plinetype" 0)
  (setq rr (* rr 0.999))
  
  (command "_layer" "_m" layerace "")
  (cond
    ((or (= tipo "0") (and (= tipo "1")(<= gg 0.001 )))   ;TIPO-I1
      (command "_pline" (setq p1 punto) "_w" espace espace 
	    (setq p2 (polar p1 (gra 0)   aa)   ) ""
      )
      (setq pm (mapcar '/ (mapcar '+ p1 p2) (list 2 2 2)  )  )
    )
    ((and (= tipo "1")(> gg 0.001))   ;TIPO-I
      (command "_pline" (setq p1 punto) "_w" espace espace 
	    (setq p2 (polar p1 (gra 180) (- gg rr))       ) 
	"_a" (setq p3 (polar p2 (gra  90) (* rr 2))        ) 
	"_l" (setq p4 (polar p3 (gra   0) (- aa (* 2 rr))) ) 
	"_a" (setq p5 (polar p4 (gra 270) (* rr 2))        ) 
	"_l" (setq p6 (polar p5 (gra 180) (- gg rr))       ) ""
      )
      (setq pm (mapcar '/ (mapcar '+ p3 p4) (list 2 2 2)  )  )
    )
    ((= tipo "2")   ;TIPO-C
      (command "_pline" (setq p1 punto) "_w" espace espace 
	    (setq p2 (polar p1 (gra  90) bb)  ) 
	    (setq p3 (polar p2 (gra   0) aa)  ) 
	    (setq p4 (polar p3 (gra 270) bb)  ) ""
      )
      (setq pm (mapcar '/ (mapcar '+ p2 p3) (list 2 2 2)  )  )
    )
    ((= tipo "3")   ;TIPO-O
      (if (> gg 0.001)
	(progn
	  (command "_pline" (setq p1 punto) "_w" espace espace 
		(setq p2  (polar p1 (gra 135) (- gg rr))       )    
	    "_a" (setq p3  (polar (setq centro (polar p2 (gra  45)  rr)) (gra  90)  rr)  )       
	    "_l" (setq p4  (polar p3 (gra   0) (- aa (* 2 rr))) )  
	    "_a" (setq p5  (polar centro (gra 0) (- aa rr))     ) 
	    "_l" (setq p6  (polar p5 (gra 270) (- bb (* 2 rr))) ) 
	    "_a" (setq p7  (polar p4 (gra 270) bb)              ) 
	    "_l" (setq p8  (polar p7 (gra 180) (- aa (* 2 rr))) ) 
	    "_a" (setq p9  (polar p6 (gra 180) aa)              ) 
	    "_l" (setq p10 (polar p9 (gra  90) (- bb (* 2 rr))) ) 
	    "_a" (setq p11 (polar centro (gra  45) rr)          ) 
	    "_l" (setq p12 (polar p11 (gra -45) (- gg rr))      ) ""
	  )
	  (setq pm (mapcar '/ (mapcar '+ p9 p5) (list 2 2 2)  )  )
	)
	(progn
	  (command "_pline" (setq p1 punto) "_w" espace espace 
		(setq p2 (polar p1 (gra   0) (- aa (* 2 rr))) )      
	    "_a" (setq p3 (polar (polar p2 (gra 270)  rr) (gra  0)  rr)  )       
	    "_l" (setq p4 (polar p3 (gra 270) (- bb (* 2 rr))) )  
	    "_a" (setq p5 (polar p2 (gra 270) bb)              ) 
	    "_l" (setq p6 (polar p5 (gra 180) (- aa (* 2 rr))) ) 
	    "_a" (setq p7 (polar p4 (gra 180) aa)              ) 
	    "_l" (setq p8 (polar p7 (gra  90) (- bb (* 2 rr))) ) "_a" "_cl"
	  )
	  (setq pm (mapcar '/ (mapcar '+ p7 p3) (list 2 2 2)  )  )
	)
      )
    )
    ((= tipo "4")   ;TIPO-L
      (if (> gg 0.001)
	(progn
	  (command "_pline" (setq p1 punto) "_w" espace espace 
		(setq p2 (polar p1 (gra 180) (- gg rr))       ) 
	    "_a" (setq p3 (polar p2 (gra 270) (* rr 2))        ) 
	    "_l" (setq p4 (polar p3 (gra   0) (- aa (* 2 rr))) ) 
		(setq p5 (polar p4 (gra  90) bb)              ) ""
	  )
	  (setq pm (mapcar '/ (mapcar '+ p3 p4) (list 2 2 2)  )  )
	)
	(progn
	  (command "_pline" (setq p1 punto) "_w" espace espace 
		(setq p2 (polar p1 (gra   0) aa)  ) 
		(setq p3 (polar p2 (gra  90) bb)  ) ""
	  )
	  (setq pm (mapcar '/ (mapcar '+ p1 p2) (list 2 2 2)  )  )
	)
      )
    )
    ((= tipo "5")   ;TIPO-G
      (command "_pline" (setq p1 punto) "_w" espace espace 
	    (setq p2 (polar p1 (gra  90) bb)  ) 
	    (setq p3 (polar p2 (gra   0) aa)  ) 
	    (setq p4 (polar p3 (gra 270) cc)  ) ""
      )
      (setq pm (mapcar '/ (mapcar '+ p2 p3) (list 2 2 2)  )  )
    )
  )
  
  (command "_move" (setq ent (entlast)) "" pm punto)
(setvar "plinetype" VAR_PLINETYPE)
)

; ------------------------------------
(DEFUN gra (angulo1)
  (setq angulo1 (/ (* angulo1 pi) 180))
)
; -------------------------------------
(DEFUN rad (angulo1)
  (setq angulo1 (/ (* angulo1 180) pi))
)

; -------------------------------------
(DEFUN corregdim ( / a4 b4 g2)
  (setq aa (atof aaa) bb (atof bbb) gg (atof ggg) rr (atof rrr))
  (setq a4 (/ aa 2.0))
  (setq b4 (abs (/ bb 2.0)))
  (setq g4 (/ gg 4.0))
  
  (if (and (> rr a4)(or (= tipo "1")(= tipo "3")(= tipo "4")))
    (setq rr a4)
  )  
  (if (and (> rr b4)(= tipo "3"))
    (setq rr b4)
  )  
  (if (and (> rr b4)(> b4 0.001)(= tipo "4"))
    (setq rr b4)
  )  
  (if (and (> rr g4)(or (= tipo "1")(= tipo "3")(= tipo "4")))
    (if (> gg 0.001)(setq rr g4))
  )
  (setq rrr (rtos rr 2 2))
  
  (if (or (= tipo "1")(= tipo "3")(= tipo "4"))
    (set_tile "r" rrr)
  )
)
; -------------------------------------
(DEFUN ESPECIAL ()
  (CARGAR "C:EJECUTAR" "layer-1")
  (setq opcionESP 0)
  (SETQ CAJA3 (NEW_DIALOG "especial" DCL1))
  
  (SET_TILE "tlayermar" layermar)
  (SET_TILE "tlayerace" layerace)
  (SET_TILE "altmar"    altmar)
  (SET_TILE "espace"    espace)
  (PONERSTYLELIST "stimarca" stylomarca)
  
  (if (= actua 1)(SET_TILE "marcas"        "1"))
  (if (= actua 2)(SET_TILE "aceros"        "1"))
  (if (= actua 3)(SET_TILE "marcasyaceros" "1"))
  
  (LAY layermar "imagenL1")
  (LAY layerace "imagenL2")
  
  (action_tile "layermar" "(setq layermar (C:EJECUTAR layermar)) (LAY layermar \"imagenL1\") (SET_TILE \"tlayermar\" layermar) ")
  (action_tile "layerace" "(setq layerace (C:EJECUTAR layerace)) (LAY layerace \"imagenL2\") (SET_TILE \"tlayerace\" layerace) ")
  
  (action_tile "imagenL1" "(setq opcionESP 2)(done_dialog)")
  (action_tile "imagenL2" "(setq opcionESP 3)(done_dialog)")
  
  (action_tile "stimarca" "(setq stylomarca (nth (atoi $value) stilist))")
  (action_tile "altmar"   "(setq altmar   (AR $value 10  2 \"altmar\")) ")
  (action_tile "espace"   "(setq espace   (AR $value 10  2 \"espace\")) ")
  
  (action_tile "marcas"        "(setq actua 1)")
  (action_tile "aceros"        "(setq actua 2)")
  (action_tile "marcasyaceros" "(setq actua 3)")
  
  (action_tile "actualizar"    "(setq opcionESP 1)(done_dialog)")

  (START_DIALOG)
  (DONE_DIALOG)
  ;(UNLOAD_DIALOG DCL1)
  
  (cond
    ((= opcionESP 0)
      (setq a a)
    )
    ((= opcionESP 2)
      (FUNKACOLOR layermar)
      (ESPECIAL)
    )
    ((= opcionESP 3)
      (FUNKACOLOR layerace)
      (ESPECIAL)
    )
    ((and (= opcionESP 1)(= actua 1))
      (CARGAR "C:MARCAS"        "cambiar")(C:MARCAS)
      (ESPECIAL)
    )
    ((and (= opcionESP 1)(= actua 2))
      (CARGAR "C:ACEROS"        "cambiar")(C:ACEROS)
      (ESPECIAL)
    )
    ((and (= opcionESP 1)(= actua 3))
      (CARGAR "C:MARCASYACEROS" "cambiar")(C:MARCASYACEROS)
      (ESPECIAL)
    )
  )
)
; -----------------------------------------
(DEFUN AYUDAS ()
  (CARGAR "C:EJECUTAR" "layer-1")
  (setq opcionAYU 0)
  (if (= tipoabc  nil)(setq tipoabc  "0"))
  (if (= mensajes nil)(setq mensajes "1"))
  (SETQ CAJA4 (NEW_DIALOG "ayudas" DCL1))
  
  (SET_TILE "tlayerest" layerest)
  (SET_TILE "tlayerpos" layerpos)
  (SET_TILE "tipoabc"  tipoabc)
  (SET_TILE "mensajes" mensajes)
  
  (LAY layerest "imagenL6")
  (LAY layerpos "imagenL7")
  
  (action_tile "layerest" "(setq layerest (C:EJECUTAR layerest)) (LAY layerest \"imagenL6\") (SET_TILE \"tlayerest\" layerest) ")
  (action_tile "layerpos" "(setq layerpos (C:EJECUTAR layerpos)) (LAY layerpos \"imagenL7\") (SET_TILE \"tlayerpos\" layerpos) ")
  
  (action_tile "tipoabc"  "(setq tipoabc  (atoa $value)) ")
  (action_tile "mensajes" "(setq mensajes (atoa $value)) ")
  
  (action_tile "imagenL6" "(setq opcionAYU 4)(done_dialog) ")
  (action_tile "imagenL7" "(setq opcionAYU 5)(done_dialog) ")
  
  (action_tile "contarest"  "(setq opcionAYU 1)(done_dialog) ")
  (action_tile "contarpos"  "(setq opcionAYU 2)(done_dialog) ")
  (action_tile "obtenerabc" "(setq opcionAYU 3)(done_dialog) ")

  (START_DIALOG)
  (DONE_DIALOG)
 ;(UNLOAD_DIALOG DCL1)
  
  (cond
    ((= opcionAYU 4)
      (FUNKACOLOR layerest)
      (AYUDAS)
    )
    ((= opcionAYU 5)
      (FUNKACOLOR layerpos)
      (AYUDAS)
    )
    ((= opcionAYU 0)(PH1))
    ((= opcionAYU 1) (CARGAR "C:EST33" "obtener")(setq numero (C:EST33))(PH1))
    ((= opcionAYU 2) (CARGAR "C:POS33" "obtener")(setq numero (C:POS33))(PH1))
    ((= opcionAYU 3) (CARGAR "C:OBT33" "obtener")
      (if (= tipoabc "0")(setq aaa    (C:OBT33)))
      (if (= tipoabc "1")(setq bbb    (C:OBT33)))
      (if (= tipoabc "2")(setq ccc    (C:OBT33)))
      (if (= tipoabc "3")(setq ddd    (C:OBT33)))
      (if (= tipoabc "4")(setq eee    (C:OBT33)))
      (if (= tipoabc "5")(setq fff    (C:OBT33)))
      (if (= tipoabc "6")(setq ggg    (C:OBT33)))
      (if (= tipoabc "7")(setq angulo (C:OBT33)))
      (PH1)
    )
  )
  
)
; --------------------------------------
(DEFUN FUNKACOLOR (ll1 / c1 propl1 colo)
  (setvar "cmdecho" 0)
  (setq propl1 (tblsearch "layer" ll1)) 
  (if (= propl1 nil)
    (setq c1 7)
    (setq c1 (cdr (assoc 62 propl1)))
  )
  (setq colo (acad_colordlg c1))
  (if (and colo (/= colo 0)(/= colo 256))
    (command "_layer" "_s" ll1 "_c" colo "" "")
  )
  (setvar "clayer" layerANT)
  (setvar "cmdecho" old2)
)
; ------------------------------------
(DEFUN LAY (l1 k1 / propl1 c1)
  (setq propl1 (tblsearch "layer" l1)) 
  (if (= propl1 nil)
    (setq c1 0)
    (setq c1 (cdr (assoc 62 propl1)))
  )
  (TIPOGRA2 "L" "L" k1 c1)
  (setq pzx (1- (dimx_tile k1)))
  (setq pzy (1- (dimy_tile k1)))
  
  (if (= c1 7)
    (progn
      (start_image k1)
	(vector_image 0   0   pzx 0   0)
	(vector_image pzx 0   pzx pzy 0)
	(vector_image pzx pzy 0   pzy 0)
	(vector_image 0   pzy 0   0   0)
      (end_image)
    )
  )

)

; -----------------------------------------
(DEFUN C:PLANILLA ()
  (CARGAR "C:EJECUTAR" "layer-1")
  (setq opcionPLA 0)
  (SETQ CAJA5 (NEW_DIALOG "opciones" DCL1))
  
  (if (= numedema nil)(setq numedema "1"))
  
  (if (= dxmarca nil)(AR11x 1)(AR11x 0))  
  (if (= altprin nil)(AR11y 1)(AR11y 0))
  
  (foreach x '("elecM1" "elecM2" "elecM3" "elecM4" "elecM5" "elecM6" "elecM7" "elecM8" "elecM9" "elecM10")
    (set_tile x (eval (read x)))
    (action_tile x "(set (read $key) (atoa $value)) ")
  )                                 
  (foreach x '("M1" "M2" "M3" "M4" "M5" "M6" "M7" "M8" "M9" "M10")
    (set_tile x (eval (read x)))
    (action_tile x "(set (read $key) (AR $value 5 0 $key))")
  )                                 
  
  (if (< (strlen nomarch) 24)
    (set_tile "archivo" (strcat "File Name : " nomarch))
    (set_tile "archivo" (strcat "File : " nomarch))
  )
  
  (if (= podercalc 0)
    (progn
      (mode_tile "gralla1"   1)
      (mode_tile "veditar"   1)
      (mode_tile "reditar"   1)
      (mode_tile "dibuplani" 1)
      (mode_tile "dibuplani1" 1)
    )    
    (progn
      (mode_tile "gralla1"   0)
      (mode_tile "veditar"   0)
      (mode_tile "reditar"   0)
      (mode_tile "dibuplani" 0)
     ; (mode_tile "dibuplani1" 0)
   )    
  )

  (ACTION_TILE "calcular"  "(setq lista_para_corte nil)(setq opcionPLA 1)(done_dialog)") ;mf
  (ACTION_TILE "veditar"   "(setq opcionPLA 21)(done_dialog)")
  (ACTION_TILE "reditar"   "(setq opcionPLA 22)(done_dialog)")
  (ACTION_TILE "presentar" "(setq opcionPLA 3)(done_dialog)")
  
  (ACTION_TILE "dibuplani" "(setq opcionPLA 7)(done_dialog)")
   (ACTION_TILE "dibuplani1" "(setq opcionPLA 8)(done_dialog)")
  (ACTION_TILE "undopla"   "(setq opcionPLA 6)(done_dialog)") 
  
  (ACTION_TILE "gralla1" "(setq opcionPLA 4)(done_dialog)")
  (ACTION_TILE "gralla2" "(setq opcionPLA 5)(done_dialog)")

  (START_DIALOG)
  (DONE_DIALOG)
  ;(UNLOAD_DIALOG DCL1)
  
  (cond
    ((= opcionPLA 0)
      (if (= pro_grafico 1)(C:PH)(c:PH_NEW))
    )
    ((= opcionPLA 7)
      (INSERTPLA)
      (C:PLANILLA)
    )
    ((= opcionPLA 8)
      (INSERTPLA)
      (C:PLANILLA)
    )
    ((= opcionPLA 6)
      (C:PANZOON1)
      (C:PLANILLA)
    )
    ((= opcionPLA 1)
      (CARGAR "C:llamarTX" "datext")   
      (setq s1 nil stext (ssadd))
      (setq s11 (ssget  '((0 . "text"))))
      (if s11
	(progn
	  (setq s1 (ssget "p" '((0 . "text") (-3 ("acerTX")))))
	  (setq contar 0)
	  (while (setq en (ssname s11 contar))
	    (c:llamarTX en)
	    (if (= tieneV nil)(setq stext (ssadd en stext)))
	    (setq contar (1+ contar))
	  )
	)
      )
      (if s1 
	(CALCULAR)
	(alert "   Mark has not been selected   ")
      )
      (if (and s1 (= podercalc 1))
	(progn    
	  (setq opfi (OPFIN))
	  (CARGAR "GRABAR_RESPALDO" "cambiar")(GRABAR_RESPALDO)
	  (setq contar 0 selen (ssadd))
	  (repeat (length listentic)
	    (PONERFIJA (car (nth contar listentic)) (last (nth contar listentic)) 0)
	    (setq contar (1+ contar))
	  )
	  (LLAMAR_RESPALDO)
	  (if (= opfi 1)
	    (progn
	      (setq oppremar 2)
	      (C:CAMBIARTEXT 2)
	    )
	  )
	)
      )
      (C:PLANILLA)
    )
    ((= opcionPLA 21)
      (EDITAR)(C:PLANILLA)
    )
    ((= opcionPLA 22)
      (RESULTADOS)(C:PLANILLA)
    )
    ((= opcionPLA 3)
      (PRESENTAR)(C:PLANILLA)
    )
    ((= opcionPLA 4)
      (ARCH33 1)(C:PLANILLA)
    )
    ((= opcionPLA 5)
      (ARCH33 2)(C:PLANILLA)
    )
  )

)
; ----------------------------------------
(DEFUN OPFIN ()
  (SETQ CAJA55 (NEW_DIALOG "opcion" DCL1))
  (setq opfi 2)
  (set_tile "opfi2" "1")
  
  (ACTION_TILE "opfi1" "(setq opfi 1)")
  (ACTION_TILE "opfi2" "(setq opfi 2)")

  (START_DIALOG)
  (DONE_DIALOG)
  ;(UNLOAD_DIALOG DCL1)
  opfi  
)

; --------------------------------------
(DEFUN ARCH33 (nume / anANT nomarchdef)
  (setq anANT an)
  (if (= anANT nil)(setq nomarchdef "")(setq nomarchdef anANT))
  (cond
    ((= nume 1)
      (setq an (getfiled "S A V E  F I L E" nomarchdef "PLA" 3))
      (if (= an nil)
	(progn
	  (setq an anANT)
	  (if (= an nil)(setq nomarch "None"))
	)
	(progn
	  (setq nomarch an)
	  (setq listplaniAR (mapcar 'STL (mapcar 'LDplaniAR listplani)))
	  (setq listresulAR (mapcar 'STL (mapcar 'LDresulAR listresul)))
	  (setq ARCHI (open nomarch "w"))
	  (setq contar 0)
	  (while (nth contar listplaniAR)
	    (write-line (nth contar listplaniAR) ARCHI)
	    (setq contar (1+ contar))
	  )
	  (setq contar 0)
	  (while (nth contar listresulAR)
	    (write-line (nth contar listresulAR) ARCHI)
	    (setq contar (1+ contar))
	  )
	  (write-line (strcat "\"" wtot "\"") ARCHI)
	  (close ARCHI)
	  (setq listplaniAR nil listresulAR nil)
	)
      )
    )
    ((= nume 2)
      (setq an (getfiled "O P E N   F I L E" nomarchdef "PLA" 2))
      (if (= an nil)
	(progn
	  (setq an anANT)
	  (if (= an nil)(setq nomarch "None"))
	)
	(progn
	  (setq nomarch an)
	  (setq podercalc 1)
	  (setq listplani nil listresul nil listplani1 nil)
	  (setq ARCHI (open nomarch "r"))
	  (while (setq a (read-line ARCHI))
	    (setq a (eval (read (strcat "(list " a ")"))))
	    (if (= (length a) 1)
	      (setq wtot (car a))
	    )
	    (if (= (length a) 4)
	      (setq listresul (append listresul (list a)))
	    )
	    (if (> (length a) 4)
	      (progn
		(setq listplani (append listplani (list a)))
		(setq b nil contar1 0)
		(foreach x a
		  (if (or (< contar1 8)(> contar1 9))
		    (setq b (append b (list x)))
		  )
		  (setq contar1 (1+ contar1))
		) 
		(setq listplani1 (append listplani1 (list b)))
	      )
	    )
	  )
	  (close ARCHI)
	  (setq listplani1 (mapcar 'STL (mapcar 'LDplani listplani1)))
	  (setq listresul1 (mapcar 'STL (mapcar 'LDresul listresul)))
	  (setq listmar (mapcar 'car listplani))
	)
      )
    )
  )
)
; -------------------------------------
(DEFUN AVANCE (aakey ccalc / xpa xp x)
  (setq xpa (fix (+ (/ (* (- x2 x1) van) valor) x1)))
  (setq xp  (fix (+ (/ (* (- x2 x1) va ) valor) x1)))
  (setq x (1- xpa))
  (repeat (- xp xpa -1)
    (start_image aakey)
      (vector_image  x  y1  x  y2  ccalc)
    (end_image)
    (setq x (1+ x))
  ) 
)
; ----------------------------------
(DEFUN PONERFIJA (enti mcfij estim)  
  (if (= estim 0)
    (progn  
      (setq selen (ssadd enti selen))
      (c:llamarTX enti)
      (setq codigo  Wcodigo) 
      (setq Mfija   WMfija) 
      (if (= opfi 1)(setq Mfija "1"))
      (setq Mmarca  mcfij) 
      (setq Mglobal WMglobal) 
      (setq Mtipo   WMtipo)            
      (setq fi      Wfi) 
      (setq numero  Wnumero) 
      (setq reflejo Wreflejo)
      (setq posic   Wposic) 
      (setq fid  (itoa (- (length listfi)   (length (member fi listfi)))))
      (if (> (length listtipo) 7)  ; En cao de otro se asigna tipo por defecto
	(setq tipo "6")
	(setq tipo (itoa (- (length listtipo) (length (member Mtipo listtipo)))))
      )         
      (setq aaa Wa11   bbb Wb11   ccc Wc11    ddd Wd11    eee We11    fff Wf11    ggg Wg11   rrr Wr11)
      (setq HPL   WHPL) 
      (setq HTX   WHTX) 
      (c:grabarTX enti)
    )
    (progn
      (setq mcfifi (list enti mcfij))
      (setq listentic (append listentic (list mcfifi)))
    )
  )
)
; ------------------------------------------
(DEFUN BUSCARMARCA (WMglobal listmar / mcfi)
  (setq mcfi (itoa (1+ (atoi WMglobal))))
  (while (member mcfi listmar)
    (setq mcfi (itoa (1+ (atoi mcfi))))
  )
  mcfi
)
; -------------------------------------------
(DEFUN BUSCAR (WMglobal listver3 / iini ifin incc mcfi mcgl lipr)
  (setq marce nil)
  (setq iini 0 ifin (length listplani) incc 1)
  (while (< iini ifin)
    (setq mcfi (nth 0 (nth iini listplani)))
    (setq mcgl (itoa (* (fix (/ (atoi mcfi) 100.0)) 100)))
    (setq lipr (list (cddr (nth iini listplani))))
    (if (and (eq WMglobal mcgl)(member listver3 lipr))
      (setq marce mcfi    iini (1+ ifin))
    )
    (setq iini (+ iini incc))
  )
  marce
)
; --------------------------------------------
(DEFUN ELECM (vae)
  (setq vae (* (fix (/ vae 100.0)) 100) vaev 0)
  (if (and (= (itoa vae) M1) (= elecM1  "1"))(setq vaev 1))
  (if (and (= (itoa vae) M2) (= elecM2  "1"))(setq vaev 1))
  (if (and (= (itoa vae) M3) (= elecM3  "1"))(setq vaev 1))
  (if (and (= (itoa vae) M4) (= elecM4  "1"))(setq vaev 1))
  (if (and (= (itoa vae) M5) (= elecM5  "1"))(setq vaev 1))
  (if (and (= (itoa vae) M6) (= elecM6  "1"))(setq vaev 1))
  (if (and (= (itoa vae) M7) (= elecM7  "1"))(setq vaev 1))
  (if (and (= (itoa vae) M8) (= elecM8  "1"))(setq vaev 1))
  (if (and (= (itoa vae) M9) (= elecM9  "1"))(setq vaev 1))
  (if (and (= (itoa vae) M10)(= elecM10 "1"))(setq vaev 1))
  vaev
)
; ----------------------------------------------
(DEFUN PASOa (/ contar valor ls1)
  (set_tile "tcalc1" "Creating selection")(setq van 0 va 0)
  (setq s1f (ssadd) s1g (ssadd))
  (setq ls1 (sslength s1) valor ls1)
  (setq contar 0)
  (repeat ls1
    (setq e1 (ssname s1 contar))
    (c:llamarTX e1)
    (if (> (atoi Wcodigo) 0)
      (if (= WMfija "1")
	(if (= (ELECM (atoi WMmarca))  1)(setq s1f (ssadd e1 s1f)))
	(if (= (ELECM (atoi WMglobal)) 1)(setq s1g (ssadd e1 s1g)))
      )
    )
    (setq va (1+ va))
    (AVANCE "icalc1" 1)
    (setq contar (1+ contar) van va)
  )
  (set_tile "tcalc1" "Complete Selection")

  (setq listmar nil listmarprop nil listfalla nil)
  (set_tile "tcalc2" "Verify Marks")(setq van 0 va 0)
  (setq ls1f (sslength s1f) valor ls1f)
  (setq contar 0)
  (repeat ls1f
    (setq e1 (ssname s1f contar))
    (c:llamarTX e1)
    
    (setq listver (list WMmarca WMtipo Wfi Wa11 Wb11 Wc11 Wd11 We11 Wf11 Wg11)) 
    
    (if (= (member WMmarca listmar) nil)
      (setq listmar (append listmar (list WMmarca))  listmarprop (append listmarprop (list listver)))
      (if (= (member listver listmarprop) nil)
	(if (= (member WMmarca listfalla) nil)
	  (setq listfalla (append listfalla (list WMmarca)))
	)
      )
    )
    
    (setq va (1+ va))
    (AVANCE "icalc2" 1)
    (setq contar (1+ contar) van va)
  )
  
  (if (= ls1f 0)(progn(setq valor 3 van 0 va 0)(repeat valor(setq va (1+ va))(AVANCE "icalc2" 1)(setq van va)))) 
  (set_tile "tcalc2" "Verify complete")  
)
; --------------------------------------------
(DEFUN PASOb ()
  (setq listmar nil listplani nil listplani1 nil listentic nil listmarprop nil)
  (set_tile "tcalc1" "Grouping Firm Marks")(setq van 0 va 0)
  (setq ls1f (sslength s1f) valor ls1f)
  (setq contar 0)
  (repeat ls1f
    (setq e1 (ssname s1f contar))
    (c:llamarTX e1)
    (if (= WMtipo "G")
      (if (< (atof Wb11) 0.0)
	(setq Wb11 (rtos (* (atof Wb11) -1.0) 2 2) Wc11 (rtos (* (atof Wc11) -1.0) 2 2))
      )
    )
    (if (= (member WMmarca listmar) nil)
      (progn
	(setq enametextB (handent WHTX))
	(if (= enametextB nil)
	  (setq num 1)
	  (progn
	    (setq textB (cdr (assoc 1 (entget enametextB))))
	    (if (= textB nil)
	      (setq num 1)
	      (progn
		(setq snum (ssget "x" (list (cons 1 textB))))
		(setq snum (SELINT snum stext))
		(if snum
		  (setq num (1- (sslength snum)))
		  (setq num 1)
		)
	      )
	    )
	  )
	)
	(setq listver1 (list WMmarca (itoa (* num (atoi Wnumero))) WMtipo Wfi Wa11 Wb11 Wc11 Wd11 We11 Wf11 Wg11))
	(setq listver2 (list WMmarca (itoa (* num (atoi Wnumero))) WMtipo Wfi Wa11 Wb11 Wc11 Wd11 Wg11))
	
	(setq listmar (append listmar (list WMmarca))) 
	(setq listplani (append listplani (list listver1)))
	(setq listplani1 (append listplani1 (list listver2)))
      )
      (progn
	(setq valANT1 (assoc WMmarca listplani))
	(setq valANT2 (assoc WMmarca listplani1))
	(setq numeANT (nth 1 valANT1))
	(setq enametextB (handent WHTX))
	(if (= enametextB nil)
	  (setq num 1)
	  (progn
	    (setq textB (cdr (assoc 1 (entget enametextB))))
	    (if (= textB nil)
	      (setq num 1)
	      (progn
		(setq snum (ssget "x" (list (cons 1 textB))))
		(setq snum (SELINT snum stext))
		(if snum
		  (setq num (1- (sslength snum)))
		  (setq num 1)
		)
	      )
	    )
	  )
	)
	(setq numenuevo (itoa (+ (atoi numeANT) (* num (atoi Wnumero)))))
	(setq valPOS1 (list WMmarca numenuevo WMtipo Wfi Wa11 Wb11 Wc11 Wd11 We11 Wf11 Wg11))
	(setq valPOS2 (list WMmarca numenuevo WMtipo Wfi Wa11 Wb11 Wc11 Wd11 Wg11))
	(setq listplani (subst valPOS1 valANT1 listplani))
	(setq listplani1 (subst valPOS2 valANT2 listplani1))
      )
    )
    
    (setq va (1+ va))
    (AVANCE "icalc1" 1)
    (setq contar (1+ contar) van va)
  )
  
  (if (= ls1f 0)(progn(setq valor 3 van 0 va 0)(repeat valor(setq va (1+ va))(AVANCE "icalc1" 1)(setq van va)))) 
  (set_tile "tcalc1" "Group Firm complete")

  (set_tile "tcalc2" "Grouping global marks")(setq van 0 va 0)
  (setq ls1g (sslength s1g) valor ls1g)
  (setq contar 0)
  (repeat ls1g
    (setq e1 (ssname s1g contar))
    (c:llamarTX e1)
    (if (= WMtipo "G")
      (if (< (atof Wb11) 0.0)
	(setq Wb11 (rtos (* (atof Wb11) -1.0) 2 2) Wc11 (rtos (* (atof Wc11) -1.0) 2 2))
      )
    )
    (setq listver3 (list WMtipo Wfi Wa11 Wb11 Wc11 Wd11 We11 Wf11 Wg11))
    
    (setq marce (BUSCAR WMglobal listver3))
    
    (if (= marce nil)
      (progn
	(setq enametextB (handent WHTX))
	(if (= enametextB nil)
	  (setq num 1)
	  (progn
	    (setq textB (cdr (assoc 1 (entget enametextB))))
	    (if (= textB nil)
	      (setq num 1)
	      (progn
		(setq snum (ssget "x" (list (cons 1 textB))))
		(setq snum (SELINT snum stext))
		(if snum
		  (setq num (1- (sslength snum)))
		  (setq num 1)
		)
	      )
	    )
	  )
	)
	(setq WMmarcan (BUSCARMARCA WMglobal listmar))
	
	(setq listver1 (list WMmarcan (itoa (* num (atoi Wnumero))) WMtipo Wfi Wa11 Wb11 Wc11 Wd11 We11 Wf11 Wg11))
	(setq listver2 (list WMmarcan (itoa (* num (atoi Wnumero))) WMtipo Wfi Wa11 Wb11 Wc11 Wd11 Wg11))
	
	(setq listmar (append listmar (list WMmarcan))) 
	(setq listplani (append listplani (list listver1)))
	(setq listplani1 (append listplani1 (list listver2)))
	(PONERFIJA e1 WMmarcan 1)
      )
      (progn
	(setq valANT1 (assoc marce listplani))
	(setq valANT2 (assoc marce listplani1))
	(setq numeANT (nth 1 valANT1))
	(setq enametextB (handent WHTX))
	(if (= enametextB nil)
	  (setq num 1)
	  (progn
	    (setq textB (cdr (assoc 1 (entget enametextB))))
	    (if (= textB nil)
	      (setq num 1)
	      (progn
		(setq snum (ssget "x" (list (cons 1 textB))))
		(setq snum (SELINT snum stext))
		(if snum
		  (setq num (1- (sslength snum)))
		  (setq num 1)
		)
	      )
	    )
	  )
	)
	(setq numenuevo (itoa (+ (atoi numeANT) (* num (atoi Wnumero)))))
	(setq valPOS1 (list marce numenuevo WMtipo Wfi Wa11 Wb11 Wc11 Wd11 We11 Wf11 Wg11))
	(setq valPOS2 (list marce numenuevo WMtipo Wfi Wa11 Wb11 Wc11 Wd11 Wg11))
	(setq listplani (subst valPOS1 valANT1 listplani))
	(setq listplani1 (subst valPOS2 valANT2 listplani1))
	(PONERFIJA e1 marce 1)
      )
    )
    
    (setq va (1+ va))
    (AVANCE "icalc2" 1)
    (setq contar (1+ contar) van va)
  )
  
  (if (= ls1g 0)(progn(setq valor 3 van 0 va 0)(repeat valor(setq va (1+ va))(AVANCE "icalc2" 1)(setq van va)))) 
  (set_tile "tcalc2" "Group Global complete")

  (setq listmar (acad_strlsort listmar))
  (setq listplani (lord listmar listplani nil))
  (setq listplani1 (lord listmar listplani1 nil))  
)
; -----------------------------------------
(DEFUN PASOc ()  
  (set_tile "tcalc1" "Calculate Schedule")(setq van 0 va 0)
  (setq valor (length listplani))
  (repeat valor
    (setq listm (nth va listplani))
    (setq listm1 (nth va listplani1))
    (cond
      ((eq (nth 2 listm) "I1")
	(setq ldes (rtos (+ (atof (nth 4 listm)) (* 2 (atof (nth 10 listm)))) 2 2))
      )
      ((eq (nth 2 listm) "I")
	(setq ldes (rtos (+ (atof (nth 4 listm)) (* 2 (atof (nth 10 listm)))) 2 2))
      )
      ((eq (nth 2 listm) "C")
	(setq ldes (rtos (+ (atof (nth 4 listm)) (* 2 (atof (nth 5 listm)))) 2 2))
      )
      ((eq (nth 2 listm) "O")
	(setq ldes (rtos (+ (* 2 (atof (nth 4 listm))) (* 2 (atof (nth 5 listm))) (* 2 (atof (nth 10 listm)))) 2 2))
      )
      ((eq (nth 2 listm) "L")
	(setq ldes (rtos (+ (atof (nth 4 listm)) (abs (atof (nth 5 listm))) (atof (nth 10 listm))) 2 2))
      )
      ((eq (nth 2 listm) "G")
	(setq ldes (rtos (+ (atof (nth 4 listm)) (abs (atof (nth 5 listm))) (abs (atof (nth 6 listm)))) 2 2))
      )
      (T  ;(eq (nth 2 listm) "V") en caso de que la letra sea cualquier otra mf
	(setq ldes (rtos (+ (atof (nth 4 listm)) (atof (nth 5 listm)) (atof (nth 6 listm)) (atof (nth 7 listm)) (atof (nth 8 listm)) (atof (nth 9 listm)) (atof (nth 10 listm))) 2 2))        
      )
    )
    (if (> (atof ldes) 12)
      (setq nuvar12 (rtos (+ (* (/ (atof ldes) 12) (atof (nth 1 listm))) 0.5) 2 0))
      (setq nuvar12 (rtos (fix (+ (/ (atof (nth 1 listm)) (fix (/ 12 (atof ldes)))) 0.999)) 2 0))
    )
    (setq listp_s (append listm (list ldes nuvar12))) ; JJJ
    (setq listp1 (append listm1 (list ldes nuvar12)))
    
    (setq listplani (subst listp_s listm listplani))    
    (setq listplani1 (subst listp1 listm1 listplani1))    
    (setq va (1+ va))
    (AVANCE "icalc1" 1)
    (setq van va)
  )
  (set_tile "tcalc1" "Complete Calculation")

  (setq listresul '(("6"  "0.222" "0" "0.00")("8"  "0.395" "0" "0.00")("10" "0.617" "0" "0.00")("12" "0.888" "0" "0.00")("14" "1.208" "0" "0.00")("16" "1.578" "0" "0.00")("18" "2.000" "0" "0.00")("20" "2.466" "0" "0.00")("22" "2.984" "0" "0.00")("25" "3.853" "0" "0.00")("28" "4.834" "0" "0.00")("32" "6.310" "0" "0.00"))
  ) ; mf fi 6
  (setq wtot "0.00")
  (set_tile "tcalc2" "Calculate Results")(setq van 0 va 0)
  (setq valor (length listplani))
  (repeat valor
    (setq listm (nth va listplani))
    (setq fimm (nth 3 listm))
    (setq listmm (assoc fimm listresul))
    (setq listwm (nth 1 listmm))
    (setq llmm (rtos (+ (atof (nth 2 listmm)) (* (atof (nth 1 listm)) (atof (nth 11 listm)))) 2 2))
; GNR   (setq llmm (itoa (+ (atoi (nth 2 listmm)) (* 12 (atoi (nth 12 listm))))))

    (setq listwt (rtos (* (atof listwm) (atof llmm)) 2 2))
; GNR   (setq listwt (rtos (* (atof listwm) (atoi llmm)) 2 2))
    
    (setq listp_s (list fimm listwm llmm listwt))
    (setq listresul (subst listp_s listmm listresul))
    
; GNR   (setq llmm (itoa (* 12 (atoi (nth 12 listm)))))
; GNR   (setq listwt (rtos (* (atof listwm) (atoi llmm)) 2 2))
; GNR   (setq wtot (rtos (+ (atof wtot) (atof listwt)) 2 2))

    (setq va (1+ va))
    (AVANCE "icalc2" 1)
    (setq van va)
  )
  (setq wtot (mapcar 'last listresul))                    ; GNR
  (setq wtot (eval (mapcar 'read (cons "+" wtot))))       ; GNR
  (setq wtot (rtos wtot 2 2))                             ; GNR

  (set_tile "tcalc2" "Complete Calculation")
 
   (setq listplani1 (mapcar 'STL (mapcar 'LDplani listplani1)))  
  (setq listresul1 (mapcar 'STL (mapcar 'LDresul listresul)))  

)
;---------------------------------------------------------
(DEFUN CALCULAR ()
  (setq nomarch "None")
  (SETQ CAJA6 (NEW_DIALOG "calcular" DCL1))
  
  (set_tile "tcalc1" "")(TIPOGRA2 "calcular" "calcular" "icalc1" 7)
  (set_tile "tcalc2" "")(TIPOGRA2 "calcular" "calcular" "icalc2" 7)  
  (setq x1 0 y1 0 x2 (dimx_tile "icalc1") y2 (dimy_tile "icalc1"))
  
  (PASOa)
	      
  (if (or (> (length listfalla) 0) (and (= (sslength s1f) 0)(= (sslength s1g) 0)))
    (progn
      (setq podercalc 0)
      (if (> (length listfalla) 0)
	(FALLAMAR listfalla)
	(alert "   Mark has not been selected   ")
      )
      (set_tile "tcalc2" "Calculo abortado.")
    )
    (progn
      (setq podercalc 1)
      (setq p 1)
      (repeat 33
	(set_tile "tcalc1" (substr "Complete Selection"    p 33));(TIPOGRA2 "calcular" "calcular" "icalc1" 1)
	(set_tile "tcalc2" (substr "Complete Verify" p 33));(TIPOGRA2 "calcular" "calcular" "icalc2" 1)
	(setq p (1+ p))
      )
      (set_tile "tcalc1" "")(TIPOGRA2 "calcular" "calcular" "icalc1" 7)
      (set_tile "tcalc2" "")(TIPOGRA2 "calcular" "calcular" "icalc2" 7)
      (PASOb)
      (setq p 1)
      (repeat 33
	(set_tile "tcalc1" (substr "Group complete" p 33));(TIPOGRA2 "calcular" "calcular" "icalc1" 1)
	(set_tile "tcalc2" (substr "Group complete" p 33));(TIPOGRA2 "calcular" "calcular" "icalc2" 1)
	(setq p (1+ p))
      )
      (set_tile "tcalc1" "")(TIPOGRA2 "calcular" "calcular" "icalc1" 7)
      (set_tile "tcalc2" "")(TIPOGRA2 "calcular" "calcular" "icalc2" 7)      
      (PASOc)
    )
  )  
  (START_DIALOG)  
  (DONE_DIALOG)  
  ;(UNLOAD_DIALOG DCL1)
)
; ---------------------------------------
(DEFUN FALLAMAR (listfalla / listafa)
  (SETQ CAJA77 (NEW_DIALOG "falla" DCL1))
  (setq listafa "Incorrects Marks: ")
  (foreach x listfalla
    (setq listafa (strcat listafa x "   "))
  )
  (set_tile "marcafalla" listafa)

  (START_DIALOG)
  ;(DONE_DIALOG)
  ;(UNLOAD_DIALOG DCL1)
)

; --------------------------------------------
(DEFUN EDITAR ()
  (SETQ CAJA7 (NEW_DIALOG "editar" DCL1))
  (set_tile "numermar" (itoa (length listplani1)))  
  (setq listplani11 nil contar 0 marcaANT 0)
  (while (setq a (nth contar listplani1))
    (setq b (* (fix (/ (atoi (substr a 1 5)) 100.0)) 100))
    (if (/= b marcaANT)
      (progn
	(setq listplani11 (append listplani11 (list (strcat "Mark " (itoa b)))))
	(setq marcaANT b)
      )
    )
    (setq lista_new (append lista_new (list a )))
    (setq listplani11 (append listplani11 (list a)))
    (setq contar (1+ contar))
  )  
  (start_list "editplani")
  (mapcar 'add_list listplani11)
  (end_list)
  (setq listplani11 nil)
  (print "Print generate list") ;b
    (print lista_new);b
    
  (START_DIALOG)
  (DONE_DIALOG)
  ;(UNLOAD_DIALOG DCL1)
)
; --------------------------------
(DEFUN RESTTFIS (resttfi)
  (if (= resttfi "1")
    (progn
      (setq listresul1 (mapcar 'STL (mapcar 'LDresul listresul)))
      (start_list "editresul")
      (mapcar 'add_list listresul1)
      (end_list)
    )
    (progn
      (setq listresull nil)
      (foreach x (list "6" "8" "10" "12" "14" "16" "18" "20" "22" "25" "28" "32");mf
	(if (>  (atof (last (assoc x listresul))) 0)
	  (setq listresull (append listresull (list (assoc x listresul))))
	)
      )
      (setq listresul1 (mapcar 'STL (mapcar 'LDresul listresull)))
      (start_list "editresul")
      (mapcar 'add_list listresul1)
      (end_list)
    )
  )
)
; -------------------------------------------
(DEFUN RESULTADOS ()
  (SETQ CAJA9 (NEW_DIALOG "resultados" DCL1))
  (if (= resttfi nil)(setq resttfi "0")) 
  (set_tile "restt" resttfi)
  (RESTTFIS resttfi)

  (action_tile "restt" "(setq resttfi (atoa $value))(RESTTFIS resttfi)")
  (set_tile "wtot" (strcat wtot " Kg"))
  
  (START_DIALOG)
  ;(DONE_DIALOG)
  ;(UNLOAD_DIALOG DCL1)
)
; -------------------------------------
(DEFUN AR11x (deff)
  (CONTNUNU)
  (if (<= (atof disx) 0.0)
    (setq dddxxx (atof disxdefa))
    (setq dddxxx (atof disx))
  )
  (setq pct (* (atof disxdefa) 100.0)  ddpor (/ dddxxx pct))
  (if (= deff 1)
    (progn
      (setq dxmarca  (rtos (* ddpor 0.80) 2 4))   ; GNR FEB 98  1.2 A 0.8
      (setq dxtipo   (rtos (* ddpor 0.80) 2 4))   ; GNR FEB 98  1.2 A 0.8
      (setq dxfi     (rtos (* ddpor 0.80) 2 4))   ; GNR FEB 98  1.2 A 0.8
      (setq dxnumero (rtos (* ddpor 0.80) 2 4))   ; GNR FEB 98  1.2 A 0.8
      (setq dxdim    (rtos (* ddpor 1.30) 2 4))
      (setq dxnv12   (rtos (* ddpor 1.30) 2 4))   ; GNR FEB 98  1.0 A 1.3 DXNV12 SE REDEFINE COMO LONG. TOTAL
      (SETQ DXPESO   (RTOS (* DDPOR 1.30) 2 4))   ; GNR FEB 98  CREADO ESTA VARIABLE
      (setq dxobs    (rtos (* ddpor 2.50) 2 4))   ; GNR FEB 98  2.5 A 2.7
    )
  )
  
; GNR FEB 98 AUMENTO DE DXPESO  (setq disxx (rtos (+ (atof dxmarca) (atof dxtipo) (atof dxfi) (atof dxnumero) (* (atof dxdim) nunu) (atof dxnv12) (atof dxobs)) 2 3))
  (setq disxx (rtos (+ (atof dxmarca) (atof dxtipo) (atof dxfi) (atof dxnumero) (* (atof dxdim) nunu) (atof dxnv12) (ATOF DXPESO) (atof dxobs)) 2 3))

  (set_tile "disxx"    disxx)
  (set_tile "dxmarca"  dxmarca)
  (set_tile "dxtipo"   dxtipo)
  (set_tile "dxfi"     dxfi)
  (set_tile "dxnumero" dxnumero)
  (set_tile "dxdim"    dxdim)
  (set_tile "dxnv12"   dxnv12)
  (set_tile "dxobs"    dxobs)
)
; --------------------------------
(DEFUN AR11y (deff)
  (if (<= (atof disx) 0.0)
    (setq dddxxx (atof disxdefa))
    (setq dddxxx (atof disx))
  )
  (setq pct (* (atof disxdefa) 100.0)  ddpor (/ dddxxx pct))
  (if (= deff 1)
    (progn
      (setq altprin  (rtos (* ddpor 1.20) 2 4))
      (setq altplan  (rtos (* ddpor 0.80) 2 4))
      (setq altdato  (rtos (* ddpor 0.50) 2 4))
      (setq alttprin (rtos (* ddpor 0.60) 2 4))
      (setq alttplan (rtos (* ddpor 0.25) 2 4))
      (setq alttdato (rtos (* ddpor 0.20) 2 4))
    )
  )
  (set_tile "altplan"  altplan)
  (set_tile "altdato"  altdato)
  (set_tile "alttprin" alttprin)
  (set_tile "alttplan" alttplan)
  (set_tile "alttdato" alttdato)
  (set_tile "altprin"  altprin)
)
; --------------------------------------
(DEFUN FORMAPLA ()
  (SETQ CAJA9 (NEW_DIALOG "forma" DCL1))
  
  (PONERSTYLELIST "stiprin" styloprin)
(PRINT "FIRST ")
  (PONERSTYLELIST "stiplan" styloplan)
(PRINT "SECOND ")
  (PONERSTYLELIST "stidato" stylodato)
(PRINT "THIRD ---")
  
  (if (= dxmarca nil)(AR11x 1)(AR11x 0))  
  (if (= altprin nil)(AR11y 1)(AR11y 0))
  
  (action_tile "defax" "(AR11x 1)")
  (action_tile "defay" "(AR11y 1)")
  
  (set_tile "numedema" numedema)
  (action_tile "altprin" "(setq altprin (AR $value 6 4 \"altprin\"))")
  (action_tile "altplan" "(setq altplan (AR $value 6 4 \"altplan\"))")
  (action_tile "altdato" "(setq altdato (AR $value 6 4 \"altdato\"))")
  (action_tile "alttprin" "(setq alttprin (AR $value 6 4 \"alttprin\"))")
  (action_tile "alttplan" "(setq alttplan (AR $value 6 4 \"alttplan\"))")
  (action_tile "alttdato" "(setq alttdato (AR $value 6 4 \"alttdato\"))")
  (action_tile "numedema" "(setq numedema (AR $value 6 0 \"numedema\"))")
  
  (action_tile "dxmarca"  "(setq dxmarca  (AR $value 6 4 \"dxmarca\")) (AR11x 0)")
  (action_tile "dxtipo"   "(setq dxtipo   (AR $value 6 4 \"dxtipo\"))  (AR11x 0)")
  (action_tile "dxfi"     "(setq dxfi     (AR $value 6 4 \"dxfi\"))    (AR11x 0)")
  (action_tile "dxnumero" "(setq dxnumero (AR $value 6 4 \"dxnumero\"))(AR11x 0)")
  (action_tile "dxdim"    "(setq dxdim    (AR $value 6 4 \"dxdim\"))   (AR11x 0)")
  (action_tile "dxnv12"   "(setq dxnv12   (AR $value 6 4 \"dxnv12\"))  (AR11x 0)")
  (action_tile "dxobs"    "(setq dxobs    (AR $value 6 4 \"dxobs\"))   (AR11x 0)")
  
  (set_tile "dxttipo"   (itoa (getindex dxttipo   (list "type_" "fi" "number"))))
  (set_tile "dxtfi"     (itoa (getindex dxtfi     (list "type_" "fi" "number"))))
  (set_tile "dxtnumero" (itoa (getindex dxtnumero (list "type_" "fi" "number"))))  
  (action_tile "stiprin" "(setq styloprin (nth (atoi $value) stilist))")
  (action_tile "stiplan" "(setq styloplan (nth (atoi $value) stilist))")
  (action_tile "stidato" "(setq stylodato (nth (atoi $value) stilist))")  
  (action_tile "dxttipo"   "(setq dxttipo   (nth (atoi $value)(list \"type_\" \"fi\" \"number\")))(tifinu 1)")
  (action_tile "dxtfi"     "(setq dxtfi     (nth (atoi $value)(list \"type_\" \"fi\" \"number\")))(tifinu 2)")
  (action_tile "dxtnumero" "(setq dxtnumero (nth (atoi $value)(list \"type_\" \"fi\" \"number\")))(tifinu 3)")

  (START_DIALOG)
)
; -------------------------------
(DEFUN tifinu (va1)
  (cond
    ((= va1 1)
      (if (eq dxttipo dxtfi)
	(progn
	  (if (and (eq dxttipo "type_"  )(eq dxtnumero "number"))(setq dxtfi "fi"    )) 
	  (if (and (eq dxttipo "number")(eq dxtnumero "type_"  ))(setq dxtfi "fi"    )) 
	  (if (and (eq dxttipo "type_"  )(eq dxtnumero "fi"    ))(setq dxtfi "number")) 
	  (if (and (eq dxttipo "fi"    )(eq dxtnumero "type_"  ))(setq dxtfi "number")) 
	  (if (and (eq dxttipo "number")(eq dxtnumero "fi"    ))(setq dxtfi "type_"  )) 
	  (if (and (eq dxttipo "fi"    )(eq dxtnumero "number"))(setq dxtfi "type_"  )) 
	)
      )
      (if (eq dxttipo dxtnumero)
	(progn
	  (if (and (eq dxttipo "type_"  )(eq dxtfi "number"))(setq dxtnumero "fi"    )) 
	  (if (and (eq dxttipo "number")(eq dxtfi "type_"  ))(setq dxtnumero "fi"    )) 
	  (if (and (eq dxttipo "type_"  )(eq dxtfi "fi"    ))(setq dxtnumero "number")) 
	  (if (and (eq dxttipo "fi"    )(eq dxtfi "type_"  ))(setq dxtnumero "number")) 
	  (if (and (eq dxttipo "number")(eq dxtfi "fi"    ))(setq dxtnumero "type_"  )) 
	  (if (and (eq dxttipo "fi"    )(eq dxtfi "number"))(setq dxtnumero "type_"  )) 
	)
      )
    )
    ((= va1 2)
      (if (eq dxtfi dxttipo)
	(progn
	  (if (and (eq dxtfi "type_"  )(eq dxtnumero "number"))(setq dxttipo "fi"    )) 
	  (if (and (eq dxtfi "number")(eq dxtnumero "type_"  ))(setq dxttipo "fi"    )) 
	  (if (and (eq dxtfi "type_"  )(eq dxtnumero "fi"    ))(setq dxttipo "number")) 
	  (if (and (eq dxtfi "fi"    )(eq dxtnumero "type_"  ))(setq dxttipo "number")) 
	  (if (and (eq dxtfi "number")(eq dxtnumero "fi"    ))(setq dxttipo "type_"  )) 
	  (if (and (eq dxtfi "fi"    )(eq dxtnumero "number"))(setq dxttipo "type_"  )) 
	)
      )
      (if (eq dxtfi dxtnumero)
	(progn
	  (if (and (eq dxtfi "type_"  )(eq dxttipo "number"))(setq dxtnumero "fi"    )) 
	  (if (and (eq dxtfi "number")(eq dxttipo "type_"  ))(setq dxtnumero "fi"    )) 
	  (if (and (eq dxtfi "type_"  )(eq dxttipo "fi"    ))(setq dxtnumero "number")) 
	  (if (and (eq dxtfi "fi"    )(eq dxttipo "type_"  ))(setq dxtnumero "number")) 
	  (if (and (eq dxtfi "number")(eq dxttipo "fi"    ))(setq dxtnumero "type_"  )) 
	  (if (and (eq dxtfi "fi"    )(eq dxttipo "number"))(setq dxtnumero "type_"  )) 
	)
      )
    )
    ((= va1 3)
      (if (eq dxtnumero dxtfi)
	(progn
	  (if (and (eq dxtnumero "type_"  )(eq dxttipo "number"))(setq dxtfi "fi"    )) 
	  (if (and (eq dxtnumero "number")(eq dxttipo "type_"  ))(setq dxtfi "fi"    )) 
	  (if (and (eq dxtnumero "type_"  )(eq dxttipo "fi"    ))(setq dxtfi "number")) 
	  (if (and (eq dxtnumero "fi"    )(eq dxttipo "type_"  ))(setq dxtfi "number")) 
	  (if (and (eq dxtnumero "number")(eq dxttipo "fi"    ))(setq dxtfi "type_"  )) 
	  (if (and (eq dxtnumero "fi"    )(eq dxttipo "number"))(setq dxtfi "type_"  )) 
	)
      )
      (if (eq dxtnumero dxttipo)
	(progn
	  (if (and (eq dxtnumero "type_"  )(eq dxtfi "number"))(setq dxttipo "fi"    )) 
	  (if (and (eq dxtnumero "number")(eq dxtfi "type_"  ))(setq dxttipo "fi"    )) 
	  (if (and (eq dxtnumero "type_"  )(eq dxtfi "fi"    ))(setq dxttipo "number")) 
	  (if (and (eq dxtnumero "fi"    )(eq dxtfi "type_"  ))(setq dxttipo "number")) 
	  (if (and (eq dxtnumero "number")(eq dxtfi "fi"    ))(setq dxttipo "type_"  )) 
	  (if (and (eq dxtnumero "fi"    )(eq dxtfi "number"))(setq dxttipo "type_"  )) 
	)
      )
    )
  )
  (set_tile "dxttipo"   (itoa (getindex dxttipo   (list "type_" "fi" "number"))))
  (set_tile "dxtfi"     (itoa (getindex dxtfi     (list "type_" "fi" "number"))))
  (set_tile "dxtnumero" (itoa (getindex dxtnumero (list "type_" "fi" "number"))))
)
; --------------------------------------------
(DEFUN INSERTPLA ()
  (setq ppla1 (getpoint "\nSpecify point 1: "))
  (if ppla1
    (progn
      (setq ppla2 (getpoint "\nSpecify point 2 or ENTER: "))
      (if ppla2
	(progn
	  (setq ppla1x (nth 0 ppla1))
	  (setq ppla1y (nth 1 ppla1))
	  (setq ppla2x (nth 0 ppla2))
	  (setq ppla2y (nth 1 ppla2))
	  (if (> ppla1x ppla2x)(setq ppla3x ppla1x    ppla1x ppla2x    ppla2x ppla3x))
	  (if (> ppla1y ppla2y)(setq ppla3y ppla1y    ppla1y ppla2y    ppla2y ppla3y))
	  (setq ppla12 (list ppla1x ppla2y))
	  (setq disx (rtos (- ppla2x ppla1x) 2 3))
	  (if (<= (atof disx) 0)
	    (setq disx disxx)
	    (progn (AR11x 1)(AR11y 1))
	  )
	  (setq dddxxx (atof disx))
	)
	(progn
	  (setq ppla12 ppla1)
	  (setq dddxxx (atof disxx))
	)
      )
      (if (= opcionPLA 7)(DIBUJARPLANILLA ppla12 dddxxx)(DIBUJARPLANILLA_CORTE ppla12 dddxxx))
    )
    (alert "   It cannot draw schedule   ")
  )
)
;*********** PLANILLA DE CORTE
(DEFUN DIBUJARPLANILLA_CORTE (ppla12 dddxxx)  
  (CARGAR "c:grabarplani" "datext")   
  (setq contar 0 contar1 0 numeespac 0)
  (setq dxmarca (atof dxmarca) dxtipo (atof dxtipo) dxfi (atof dxfi) dxnumero (atof dxnumero) dxdim (atof dxdim) dxnv12 (atof dxnv12) DXPESO (ATOF DXPESO) dxobs (atof dxobs)) ; GNR FEB 98 AUMENTO DXPESO  
  (setq dddxxx (+ dxmarca dxmarca dxnumero dxmarca dxmarca dxnumero dxmarca dxmarca dxnumero dxmarca dxmarca dxnumero dxmarca dxmarca)) ; 4 (MC LONG NO) 1(DESPERDICIO VALOR) 1 (CANTIDAD VALOR) 
  (setvar "cmdecho" 0)
  (setvar "osmode" 0)
  (setvar "plinewid" 0)
  ;PARA SETEAR A CERO EL VALOR DE PLINETYPE 2007-01-31 LC
  (setvar "plinetype" 0)
  (setvar "blipmode" 0)  
  (setvar "clayer" layerplal)
  (setq punto ppla12) 
  (setq punto11 ppla12) 
  (setq listdim (list 0.0 (atof altprin)))    
  (setq listdim (append listdim (list (atof altdato))))  
  (setq contar 0)  
  (foreach x listdim
    (setq punto (polar punto (gra 270) x))
    (command "_line" punto (polar punto (gra 0) dddxxx) "")    
    (setq contar (1+ contar))
    (if (= contar 1)(setq p1 punto))
    (if (= contar 2)(setq p2 punto))  
  )  
  (setvar "clayer" layerplat)
  (PONERTEXT p1 (distance p2 p1) (list dddxxx) (list "WASTES ANALYSIS") styloprin alttprin 1)
  (setq cont 0 fiANT "0" p33 p2);p4
  (setq listdim (list dxmarca dxmarca dxnumero dxmarca dxmarca dxnumero dxmarca dxmarca dxnumero dxmarca dxmarca dxnumero dxmarca dxmarca)) ; mf dxfi  uno mas 
  (setq listte (list  "Mc" "Long" "No." "Mc" "Long" "No" "Mc" "Long" "No" "Mc" "Long" "No" "Wast" "Bar")) ; mf +6
  (PONERTEXT p33 (atof altdato) listdim listte stylodato alttdato 1) 
  (setq p33 (polar p33 (gra 270) (atof altdato)))
  (setq listdim (list dxmarca dxmarca dxnumero dxmarca dxmarca dxnumero dxmarca dxmarca dxnumero dxmarca dxmarca dxnumero dxmarca dxmarca)) ; 4 (MC
  (setq p334 p33)
  (setq p222 p2)
  (foreach x listdim
     (setq p222 (polar p222 (gra 0) x))
     (setq p334 (polar p334 (gra 0) x))
     (command "_line" p222 p334 "")
  )
  (setq list_fi_temp (list "6" "8" "10"  "12"  "14"  "16"  "18"  "20"  "22"  "25"  "28"  "32"))  
  (setq list_cons_temp (list "0.222" "0.395" "0.617" "0.888" "1.208" "1.578" "2.000" "2.466" "2.984" "3.853" "4.834" "6.310")) ;mf 0.222
  (if lista_final ; contiene calcbulo de marcas por varillla
    (progn      
      (while (setq a (nth cont lista_final)); saca todas las varillas para cada fi fi   
	  (setq cont1 0)
	  (setq listdim13 (list dxobs dxmarca))
	   (setq lista_total1 nil)
	     (setq lista_total1 (append lista_total1 (list "Bars FI:")))
	     (setq lista_total1 (append lista_total1 (list (nth cont lista_corte_fi))))      
	     (setq dddxxx1 0.0)
	     (PONERTEXT (polar p33 (gra 0) dddxxx1) (atof altdato) listdim13 lista_total1 stylodato alttdato 1)          
	     (setq p4422 p33)
	  (setq p33 (polar p33 (gra 270) (atof altdato)))
	  (setq constante (nth (- (length list_fi_temp) (length(member (nth cont lista_corte_fi) list_fi_temp))) list_cons_temp))
	  (setq varillas_total 0)
	  (command "_line" p33 (polar p33 (gra 0) dddxxx) "")     
	  (setq p222 p33)
	  (setq lista_total_anterior nil)
	  (while (setq b (nth cont1 a)) ; saca marcas para una varilla
		(contar_incremento (cdr b))                                             
		(setq cont1 (1+ cont1))
	    )
	     (setq listdim13 (list dxmarca))
	     (setq lista_total1 nil)
	     (setq lista_total1 (append lista_total1 (list (rtos cantidad_varillas))))
	     (setq varillas_total (+ varillas_total cantidad_varillas))
	     (setq dddxxx1 (+ dxmarca dxmarca dxnumero dxmarca dxmarca dxnumero dxmarca dxmarca dxnumero dxmarca dxmarca dxnumero dxmarca))
	     (PONERTEXT (polar p33 (gra 0) dddxxx1) (atof altdato) listdim13 lista_total1 stylodato alttdato 1)
	     (setq p33 (polar p33 (gra 270) (atof altdato)))                 
	     (command "_line" p33 (polar p33 (gra 0) dddxxx) "")                       
	    (setq listdim (list dxmarca dxmarca dxnumero dxmarca dxmarca dxnumero dxmarca dxmarca dxnumero dxmarca dxmarca dxnumero dxmarca dxmarca)) ; 4 (MC       
	     (setq p334 p33)         
	     (foreach x listdim
		 (setq p222 (polar p222 (gra 0) x))
		(setq p334 (polar p334 (gra 0) x))
		(command "_line" p222 p334 "")
	     )
	    (setq listdim13 (list dxobs dxmarca dxobs dxmarca))
	   (setq lista_total1 nil)
	     (setq lista_total1 (append lista_total1 (list "TOTAL BARS:")))
	     (setq lista_total1 (append lista_total1 (list (rtos varillas_total))))
	     (setq lista_total1 (append lista_total1 (list "TOTAL Weight(Kg):")))
	     (setq lista_total1 (append lista_total1 (list (rtos(* varillas_total 12 (atof constante)) 2 2))))                        
	     (setq dddxxx1 (+ dxobs dxmarca))
	     (PONERTEXT (polar p4422 (gra 0) dddxxx1) (atof altdato) listdim13 lista_total1 stylodato alttdato 1)          
	  
	     ;(PONERTEXT (polar (polar p4422 0 (/ (atof altplan) 3.0)) (gra 270) (/ (atof alttdato) 2.0)) (atof altdato) (list dddxxx) (list (strcat "                             TOTAL VARILLAS: " (rtos varillas_total) "               TOTAL PESO(Kg): " (rtos(* varillas_total 12 (atof constante)) 2 2))) stylodato alttdato 0)   
	    ;(PONERTEXT (polar (polar p33 0 (/ (atof altplan) 3.0)) (gra 270) (/ (atof alttdato) 2.0)) (atof altdato) (list dddxxx) (list (strcat " TOTAL VARILLAS: " (rtos varillas_total) "   TOTAL PESO(Kg): " (rtos(* varillas_total 12 (atof constante)) 2 2))) stylodato alttdato 0)      
	    ;(setq p33 (polar p33 (gra 270) (atof altdato)))
	    ;  (command "_line" p33 (polar p33 (gra 0) dddxxx) "")                     
	     (setq cont (1+ cont))     
       )            
     )    
   )
   (command "_line" p1 p33 "")
   (command "_line" (polar p1 (gra 0) dddxxx) (polar p33 (gra 0) dddxxx)"")
   
  (setvar "TEXTSTYLE" stitextANT)
  (setvar "cmdecho" old2)
  (setvar "clayer" layerANT)
  (setvar "osmode" os)
  (setvar "plinewid" wideANT)
  ;AQUI ASIGNO LA VARIABLE ANTERIOR DE PLINETYPE 2007-01-31 LC
  (setvar "plinetype" VAR_PLINETYPE)
  (setvar "blipmode" blipmodeANT)
  (setq dxmarca (rtos dxmarca 2 4) dxtipo (rtos dxtipo 2 4) dxfi (rtos dxfi 2 4) dxnumero (rtos dxnumero 2 4) dxdim (rtos dxdim 2 4) dxnv12 (rtos dxnv12 2 4) DXPESO (rtos DXPESO 2 4) dxobs (rtos dxobs 2 4))
)

; -------------------------------------
(DEFUN DIBUJARPLANILLA (ppla12 dddxxx)
  (setq lista_para_corte nil) 
  (CARGAR "c:grabarplani" "datext")   
  (setq contar 0 marcaANT 0 numeespac 0)
  (if listplani
    (progn
      (while (setq a (nth contar listplani))
	(setq b (* (fix (/ (atoi (car a)) 100.0)) 100))
	(if (/= b marcaANT)
	  (progn
	    (setq marcaANT b)
	    (if (= contar 0)
	      (setq numeespac (+ numeespac 1))
	      (setq numeespac (+ numeespac 2))
	    )
	  )
	)
	(setq numeespac (1+ numeespac))
	(setq contar (1+ contar))
      )
    )
  )
  (setq numeespac (+ numeespac (atoi numedema)))
  (setq dxmarca (atof dxmarca) dxtipo (atof dxtipo) dxfi (atof dxfi) dxnumero (atof dxnumero) dxdim (atof dxdim) dxnv12 (atof dxnv12) DXPESO (ATOF DXPESO) dxobs (atof dxobs)) ; GNR FEB 98 AUMENTO DXPESO
  (setq dddxxx (+ dxmarca dxtipo dxfi dxnumero (* dxdim nunu) dxnv12 DXPESO dxobs)) ; GNR FEB 98 AUMENTO DXPESO
  (setq dxfi1 (* dddxxx 0.12) dxfi2 (/ dddxxx 13.5))  ; mf cambio por (* dddxxx 0.08)
  
  (setvar "cmdecho" 0)
  (setvar "osmode" 0)
  (setvar "plinewid" 0)
  ;PARA SETEAR A CERO EL VALOR DE PLINETYPE 2007-01-31 LC
  (setvar "plinetype" 0)
  (setvar "blipmode" 0)
  
  ;111111111111111111111111111111111111111111111111111111111111
  (setvar "clayer" layerplal)
  (setq punto ppla12)
  
  (setq listdim (list 0.0 (atof altprin) (atof altplan) (atof altplan) (atof altplan)))
  (repeat numeespac
    (setq listdim (append listdim (list (atof altdato))))
  )
  (setq listdim (append listdim (list (atof altplan))))
  (repeat 4
    (setq listdim (append listdim (list (atof altdato))))
  )
  (setq listdim (append listdim (list (* (atof altdato) 5.0))))
  (setq listdim (append listdim (list (/ (atof altplan) 4.0))))
  (setq listdim (append listdim (list (* (atof altplan) 10.0))))
  (setq listdim (append listdim (list (/ (atof altplan) 4.0))))
  (setq listdim (append listdim (list (* (atof altplan) 10.0))))
  
  (setq contar 0)
  (foreach x listdim
    (setq punto (polar punto (gra 270) x))
    (if (= contar 2)
      (command "_line" (setq p10 (polar punto (gra 0) (+ dxmarca dxtipo dxfi dxnumero))) (polar (polar punto (gra 0) dddxxx) (gra 180) (+ dxobs DXPESO dxnv12 dxdim)) "") ;GNR FEB 98 AUMENTO DXPESO
      (command "_line" punto (polar punto (gra 0) dddxxx) "")
    )
    (setq contar (1+ contar))
    (if (= contar 1)(setq p1 punto))
    (if (= contar 2)(setq p2 punto))
    (if (= contar 4)(setq p3 punto))
    (if (= contar 5)(setq p4 punto))
    
    (if (= contar (+ 5 numeespac))(setq p5 punto))
    (if (= contar (+ 5 numeespac 1))(setq p6 punto))
    (if (= contar (+ 5 numeespac 5))(setq p7 punto))
    (if (= contar (+ 5 numeespac 7))(setq p8 punto))
    (if (= contar (+ 5 numeespac 9))(setq p9 punto))
  )
  
  (setq d (+ (atof altprin) (* (atof altplan) 4.0) (* (atof altdato) (+ numeespac 9)))) 
  
  (PONERLINV p1 d (list 0.0 dddxxx)) 
  (PONERLINV p8 (* (atof altplan) 10.0) (list 0.0 dddxxx)) 
  (PONERLINV p9 (* (atof altplan) 10.0) (list 0.0 dddxxx)) 
  
  (PONERLINV p2 (* (atof altplan) 2.0) (list dxmarca dxtipo dxfi dxnumero (* dxdim (1- nunu)) dxdim dxnv12 DXPESO)) ; GNR FEBRERO 98
  (setq listdim nil)
  (repeat (- nunu 2)
    (setq listdim (append listdim (list dxdim)))
  )
  (PONERLINV p10 (atof altplan) listdim) 
  (setq listdim (list dxmarca dxtipo dxfi dxnumero))
  (repeat nunu 
    (setq listdim (append listdim (list dxdim)))
  )
  (setq listdim (append listdim (list dxnv12)))
  (setq listdim (append listdim (list DXPESO)))  ; GNR FEB 98
  (PONERLINV p4 (distance p5 p4) listdim) 
  (PONERLINV p6 (distance p7 p6) (list dxfi1 dxfi2 dxfi2 dxfi2 dxfi2 dxfi2 dxfi2 dxfi2 dxfi2 dxfi2 dxfi2 dxfi2)) ; mf dxfi2 uno mas
  ;  22222222222222222222222222222222222222222222222222
  
  (setvar "clayer" layerplat)
  (PONERTEXT p1 (distance p2 p1) (list dddxxx) (list "STEELS SCHEDULE") styloprin alttprin 1) 
  
  (setq listte "MARKS" marANT "0")
  (if listmar
    (progn
      (setq contar 0)
      (while (setq a (nth contar listmar))
	(setq a (itoa (* (fix (/ (atoi a) 100.0)) 100)))
	(if (/= a marANT)(setq listte (strcat listte " " a) marANT a))
	(setq contar (1+ contar))
      )
    )
  )
  (PONERTEXT p3 (distance p3 p4) (list dddxxx) (list listte) styloplan (/ (atof alttplan) 0.83333) 1) 
  
  (PONERTEXT p5 (distance p5 p6) (list dddxxx) (list "SUMMARY OF MATERIALS") styloplan (/ (atof alttplan) 0.83333) 1) 
  
; GNR FEB 98  (setq listdim (list dxmarca dxtipo dxfi dxnumero (* (1- nunu) dxdim)dxdim dxnv12 dxobs)) 
  (setq listdim (list dxmarca dxtipo dxfi dxnumero (* (1- nunu) dxdim) dxdim dxnv12 DXPESO dxobs)) ; GNR FEB 98 AUMENTO DE DXPESO
  (setq listte (list  "Mc")) 
  (if (and (eq dxttipo "type_")  (eq dxtfi "fi")    (eq dxtnumero "number"))(setq listte (append listte (list "type_" (list "%%c" "mm") "No."))))
  (if (and (eq dxttipo "type_")  (eq dxtfi "number")(eq dxtnumero "fi"))    (setq listte (append listte (list "type_" "No." (list "%%c" "mm")))))
  (if (and (eq dxttipo "fi")    (eq dxtfi "type_")  (eq dxtnumero "number"))(setq listte (append listte (list (list "%%c" "mm") "type_" "No."))))
  (if (and (eq dxttipo "fi")    (eq dxtfi "number")(eq dxtnumero "type_"))  (setq listte (append listte (list (list "%%c" "mm") "No." "type_"))))
  (if (and (eq dxttipo "number")(eq dxtfi "type_")  (eq dxtnumero "fi"))    (setq listte (append listte (list "No." "type_" (list "%%c" "mm")))))
  (if (and (eq dxttipo "number")(eq dxtfi "fi")    (eq dxtnumero "type_"))  (setq listte (append listte (list "No." (list "%%c" "mm") "type_"))))
; GNR FEB (setq listte (append listte (list  (list "DIMENSIONES" "" "") (list "LONG." "Desar." "(m)") (list "No." "Var.") "Observ."))) 
  (setq listte (append listte (list  (list "DIMENSIONS" "" "") (list "LONG." "Desar." "(m)") (list "LONG." "TOTAL" "m") (LIST "Weight" "(Kg)") "Observ."))) 

  (PONERTEXT p2 (distance p2 p3) listdim listte styloplan alttplan 1) 
  
  (setq listdim (list dxfi1      dxfi2 dxfi2 dxfi2 dxfi2 dxfi2 dxfi2 dxfi2 dxfi2 dxfi2 dxfi2 dxfi2 dxfi2)) ; mf dxfi  uno mas 
  (setq listte (list  "%%c (mm)" "6" "8"   "10"  "12"  "14"  "16"  "18"  "20"  "22"  "25"  "28"  "32")) ; mf +6
  (PONERTEXT p6 (atof altdato) listdim listte styloplan (* 0.9 (atof alttdato)) 1) 
  
  (setq listdim (list dxfi1      dxfi2 dxfi2 dxfi2 dxfi2 dxfi2 dxfi2 dxfi2 dxfi2 dxfi2 dxfi2  dxfi2 dxfi2)) ; mf dxfi2 uno mas
  (setq listte (list  "W (Kg/m)" "0.222" "0.395" "0.617" "0.888" "1.208" "1.578" "2.000" "2.466" "2.984" "3.853" "4.834" "6.310")) ;mf 0.222
  (PONERTEXT (polar p6 (gra 270) (atof altdato)) (atof altdato) listdim listte styloplan (* 0.9 (atof alttdato)) 1)  
  (PONERTEXT (polar p6 (gra 270) (* 2.0 (atof altdato))) (atof altdato) (list dxfi1) (list "L (m)") styloplan (* 0.9 (atof alttdato)) 1) 
  (PONERTEXT (polar p6 (gra 270) (* 3.0 (atof altdato))) (atof altdato) (list dxfi1) (list "PESO (Kg)") styloplan (* 0.9 (atof alttdato)) 1) 
  
  (setq listdim (list dxdim dxdim dxdim)) 
  (setq listte  (list "a" "b" "c")) 
  (if (= pd "1")(setq listdim (append listdim (list dxdim)) listte (append listte (list "d"))))
  (if (= pe "1")(setq listdim (append listdim (list dxdim)) listte (append listte (list "e"))))
  (if (= pf "1")(setq listdim (append listdim (list dxdim)) listte (append listte (list "f"))))
  (if (= pg "1")(setq listdim (append listdim (list dxdim)) listte (append listte (list "g"))))
  (PONERTEXT p10 (atof altplan) listdim listte styloplan alttplan 1) 

  (setq listdim (list (/ dddxxx 2.0) (/ dddxxx 2.0))) 
  (setq listte (list (list "Wtot (Kg) =" "CONCRETE f'c = 210 Kg/cm2" "COLUMNS (m3) = 0.00" "BEAM (m3)    = 0.00") (list "SLAB 1 (m3)   = 0.00" "SLAB 2 (m3)   = 0.00" "No. BLOCKS SLAB 1 (40x20x15) = 0" "No. BLOCKS SLAB 2 (20x20x15) = 0"))) 
  (PONERTEXT (polar p7 0 (/ (atof altplan) 3.0)) (* 5.0 (atof altdato)) listdim listte styloplan alttdato 0) 
  
  (setq listdim (list (/ dddxxx 2.0))) 
  (setq listte (list "BARS TYPES:")) 
  (PONERTEXT (polar p8 0 (/ (atof altplan) 3.0)) (* 2.0 (atof altplan)) listdim listte styloplan alttdato 0) 
  
  (setq listdim (list (/ dddxxx 2.0))) 
 (setq listte (list (list espt1 espt2 espt3 espt4 espt5)))  ; mf especific
  (PONERTEXT (polar p9 0 (/ (atof altplan) 3.0)) (* 6.0 (atof altplan)) listdim listte styloplan 
alttdato 0) 
  
  ;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  
  (setq listdim (list dxmarca dxtipo dxfi dxnumero))
  (repeat nunu (setq listdim (append listdim (list dxdim))))
  (setq listdim (append listdim (list dxnv12 DXPESO dxobs))) ; GNR FEB 98 AUMENTO DXPESO


  (if listplani
    (progn
      (setq cont 0 marANT "0" p33 p4)
      (while (setq a (nth cont listplani))
	(setq a1 (nth 0 a) a2 (nth 2 a) a3 (nth 3 a) a4 (nth 1 a) a5 (cdr (cdr (cdr (cdr a)))))
	(setq a6 (itoa (* (fix (/ (atoi a1) 100.0)) 100)))
	(if (/= a6 marANT)
	  (progn
	    (setq marANT a6)
	    (if (> cont 0)(setq p33 (polar p33 (gra 270) (atof altdato))))
	    (PONERTEXT (polar (polar p33 0 (/ (atof altplan) 3.0)) (gra 270) (/ (atof alttdato) 2.0)) (atof altdato) (list dddxxx) (list (strcat "Mark " a6)) stylodato alttdato 0) 
	    (setq p33 (polar p33 (gra 270) (atof altdato)))
	  )
	)
	(setq a1 (nth 0 a) a2 (nth 2 a) a3 (nth 3 a) a4 (nth 1 a) a5 (cdr (cdr (cdr (cdr a)))))
	(setq listte (list a1)) 
	(if (eq dxttipo "type_")    (setq listte (append listte (list a2))))
	(if (eq dxttipo "fi")      (setq listte (append listte (list a3))))
	(if (eq dxttipo "number")  (setq listte (append listte (list a4))))
	(if (eq dxtfi "type_")      (setq listte (append listte (list a2))))
	(if (eq dxtfi "fi")        (setq listte (append listte (list a3))))
	(if (eq dxtfi "number")    (setq listte (append listte (list a4))))
	(if (eq dxtnumero "type_")  (setq listte (append listte (list a2))))
	(if (eq dxtnumero "fi")    (setq listte (append listte (list a3))))
	(if (eq dxtnumero "number")(setq listte (append listte (list a4))))     
	(setq listte (append listte (list (nth 0 a5))))
	(setq listte (append listte (list (nth 1 a5))))
	(setq listte (append listte (list (nth 2 a5))))
	(if (eq pd "1")(setq listte (append listte (list (nth 3 a5)))))
	(if (eq pe "1")(setq listte (append listte (list (nth 4 a5)))))
	(if (eq pf "1")(setq listte (append listte (list (nth 5 a5)))))
	(setq listte (append listte (list (nth 6 a5))))
	(setq listte (append listte (list (nth 7 a5))))
;        (setq listte (append listte (list (nth 8 a5))))
	(SETQ listte (APPEND listte (LIST (RTOS (* (ATOF A4)(ATOF (NTH 7 A5))) 2 2)))) ;; GNR FEB 98
	(SETQ listte (append listte (list (calcularpeso a3 (RTOS (* (ATOF A4)(ATOF (NTH 7 A5))) 2 2))))) ; gnr feb 98
	(setq listte (append listte (list "Observation")))
	(lista_corte listte)
	(print listte)(print listdim)   ;   GNR feb 98
	(PONERTEXT p33 (atof altdato) listdim listte stylodato alttdato 1) 
	(setq p33 (polar p33 (gra 270) (atof altdato))) 
	(setq cont (1+ cont))
	(c:grabarplani (reverse (cdr (reverse listena))))

;;;;  GNR FEBRERO 98
      )
      ;*******************
      (setq lista_prueba nil)
      (foreach x listfi
	(if (saqueli x lista_para_corte)
		 (setq lista_prueba (cons (saqueli x lista_para_corte) lista_prueba))
	) 
      )    
      (analisis_corte)
      (analisis_fi)
      ;*******************
    )    
  )
  (setq listdim (list dxfi2 dxfi2 dxfi2 dxfi2 dxfi2 dxfi2 dxfi2 dxfi2 dxfi2 dxfi2 dxfi2 dxfi2))  ; mf dxfi2 
  (setq listte (mapcar 'caddr listresul))
  (PONERTEXT (polar (polar p6 (gra 270) (* 2.0 (atof altdato))) 0 dxfi1) (atof altdato) listdim listte styloplan (* 0.9 (atof alttdato)) 1) 
  (setq listename1 listena)

  (setq listte (mapcar 'cadddr listresul))
  (PONERTEXT (polar (polar p6 (gra 270) (* 3.0 (atof altdato))) 0 dxfi1) (atof altdato) listdim listte styloplan (* 0.9 (atof alttdato)) 1) 
  (setq listename2 listena)
  
  (setq listdim (list (/ dddxxx 2.0))) 
  (setq listte (list (list Wtot "" "" ""))) 
  (PONERTEXT (polar p7 0 (* (atof alttdato) 14.0)) (* 5.0 (atof altdato)) listdim listte styloplan alttdato 0) 
  (setq listena (append listena listename1 listename2) listename1 nil listename2 nil)
  (c:grabarplani listena)
  
  (setvar "TEXTSTYLE" stitextANT)
  (setvar "cmdecho" old2)
  (setvar "clayer" layerANT)
  (setvar "osmode" os)
  (setvar "plinewid" wideANT)
  ;AQUI ASIGNO LA VARIABLE ANTERIOR DE PLINETYPE 2007-01-31 LC
  (setvar "plinetype" VAR_PLINETYPE)
  (setvar "blipmode" blipmodeANT)
  (setq dxmarca (rtos dxmarca 2 4) dxtipo (rtos dxtipo 2 4) dxfi (rtos dxfi 2 4) dxnumero (rtos dxnumero 2 4) dxdim (rtos dxdim 2 4) dxnv12 (rtos dxnv12 2 4) DXPESO (rtos DXPESO 2 4) dxobs (rtos dxobs 2 4))
  (mode_tile "dibuplani1" 0)
)
;*****************

(defun analisis_corte()
;  (mapcar 'analiss (mapcar 'mapcar (listarepetir 'cdr lista_prueba) lista_prueba) (listarepetir 12 lista_prueba))
  (setq lista_final (mapcar 'analifinal (mapcar 'mapcar (listarepetir 'cdr lista_prueba) lista_prueba) (listarepetir 12 lista_prueba)))
)
(defun analisis_fi()
   (setq lista_corte_fi nil)
   (foreach x lista_prueba
     (if (= lista_corte_fi nil)
       (setq lista_corte_fi (list (car(car x))))
       (setq lista_corte_fi (cons (car(car x)) lista_corte_fi)))               
     )
     (setq lista_corte_fi (reverse lista_corte_fi))
)
;*************
(DEFUN LISTA_CORTE(list_corte / a_c b_c c_c)
      (setq list_temp nil)
      (setq a_c (nth 0 list_corte)) ; valor de la marca            
      (setq b_c (nth 3 list_corte)) ; cantidad de hierros
      (setq c_c (nth 8 list_corte)) ; longitud desa
      (setq d_c (nth 2 list_corte)) ; valor de fi
      (setq list_temp (list d_c a_c (atof c_c) (atoi b_c)))      
      (if (/= lista_para_corte nil)
	(setq lista_para_corte(append lista_para_corte (list list_temp)))
	(setq lista_para_corte(list list_temp))
      )
      
 )

;-------------------------------------------------
(DEFUN PONERTEXT (punto dy listax listatext stylo hei cent)
  (setq contar 0 listena nil)
  (while (nth contar listax)
    (setq ax (nth contar listax))
    (setq at (nth contar listatext))
    (if (eq (type at) (read "STR"))
      (if (= cent 1)
	(command "_text" "_s" stylo "_j" "_m" (polar (polar punto 0 (/ ax 2.0)) (gra 270) (/ dy 2.0)) hei 0 at)
	(command "_text" "_s" stylo (polar punto (gra 270) (/ dy 2.0)) hei 0 at)
      )
      (progn
	(setq contar1 0)
	(while (nth contar1 at)
	  (setq p (polar (polar punto 0 (/ ax 2.0)) (gra 270) (* (1+ contar1) (/ dy (1+ (length at))))   ))
	  (setq p1 (polar punto (gra 270) (* (1+ contar1) (/ dy (1+ (length at))))   ))
	  (if (/= (nth contar1 at) "")
	    (if (= cent 1)
	      (command "_text" "_s" stylo "_j" "_m" p hei 0 (nth contar1 at))
	      (command "_text" "_s" stylo p1 hei 0 (nth contar1 at))
	    )
	  )
	  (setq contar1 (1+ contar1))
	)
      )
    )
    (setq punto (polar punto 0 ax))
    (setq contar (1+ contar))
    (setq listena (append listena (list (entlast))))
  )
)
;-----------------------------------------
(DEFUN PONERLINV (punto dy listax)
  (foreach x listax
    (setq punto (polar punto (gra 0) x))
    (command "_line" punto (polar punto (gra 270) dy) "")
  )
)
;----------------------------------------
(DEFUN CONTNUNU ()
  (setq nunu 1)
  (if (= pa "1")(setq nunu (1+ nunu)))
  (if (= pb "1")(setq nunu (1+ nunu)))
  (if (= pc "1")(setq nunu (1+ nunu)))
  (if (= pd "1")(setq nunu (1+ nunu)))
  (if (= pe "1")(setq nunu (1+ nunu)))
  (if (= pf "1")(setq nunu (1+ nunu)))
  (if (= pg "1")(setq nunu (1+ nunu)))
  
  (if (= nunu 5)(setq disxdefa "0.150"))
  (if (= nunu 6)(setq disxdefa "0.163"))
  (if (= nunu 7)(setq disxdefa "0.176"))
  (if (= nunu 8)(setq disxdefa "0.189"))
)
;-------------------------------------------
(DEFUN PRESENTAR ()
  (setq opcionPRE 0)
  (SETQ CAJA8 (NEW_DIALOG "presentar" DCL1))
;*******************
  (set_tile "esptec1" espt1); mf para personalizar las especificaciones
  (set_tile "esptec2" espt2); mf para personalizar las especificaciones
  (set_tile "esptec3" espt3); mf para personalizar las especificaciones
  (set_tile "esptec4" espt4); mf para personalizar las especificaciones
  (set_tile "esptec5" espt5); mf para personalizar las especificaciones
;*******************  
  (SET_TILE "tlayerplat" layerplat)
  (SET_TILE "tlayerplal" layerplal)
  
  (SET_TILE "disx" disx)
  (if (= dxmarca nil)(AR11x 1)(AR11x 0))  
  (if (= altprin nil)(AR11y 1)(AR11y 0))
  
  (LAY layerplat "imagenL3")
  (LAY layerplal "imagenL4")
  
  (foreach x '("pa" "pb" "pc" "pg")
    (set_tile x "1")
  )                                 
  
  (foreach x '("pd" "pe" "pf")
    (set_tile x (eval (read x)))
  )                                 
  
  (action_tile "pa" "(setq pa \"1\")(set_tile \"pa\" \"1\")")
  (action_tile "pb" "(setq pb \"1\")(set_tile \"pb\" \"1\")")
  (action_tile "pc" "(setq pc \"1\")(set_tile \"pc\" \"1\")")
  (action_tile "pg" "(setq pg \"1\")(set_tile \"pg\" \"1\")")
    
  (action_tile "pd" "(setq pd (atoa $value))(CONTNUNU)(AR11x 1)(AR11y 1)")
  (action_tile "pe" "(setq pe (atoa $value))(CONTNUNU)(AR11x 1)(AR11y 1)")
  (action_tile "pf" "(setq pf (atoa $value))(CONTNUNU)(AR11x 1)(AR11y 1)")
  
  (action_tile "layerplat" "(setq layerplat (C:EJECUTAR layerplat)) (LAY layerplat \"imagenL3\") (SET_TILE \"tlayerplat\" layerplat) ")
  (action_tile "layerplal" "(setq layerplal (C:EJECUTAR layerplal)) (LAY layerplal \"imagenL4\") (SET_TILE \"tlayerplal\" layerplal) ")
  
  (action_tile "undopre"  "(setq opcionPRE 2)(done_dialog)")
  (action_tile "picpun"   "(setq opcionPRE 3)(done_dialog)")
  
  (action_tile "imagenL3"   "(setq opcionPRE 4)(done_dialog)")
  (action_tile "imagenL4"   "(setq opcionPRE 5)(done_dialog)")  
  (action_tile "formapla" "(setq opcionPRE 44)(done_dialog)")
;************
 (action_tile "esptec1" "(setq espt1 $value)")
 (action_tile "esptec2" "(setq espt2 $value)")
 (action_tile "esptec3" "(setq espt3 $value)")
 (action_tile "esptec4" "(setq espt4 $value)")
 (action_tile "esptec5" "(setq espt5 $value)")
;*******
  
  (START_DIALOG)
  (DONE_DIALOG)
  ;(UNLOAD_DIALOG DCL1)

  (cond
    ((= opcionPRE 4)
      (FUNKACOLOR layerplat)
      (PRESENTAR)
    )
    ((= opcionPRE 5)
      (FUNKACOLOR layerplal)
      (PRESENTAR)
    )
    ((= opcionPRE 44)
      (FORMAPLA)
      (PRESENTAR)
    )
    
    ((= opcionPRE 3)
      (setq ppla1 (getpoint "\nSpecify point 1: "))
      (setq ppla2 (getpoint "\nSpecify point 2 or ENTER: "))
      (if (and ppla1 ppla2)
	(progn
	  (setq ppla1x (nth 0 ppla1))
	  (setq ppla1y (nth 1 ppla1))
	  (setq ppla2x (nth 0 ppla2))
	  (setq ppla2y (nth 1 ppla2))
	  (if (> ppla1x ppla2x)(setq ppla3x ppla1x    ppla1x ppla2x    ppla2x ppla3x))
	  (if (> ppla1y ppla2y)(setq ppla3y ppla1y    ppla1y ppla2y    ppla2y ppla3y))
	  (setq ppla12 (list ppla1x ppla2y))
	  (setq disx (rtos (- ppla2x ppla1x) 2 3))
	  (setq dxmarca nil altprin nil)
	)
      ) 
      (if (and ppla1 (= ppla2 nil))
	(setq disx "0.000" dxmarca nil altprin nil)
      ) 
      (PRESENTAR)
    )
    ((= opcionPRE 2)
      (C:PANZOON1)(PRESENTAR)
    )
  )
)

;------------------------------------
(DEFUN TIPOGRA (SLD1 mode0 / ancho alto mod1 mod0 mode0)
;  (SETQ  tipo (get_tile "tipo"))
  (setq M (itoa reflejo))
  
  (foreach mod1 (list "a" "b" "c" "d" "e" "f" "g" "r")
     (mode_tile mod1 1)
     (set_tile mod1 "-------------")
  )
  (foreach mod0 mode0
     (mode_tile mod0 0)
     (if (= mod0 "a")(set_tile "a" aaa))
     (if (= mod0 "b")(set_tile "b" bbb))
     (if (= mod0 "c")(set_tile "c" ccc))
     (if (= mod0 "d")(set_tile "d" ddd))
     (if (= mod0 "e")(set_tile "e" eee))
     (if (= mod0 "f")(set_tile "f" fff))
     (if (= mod0 "g")(set_tile "g" ggg))
     (if (= mod0 "r")(set_tile "r" rrr))
  )
  (setq ancho (dimx_tile "Slide_C"))
  (setq alto (dimy_tile "Slide_C"))
  (start_image "Slide_C")
  (fill_image 0 0 (fix (* ancho 1.0)) alto 0)
  (slide_image 0 0 (fix (* 1.0 ancho)) (fix (* 1.0 alto))
     (strcat "acero" M "(" SLD1 ")")
  )
  (end_image)

)

;----------------------------------------
(DEFUN obra (tipo)
  (setq fi  (nth (atoi fid) listfi))
  (if (= (atoi tipo) 6) ; modificado en caso de tipo otro
	(setq Mtipo tifio)
	(setq Mtipo (nth (atoi tipo) listtipo))
  )  
  (setq M (itoa reflejo))    
  (mode_tile "tifio" 1)  ; vuelve a inhabilitar 
  (mode_tile "mirrort" 0)
  (if (or (= tipo "2")(= tipo "3"))
    (setq bbb (rtos (abs (atof bbb)) 2 2))
  )

  (cond 
    ((= tipo "0") 
      (TIPOGRA (strcat "TIPO-Y" M) (list "a" "g"))
      (mode_tile "mirrort" 1)
    )
    ((= tipo "1") 
      (TIPOGRA (strcat "TIPO-I" M) (list "a" "g" "r"))
    )
    ((= tipo "2") 
      (TIPOGRA (strcat "TIPO-C" M) (list "a" "b"))
    )
    ((= tipo "3") 
      (TIPOGRA (strcat "TIPO-O" M) (list "a" "b" "g" "r"))
    )
    ((= tipo "4") 
      (TIPOGRA (strcat "TIPO-L" M) (list "a" "b" "g" "r"))
    )
    ((= tipo "5") 
      (TIPOGRA (strcat "TIPO-G" M) (list "a" "b" "c"))
    )
    ((= tipo "6")      
      (TIPOGRA (strcat "TIPO-V" M) (list "a" "b" "c" "d" "e" "f" "g"))
      (mode_tile "mirrort" 1) ; mf 
      (mode_tile "tifio" 0)
    )
  )

  (if (and (= cuadro nil)(/= tipo "6"))
    (dibuja_vector (list XXX YYY))
  )

)  
;************************* controla que se ingrese la letra del nuevo tipo

;------------------------------------------
(DEFUN activang (var1 lista1 lista2)  
   (if(= var1 "0")
     (progn
       (foreach an lista1 (mode_tile an 0))
       (setq angul (atof angulo))
       (cond
	 ((< angul 45)        (setq angulo   "0")(set_tile "ang1" "1"))
	 ((equal angul  90 46)(setq angulo  "90")(set_tile "ang2" "1"))
	 ((equal angul 180 46)(setq angulo "180")(set_tile "ang3" "1"))
	 ((> angul 225)       (setq angulo "270")(set_tile "ang4" "1"))
       )
       (foreach an lista2 (set_tile an angulo)(mode_tile an 1))
     )
     (progn
       (foreach an lista1 (mode_tile an 1))
       (foreach an lista2 (mode_tile an 0))
     )
   )
)

;***********************************************************
;**** PROGRAMA PARA ANADIR DATOS EXTENDIDOS A ENTIDADES ****
;***********************************************************
;-----------------------------------------------------------
(defun gdato (tipo nom ndato / el exl nl rl okl name unapp)
   (regapp tipo)
   (setq el (entget nom (list "*")))
   (setq exl (assoc -3 el))
   (setq nl (list tipo (cons 1002 "{")
	      (cons 1000 ndato)
	      (cons 1002 "}")
	    )
   )
   (setq nl (list nl))
   (if (null exl)
     (progn 
	(setq rl (cons -3 nl))
	(setq el (append el (list rl)))
     )
     (progn
       (setq exl (cdr exl))
       (while exl
	 (setq unapp (car exl))
	 (setq exl (cdr exl))
	 (setq name (car unapp))
	 (if (/= (strcase name)(strcase tipo))
	  (if (null okl)
	     (setq okl (list unapp))
	     (setq okl (append okl (list unapp)))
	   )
	  )
       )
       (setq rl (append okl nl))
       (setq rl (cons -3 rl))
       (setq el (subst rl (assoc -3 el) el))
     )
   )
   (if (< (xdroom nom) (xdsize nl))
     (princ "\nYou cannot enter more extended data, it exceeds the maximum ")
     (entmod el)
   )
)


;*************************************************************
;**** PROGRAMA PARA OBTENER DATOS EXTENDIDOS DE ENTIDADES ****
;*************************************************************
;-----------------------------------------------------------
(defun odato (tipo nom / el exl apl sbl dato xc xd)
  (setq data nil)
  (setq el (entget nom (list tipo)))
  (setq exl (assoc -3 el))
  (if exl
    (progn
      (setq exl (cdr exl))
      (setq apl (car exl))
      (setq apl (cdr apl))
	(while (and apl (null dato))
	  (setq sbl (car apl))
	  (setq xc (car sbl))
	  (setq xd (cdr sbl))
	  (cond
	    ((= 1000 xc)
	     (setq dato xd)
	    )
	  )
	  (setq apl (cdr apl))
	)
    )
  )
  dato
)

;-----------------------------------------------------
(DEFUN EJEMPLO (numero fid oppremar codigo Mmarca listfi listwm)
  (SETQ CAJA10 (NEW_DIALOG "ejemplo" DCL1))
  
  (setq fi  (nth (atoi fid) listfi))
  (setq wm  (nth (atoi fid) listwm))
  (setq afi  (/ (* (expt (/ (atof fi) 10) 2) pi) 4)  )
  
  (if (= oppremar 1)
    (progn
      (setq eje1   (strcat "    Placed text : "  numero))
      (setq eje111 (strcat fi "Cd" codigo))
    ) 
    (progn
      (setq eje1   (strcat "    Placed text : "  numero))
      (setq eje111 (strcat fi "Mc" Mmarca))
    )
  )
  
  (setq eje2   "      Area")
  (setq eje222 (strcat fi " =  " (rtos afi 2 2) " cm2"))
  (setq eje3   "      Weight")
  (setq eje333 (strcat fi " =  " (rtos wm  2 2) " Kg/m"))
  
  (set_tile "eje1" eje1)(set_tile "eje111" eje111)
  (set_tile "eje2" eje2)(set_tile "eje222" eje222)
  (set_tile "eje3" eje3)(set_tile "eje333" eje333)
  
  (TIPOGRA2 "fi" "fi" "eje11" 7)
  (TIPOGRA2 "fi" "fi" "eje22" 7)
  (TIPOGRA2 "fi" "fi" "eje33" 7)
  
  (START_DIALOG)
  ;(DONE_DIALOG)
  ;(UNLOAD_DIALOG DCL1)

)

;-----------------------------------------------------
(DEFUN ACERCA2 ()
  (SETQ CAJA11 (NEW_DIALOG "acerca2" DCL1))
  
  (ACTION_TILE "acer"      "(ACERCA)")
  (ACTION_TILE "servincad" "(SERVINCAD)")
  
  (START_DIALOG)
  ;(DONE_DIALOG)
  ;(UNLOAD_DIALOG DCL1)

)

;-----------------------------------------------------
(DEFUN ACERCA ( / listacerca)
  (SETQ CAJA12 (NEW_DIALOG "acerca" DCL1))  
  (TIPOGRA2 "phlogo4" "phlogo4" "imageB" 250)
  (set_tile "text1" "       BARS SCHEDULE AUTOMATIC        ")
  (set_tile "text2" "              For AUTOCAD             ")
  (set_tile "text3" "                SINCOWS               ")
  
  (setq listacerca (list  "  DRAW AND SCHEDULE OF STRUCTURAL BARS "
			  "     Software  for the draw and        "
			  "     schedule of bars automatic        "
			  "       in civil engineering.           "
			  "             QUITO-ECUADOR             "
    )
  )

  (start_list "editacerca")
  (mapcar 'add_list listacerca)
  (end_list)

  (START_DIALOG)
  (if (= inic nil)(DONE_DIALOG))
  ;(UNLOAD_DIALOG DCL1)
)

;---------------------------------------------
(DEFUN SERVINCAD ( / listaser)
  (SETQ CAJA13 (NEW_DIALOG "servincad" DCL1))
  
  (TIPOGRA2 "LOGO3" "LOGO3" "imageC" 7)
  (set_tile "text11" "  S I N C O W")
  (set_tile "text22" "  Bars Schedule")
  (set_tile "text33" "  For AUTOCAD")
  
  (setq listaser (list "SINCOW is a company "
		       "of services in the field of the"
		       "informatics, in aid of Engineers"
		       "Architecs and  Civil Engineers."
		       "                              "
		       "Visit us in our it web"
		       "www.sincows.com"
		       "or e-mail"
		       "admin@sincows.com"
		       "                              "
		       "Address: Isla Fernandina N42-52"
		       "y Thomás de Berlanga."
		       "telephone : 539-2431-356"
		       "telefax  : 593-2920-890"
		       "                         "
		       "       QUITO - ECUADOR       "
    )
  )
  
  (start_list "editservincad")
  (mapcar 'add_list listaser)
  (end_list)

  (START_DIALOG)
  ;(DONE_DIALOG)
  ;(UNLOAD_DIALOG DCL1)
)

;-----------------------------------------------------
(DEFUN TIPOGRA1 (SLD1 ARCHSLB SLIDE fondo / ancho alto)
  (setq ancho (dimx_tile SLIDE))
  (setq alto (dimy_tile SLIDE))
  (start_image SLIDE)
  (fill_image 0 0 (fix (* ancho 1.0)) alto fondo)
  (slide_image 0 0 (fix (* 1.0 ancho)) (fix (* 1.0 alto))
     (strcat ARCHSLB "(" sld1 ")")
  )
  (end_image)
  (action_tile SLIDE "(setq qq $key)")
)

;------------------------------------------
(DEFUN AR (cadena longitud decimales Akey / posic)
  (if (= decimales -1)
    (setq valor1 (substr cadena 1 longitud))
    (progn
      (if (or (= Akey "dbl8")(= Akey "gr2")(= Akey "gr3")(= Akey "vc2")(= Akey "vc3")(= Akey "espx")(= Akey "espy")(and (= Akey "b")(= tipo "4"))(and (or (= Akey "b")(= Akey "c"))(= tipo "5")))
	(setq valor1 (rtos (atof cadena) 2 decimales))
	(setq valor1 (rtos (abs (atof cadena)) 2 decimales))
      )
      (setq posic (1+ (- (strlen valor1) longitud)))
      (if (< posic 1)(setq posic 1))
      (setq valor1 (substr valor1 posic longitud))
    )
  )
  (foreach x (list "global" "M1" "M2" "M3" "M4" "M5" "M6" "M7" "M8" "M9" "M10") 
    (if (eq Akey x)
      (setq valor1 (rtos (* (fix (/ (atof valor1) 100.0)) 100) 2 0))
    ) 
  )
  
  (if (/= Akey nil)(SET_TILE Akey valor1))
  valor1
)
  
;------------------------------------------
(DEFUN fijar (Mmarca Mglobal Mfija)
  (if (= Mfija "1")
    (progn
      (set_tile  "marca"  Mmarca)
      (set_tile  "global" "-----------------")
      (mode_tile "marca"  0)
      (mode_tile "global" 1)
    )
    (progn
      (set_tile  "marca"  "-----------------")
      (set_tile  "global" Mglobal)
      (mode_tile "marca"  1)
      (mode_tile "global" 0)
    )
  )
  (if (= cero 0)
    (progn  
      (set_tile  "marca"  Mmarca)
      (set_tile  "global" "-----------------")
      (mode_tile "marca"  0)
      (mode_tile "global" 1)
    )
  )
  
)

;----------------------
(DEFUN atoa (valor)
  (itoa (atoi valor))
)

;------------------------
(DEFUN refle (valor / v1)
  (setq v1 (1+ valor))
  (if (> v1 4)(setq v1 1))
  (if (and (or (= tipo "1")(= tipo "2")) (= v1 2)) (setq v1 3))
  (if (and (or (= tipo "1")(= tipo "2")) (= v1 4)) (setq v1 1))
  v1
)

;------------------------------
(DEFUN CEROS (inc0)
  (setq cero (+ cero inc0))
  (if (> cero 1)(setq cero 0))
  (cond
    ((= cero 1) 
      (set_tile "codigo" codigo)
      (set_tile "cero"   "0")
      (mode_tile "fija" 0)
      (fijar Mmarca Mglobal Mfija)
    )
    ((= cero 0) 
      (set_tile "codigo" "Zero")
      (set_tile "cero"   "1")
      (set_tile "global" "--------------------")
      (set_tile "marca" Mmarca)
      (mode_tile "fija" 1)
      (mode_tile "global" 1)
      (mode_tile "marca" 0)
    )
  )
  (if (= codigo "0")
    (SET_TILE "codigo" "Cero")
  )

)

;----------------------------------
(DEFUN dibuja_vector (LISTA1 / ANCHO-3 ANCHO-15 ALTO-15 ANCHO-32 RR)
  (setq ancho (dimx_tile "Slide_C"))
  (setq alto (dimy_tile "Slide_C"))
  (SETQ XXX (CAR LISTA1))
  (SETQ YYY (CADR LISTA1))
  (SETQ ANCHO-3 (/ ANCHO 3.0))
  (SETQ ANCHO-32 (/ ANCHO 1.5))
  (SETQ ANCHO-15 (/ ANCHO 15.0))
  (SETQ ALTO-15 (/ ALTO 15.0))
  (start_image "Slide_C")
  
  (vector_image (fix (/ ancho 6.0)) (fix (/ alto 6.0)) 
		(fix (/ ancho 1.2)) (fix (/ alto 6.0)) 2
  )
  (COND
    ( (<= XXX ANCHO-3)
      (setq posic 1)
      (SETQ RR 
	 (RECTAN-S (LIST (/ ANCHO 6.0) (/ ALTO 6.0)) ANCHO-15 ALTO-15)
      )
      (EVAL (CONS 'VECTOR_IMAGE (APPEND (CAR RR) (CADR RR) (LIST 2))))
      (EVAL (CONS 'VECTOR_IMAGE (APPEND (CADR RR) (CADDR RR) (LIST 2))))
      (EVAL (CONS 'VECTOR_IMAGE (APPEND (CADDR RR) (CADDDR RR) (LIST 2))))
      (EVAL (CONS 'VECTOR_IMAGE (APPEND (CADDDR RR) (CAR RR) (LIST 2))))
    )
    ( (<= XXX ANCHO-32)
      (setq posic 2)
      (SETQ RR 
	 (RECTAN-S (LIST (/ ANCHO 2.0) (/ ALTO 6.0)) ANCHO-15 ALTO-15)
      )
      (EVAL (CONS 'VECTOR_IMAGE (APPEND (CAR RR) (CADR RR) (LIST 2))))
      (EVAL (CONS 'VECTOR_IMAGE (APPEND (CADR RR) (CADDR RR) (LIST 2))))
      (EVAL (CONS 'VECTOR_IMAGE (APPEND (CADDR RR) (CADDDR RR) (LIST 2))))
      (EVAL (CONS 'VECTOR_IMAGE (APPEND (CADDDR RR) (CAR RR) (LIST 2))))
    )
    ( T ; (<= XXX ANCHO-3)
      (setq posic 3)
      (SETQ RR 
	 (RECTAN-S (LIST (/ ANCHO 1.20) (/ ALTO 6.0)) ANCHO-15 ALTO-15)
      )
      (EVAL (CONS 'VECTOR_IMAGE (APPEND (CAR RR) (CADR RR) (LIST 2))))
      (EVAL (CONS 'VECTOR_IMAGE (APPEND (CADR RR) (CADDR RR) (LIST 2))))
      (EVAL (CONS 'VECTOR_IMAGE (APPEND (CADDR RR) (CADDDR RR) (LIST 2))))
      (EVAL (CONS 'VECTOR_IMAGE (APPEND (CADDDR RR) (CAR RR) (LIST 2))))
    )
  )  
  (end_image)
)  
  
;-----------------------------------------------------
(DEFUN RECTAN-S (LISTA ANCH ALT)
(LIST 
   (MAPCAR 'FIX (MAPCAR '- LISTA (LIST ANCH ALT)))
   (MAPCAR 'FIX (MAPCAR '- LISTA (LIST (* -1.0 ANCH) ALT)))
   (MAPCAR 'FIX (MAPCAR '- LISTA (LIST (* -1.0 ANCH) (* -1.0 ALT))))
   (MAPCAR 'FIX (MAPCAR '- LISTA (LIST ANCH (* -1.0 ALT))))
 ) 
)  
  
;-------------------------------------------------------
(DEFUN ARMAR (P1A / propiP1 lista tipo1 P11 propiP11 punto1)
  
  (setq propiP1 (entget P1A))
  (setq lista nil)
  (setq tipo1 "VERTEX")

  (while (= tipo1 "VERTEX")
    (setq P11 (entnext P1A))
    (setq propiP11 (entget P11))
    (setq punto1 (cdr (assoc 10 propiP11)))
    (setq tipo1 (cdr (assoc 0 propiP11)))
    (setq P1A P11)
    (if (/= punto1 nil)
      (setq lista (cons punto1 lista))
    )
  )
  (setq lista (reverse lista))
)

;-------------------------------------------------------
(DEFUN CARGAR (Wlsp1 Wload1)
  (if (not (eval (read Wlsp1))) 
    (progn
      (print (strcat "Starting " Wload1 "  <Please wait a moment>")) ; MM 04Oct2004
      (load Wload1)
      (print (strcat "Software " Wload1 " OK...")) ; MM 04Oct2004
    )
  )
)

;-------------------------------------------------------
(DEFUN OBTLAYER (la1)
  (setq la1OBT "0")
  (setq vvi (tblnext "view" t))
  (while (/= vvi nil)
    (if (= (substr (cdr (assoc 2 vvi)) 2 1) la1)
      (setq la1OBT (substr (cdr (assoc 2 vvi)) 4 16))
    ) 
    (setq vvi (tblnext "view"))
  )
  (command "_view" "_s" (strcat "x" la1 "-" la1OBT))
  la1OBT
)

;-------------------------------------------------------
(DEFUN C:W ()
  (setq e (car (entsel "\nSelect a Object : ")))
  (setq en (entget e) d "no")
  (setq tipoe (cdr (assoc 0 en)))
  (if (= tipoe "TEXT")
    (setq d (odato "acerTX" e))
  )
  (if (= tipoe "POLYLINE")
    (setq d (odato "acerPL" e))
  )
  (print en) d
)

;-------------------------------------------------------
(DEFUN ROJO (modo)
  (if (= modo 1)
    (progn
      (TIPOGRA2 "modo1" "modo" "imagen_MODO" 7)
    )
    (progn
      (TIPOGRA2 "modo2" "modo" "imagen_MODO" 7)
    )
  )

)

;-------------------------------------------------------
(DEFUN CORRECTO ()
  
  (cond
    ((= tdibuj "2")
      (mode_tile "fi"     1)
      (mode_tile "numero" 1)
      (mode_tile "marca"  1)
      (mode_tile "global" 1)
      (mode_tile "fija"   1)
      (mode_tile "cero"   1)
      
      (set_tile "numero" "-------------")
      (set_tile "codigo" "-------------")
      (set_tile "marca"  "-------------")
      (set_tile "global" "-------------")
    )
    (T
      (mode_tile "fi"     0)
      (mode_tile "numero" 0)
      (mode_tile "marca"  0)
      (mode_tile "global" 0)
      (mode_tile "fija"   0)
      (mode_tile "cero"   0)
      
      (set_tile "codigo" codigo)
      (set_tile "numero" numero)
      (set_tile "fi" fid)
      (CEROS 0)
      (fijar Mmarca Mglobal Mfija)
    )
  )
  
)
;----------------------------------------------------------
(DEFUN DATOPOLY ()      
     (setq Mtipo   WMTI) 
     (setq reflejo Wreflejo)
     (setq posic   Wposic) 
     (setq tipo (itoa (- (length listtipo) (length (member Mtipo listtipo)))))     
     (setq aaa Wa11   bbb Wb11   ccc Wc11    ddd Wd11    eee We11    fff Wf11    ggg Wg11   rrr Wr11)
)     
;----------------------------------------------------------
(DEFUN OBTPUNTOPOLY (entext1 enpoly1)      
     (setq lista1 (ARMAR enpoly1))
     (cond
       ((or (= tipo "0") (and (or (= tipo "1")(= tipo "4"))(< (atof ggg) 0.001)))
	 (setq p1 (nth 0 lista1) p2 (nth 1 lista1))
       )
       ((and (= tipo "1")(> (atof ggg) 0.001))
	 (setq p1 (nth 2 lista1) p2 (nth 3 lista1))
       )
       ((= tipo "2")
	 (setq p1 (nth 1 lista1) p2 (nth 2 lista1))
       )
       ((and (= tipo "3")(> (atof ggg) 0.03))
	 (setq p11 (nth 8 lista1) p22 (nth 9 lista1))
	 (setq p1 (mapcar '/ (mapcar '+ p11 p22) (list 2 2 2)  )  )
	 (setq p11 (nth 4 lista1) p22 (nth 5 lista1))
	 (setq p2 (mapcar '/ (mapcar '+ p11 p22) (list 2 2 2)  )  )
       )
       ((and (= tipo "3")(<= (atof ggg) 0.03))
	 (setq p11 (nth 6 lista1) p22 (nth 7 lista1))
	 (setq p1 (mapcar '/ (mapcar '+ p11 p22) (list 2 2 2)  )  )
	 (setq p11 (nth 2 lista1) p22 (nth 3 lista1))
	 (setq p2 (mapcar '/ (mapcar '+ p11 p22) (list 2 2 2)  )  )
       )
       ((and (= tipo "4")(> (atof ggg) 0.001))
	 (setq p1 (nth 2 lista1) p2 (nth 3 lista1))
       )
       ((= tipo "5")
	 (setq p1 (nth 1 lista1) p2 (nth 2 lista1))
       )
     )
     (setq pm (mapcar '/ (mapcar '+ p1 p2) (list 2 2 2)  )  )
     
     (if (or (= reflejo 2)(= reflejo 3))
       (setq p3 p1      p1 p2    p2 p3   p3 nil)
     )
     (if (= posic 1)(setq punto p1))
     (if (= posic 2)(setq punto pm))
     (if (= posic 3)(setq punto p2))

     (if (and (= tdibuj "1") enpoly1 (= entext1 nil)(= tipo "3"))
       (progn
	 (setq lista1 (ARMAR enpoly1))
	 (setq p1 (nth 2 lista1) p2 (nth 3 lista1))
	 (if (or (= reflejo 1)(= reflejo 4))
	   (setq angulo1 (/ (* (angle p1 p2) 180) pi))
	   (setq angulo1 (/ (* (angle p2 p1) 180) pi))
	 )
	 (setq angulo1 (+ angulo1 90))
	 (setq punto (polar punto (gra angulo1) (+ (/ (atof bbb) 2.0) (* 1.0 (atof altmar)))))
       )
     )
)     
;----------------------------------------------------------
(DEFUN GRATEXT ()      
     (TEXTO lista1 tipo angulo)
     (command "_change" entt "" "_P" "_C" "8" "")
     
     (command "_copy" entt "" pt pause)
     (setq enttc (entlast))
     (if (equal pt (getvar "lastpoint"))
       (command "_erase" enttc "")
       (progn (command "_erase" entt "")(setq entt enttc))
     ) 
     (command "_change" entt "" "_P" "_C" "_BYLAYER" "")
)     
;----------------------------------------------------------
(DEFUN GRAPOLY ()      
     (DIBUJO punto tipo layerace espace (atof aaa) (atof bbb) (atof ccc) (atof ggg) (atof rrr)) 
     (command "_change" ent "" "_P" "_C" "8" "")
     (REFLEJE ent punto reflejo)
     (MOVERROTAR ent (atof aaa) posic punto angulo)
     
     (command "_copy" ent "" punto pause)
     (setq entc (entlast))
     (if (equal punto (getvar "lastpoint"))
       (command "_erase" entc "")
       (progn (command "_erase" ent "")(setq ent entc))
     ) 
     (command "_change" ent "" "_P" "_C" "_BYLAYER" "")
)     
;----------------------------------------------------------
(DEFUN DATOTEXT ()      
     (setq codigo  Wcodigo) 
     (setq Mfija   WMfija) 
     (setq Mmarca  WMmarca) 
     (setq Mglobal WMglobal) 
     (setq Mtipo   WMtipo) 
     (setq fi      Wfi) 
     (setq numero  Wnumero) 
     (setq reflejo Wreflejo)
     (setq posic   Wposic) 
     (setq fid  (itoa (- (length listfi)   (length (member fi listfi)))))
     (setq tipo (itoa (- (length listtipo) (length (member Mtipo listtipo)))))
     (setq aaa Wa11   bbb Wb11   ccc Wc11    ddd Wd11    eee We11    fff Wf11    ggg Wg11   rrr Wr11)
)     
;----------------------------------------------------------
(DEFUN OBTPUNTOTEXT (entext1 enpoly1)      
     (setq punto1  (cdr (assoc 11 (entget entext1))))
     (setq angulo1 (rad (cdr (assoc 50 (entget entext1)))))
     (setq angulo1 (- angulo1 90))
     (if (= tipo "3")
       (setq punto (polar punto1 (gra angulo1) (+ (/ (atof bbb) 2.0) (* 1.0 (atof altmar)))))
       (setq punto (polar punto1 (gra angulo1) (* 1.0 (atof altmar))))
     )
)     
;----------------------------------------------------------
(DEFUN CONDIANT ()      
     (setvar "cmdecho" old2)
     (setvar "clayer" layerANT)
     (setvar "blipmode" blipmodeANT)
)
;----------------------------------------------------------
(DEFUN CONDIPRI ()      
     (setvar "cmdecho" 0)
     (setvar "blipmode" 0)
     (CARGAR "GRABAR_RESPALDO" "cambiar")(GRABAR_RESPALDO)
     (CARGAR "C:grabarTX" "datext")   
)
;----------------------------------------------------------
(DEFUN MTIPOFI ()     
     (setq fi  (nth (atoi fid) listfi))
    (if (= (atoi tipo) 6) ; MODIFICADO PARA QUE ASIGNE LA NUEVA DIRECTAMENTE
     (setq Mtipo tifio) 
     (setq Mtipo (nth (atoi tipo) listtipo))
    )     
)
;---------------------------------------------------------
(DEFUN ARREGLOZP (inczp)
  (set_tile "tipozp" tipozp)
  (cond
    ((= tipozp "0")
      (setq zpos (+ (atof zpos) inczp))
      (if (< zpos 1.0) (setq zpos 1.0))
      (if (> zpos 9.9) (setq zpos 9.9))
      (setq zpos (rtos zpos 2 1))
      (set_tile "tzp" (strcat " " zpos " x"))
    )
    ((= tipozp "1")
      (setq zneg (+ (atof zneg) inczp))
      (if (< zneg 0.1) (setq zneg 0.1))
      (if (> zneg 1.0) (setq zneg 1.0))
      (setq zneg (rtos zneg 2 1))
      (set_tile "tzp" (strcat " " zneg " x"))
    )
    ((= tipozp "2")
      (setq panx (+ (atof panx) inczp))
      (if (< panx 0.1) (setq panx 0.1))
      (if (> panx 9.9) (setq panx 9.9))
      (setq panx (rtos panx 2 1))
      (set_tile "tzp" (strcat " " panx " m"))
    )
    ((= tipozp "3")
      (setq pany (+ (atof pany) inczp))
      (if (< pany 0.1) (setq pany 0.1))
      (if (> pany 9.9) (setq pany 9.9))
      (setq pany (rtos pany 2 1))
      (set_tile "tzp" (strcat " " pany " m"))
    )
  )
)
;---------------------------------------------------------
(DEFUN CORX (num)
  (fix (/ (* num pzx) 240))
)
;---------------------------------------------------------
(DEFUN CORY (num)
  (fix (/ (* num pzy) 176))
)
;---------------------------------------------------------
(DEFUN C:PANZOON ()
  (setvar "cmdecho" 0)
  (if (= tipozp nil)(setq tipozp "0"))
  (if (= zpos nil)(setq zpos "1.1"))
  (if (= zneg nil)(setq zneg "0.9"))
  (if (= panx nil)(setq panx "1.0"))
  (if (= pany nil)(setq pany "1.0"))
  
  (setq opcionPZ 0)
  (SETQ CAJA6 (NEW_DIALOG "panzoon" DCL1))
  
  (ARREGLOZP 0) 
  (TIPOGRA2 "panzoon" "panzoon" "panzoon" 253)
  (setq pzx (dimx_tile "panzoon"))
  (setq pzy (dimy_tile "panzoon"))
  
  (action_tile "tipozp" "(setq tipozp (atoa $value))(ARREGLOZP 0)")
  (action_tile "zp-" "(ARREGLOZP -0.1)")
  (action_tile "zp+" "(ARREGLOZP  0.1)")
  
  (action_tile "panzoon" "(setq opcionPZ 1 xx $x yy $y)(RPICAR)(done_dialog)")

  (START_DIALOG)
  (DONE_DIALOG)

  (cond
    ((and (= opcionPZ 1)(> xx (CORX 21))(> yy (CORY 23))(< xx (CORX 74))(< yy (CORY 60)))
      (if (eq zpos "1.0")
	(command "_regen")
	(command "_zoom" (strcat zpos "x"))
      )
      (C:PANZOON)
    )
    ((and (= opcionPZ 1)(> xx (CORX 21))(> yy (CORY 121))(< xx (CORX 74))(< yy (CORY 160)))
      (if (eq zneg "1.0")
	(command "_redraw")
	(command "_zoom" (strcat zneg "x"))
      )
      (C:PANZOON)
    )
    ((and (= opcionPZ 1)(> xx (CORX 165))(> yy (CORY 23))(< xx (CORX 220))(< yy (CORY 60)))
      (command "_zoom" "_p")
      (C:PANZOON)         
    )
    ((and (= opcionPZ 1)(> xx (CORX 165))(> yy (CORY 121))(< xx (CORX 220))(< yy (CORY 160)))
      (command "_zoom" "_e")
      (C:PANZOON)
    )
    
    ((and (= opcionPZ 1)(> xx (CORX 7))(> yy (CORY 75))(< xx (CORX 61))(< yy (CORY 113)))
      (command "_pan" (getvar "viewctr") (polar (getvar "viewctr") (gra 0) (atof panx)))
      (C:PANZOON)
    )
    ((and (= opcionPZ 1)(> xx (CORX 94))(> yy (CORY 17))(< xx (CORX 144))(< yy (CORY 51)))
      (command "_pan" (getvar "viewctr") (polar (getvar "viewctr") (gra 270) (atof pany)))
      (C:PANZOON)
    )
    ((and (= opcionPZ 1)(> xx (CORX 182))(> yy (CORY 74))(< xx (CORX 234))(< yy (CORY 114)))
      (command "_pan" (getvar "viewctr") (polar (getvar "viewctr") (gra 180) (atof panx)))
      (C:PANZOON)
    )
    ((and (= opcionPZ 1)(> xx (CORX 90))(> yy (CORY 132))(< xx (CORX 145))(< yy (CORY 170)))
      (command "_pan" (getvar "viewctr") (polar (getvar "viewctr") (gra 90) (atof pany)))
      (C:PANZOON)
    )
    
    ((and (= opcionPZ 1)(> xx (CORX 93))(> yy (CORY 73))(< xx (CORX 148))(< yy (CORY 110)))
      (command "_undo" "")
      (C:PANZOON)
    )
    ((= opcionPZ 1)
      (command "_zoom" "_w" pause pause)
      (C:PANZOON)
    )
  )
  (setvar "cmdecho" old2)
)
;---------------------------------------------------------
(DEFUN RPICAR ()
  (cond
    ((and (= opcionPZ 1)(> xx (CORX 21))(> yy (CORY 23))(< xx (CORX 74))(< yy (CORY 60)))
      (TIPOGRA2 "panzoon1" "panzoon" "panzoon" 253)
    )
    ((and (= opcionPZ 1)(> xx (CORX 21))(> yy (CORY 121))(< xx (CORX 74))(< yy (CORY 160)))
      (TIPOGRA2 "panzoon2" "panzoon" "panzoon" 253)
    )
    ((and (= opcionPZ 1)(> xx (CORX 165))(> yy (CORY 23))(< xx (CORX 220))(< yy (CORY 60)))
      (TIPOGRA2 "panzoon3" "panzoon" "panzoon" 253)
    )
    ((and (= opcionPZ 1)(> xx (CORX 165))(> yy (CORY 121))(< xx (CORX 220))(< yy (CORY 160)))
      (TIPOGRA2 "panzoon4" "panzoon" "panzoon" 253)
    )
    
    ((and (= opcionPZ 1)(> xx (CORX 7))(> yy (CORY 75))(< xx (CORX 61))(< yy (CORY 113)))
      (TIPOGRA2 "panzoon5" "panzoon" "panzoon" 253)
    )
    ((and (= opcionPZ 1)(> xx (CORX 94))(> yy (CORY 17))(< xx (CORX 144))(< yy (CORY 51)))
      (TIPOGRA2 "panzoon6" "panzoon" "panzoon" 253)
    )
    ((and (= opcionPZ 1)(> xx (CORX 182))(> yy (CORY 74))(< xx (CORX 234))(< yy (CORY 114)))
      (TIPOGRA2 "panzoon7" "panzoon" "panzoon" 253)
    )
    ((and (= opcionPZ 1)(> xx (CORX 90))(> yy (CORY 132))(< xx (CORX 145))(< yy (CORY 170)))
      (TIPOGRA2 "panzoon8" "panzoon" "panzoon" 253)
    )
    
    ((and (= opcionPZ 1)(> xx (CORX 93))(> yy (CORY 73))(< xx (CORX 148))(< yy (CORY 110)))
      (TIPOGRA2 "panzoon9" "panzoon" "panzoon" 253)
    )
    ((= opcionPZ 1)
      (TIPOGRA2 "panzon10" "panzoon" "panzoon" 253)
      (TIPOGRA2 "panzon11" "panzoon" "panzoon" 253)
      (TIPOGRA2 "panzon12" "panzoon" "panzoon" 253)
    )
  )

)
;-----------------------------------------------------
(DEFUN TIPOGRA2 (SLD1 ARCHSLB SLIDE fondo / ancho alto)
  (setq ancho (dimx_tile SLIDE))
  (setq alto (dimy_tile SLIDE))
  (start_image SLIDE)
  (fill_image 0 0 (fix (* ancho 1.0)) alto fondo)
  (slide_image 0 0 (fix (* 1.0 ancho)) (fix (* 1.0 alto))
     (strcat ARCHSLB "(" sld1 ")")
  )
  (end_image)
)
  
;-----------------------------------------------------
(defun STYLELIST (/ sname style-idx)
  (setq slist (list (cdr (assoc 2 (tblnext "STYLE" T)))))
  (while (setq sname (cdr (assoc 2 (tblnext "STYLE"))))
    (if (/= sname "") (setq slist (cons sname slist)))
  )
  (setq stilist (acad_strlsort slist))
)  
;-----------------------------------------------------
(defun PONERSTYLELIST (akey styloo)
  (start_list akey)
  (mapcar 'add_list stilist)
  (end_list)
   (print styloo)
  (setq style-idx (getindex styloo (mapcar 'strcase stilist))) ;030500
  (set_tile akey (itoa style-idx))

)
;-------------------------------------------------------
(defun lord (lp lg lpo)
   (cond 
     (lp (setq lpo (append lpo (list (assoc (car lp) lg))))
	 (lord (cdr lp) lg lpo)
     )
     (t lpo)
   )
)
;-------------------------------------------------------
(defun LDplani (lista)  
  (mapcar 'strcat (list " "   " "   " "   ""   ""   ""   ""   ""   ""   " "   " ") lista (list "\t" "\t" "\t" "\t" "\t" "\t" "\t" "\t" "\t" "\t" ""))
  
)
;-------------------------------------------------------
(defun LDresul (lista)
  (mapcar 'strcat (list " "    " "    ""    "") lista (list "\t" "\t" "\t" ""))
)

;-------------------------------------------------------
(defun LDplaniAR (lista)
  (mapcar 'strcat (list "\"" "\"" "\"" "\"" "\"" "\"" "\"" "\"" "\"" "\"" "\"" "\"" "\"") lista (list "\"" "\"" "\"" "\"" "\"" "\"" "\"" "\"" "\"" "\"" "\"" "\"" "\""))
)
;-------------------------------------------------------
(defun LDresulAR (lista)
  (mapcar 'strcat (list "\"" "\"" "\"" "\"") lista (list "\"" "\"" "\"" "\""))
)
;-------------------------------------------------------
(defun STL (lista)
  (eval (cons 'strcat lista))
)
;____________________________ MODULO PARA CONTAR DONAS LOSA
(DEFUN AYUDAS3 ()
 (CARGAR "C:EJECUTAR" "layer-1")
 (setq opcionAYU 0)
 (if (= mensajes nil)(setq mensajes "1"))
 (setq layerpos (C:EJECUTAR layerpos))

(IF (= bandera 1)
 (progn
	(CARGAR "C:POS33" "obtener")
	 (setq numero (C:POS33))
 )
)
(PH1)
)
;------------------------- MODULO MF PARA CONTAR ESTRIBOS
(DEFUN AYUDAS2 ()
  (CARGAR "C:EJECUTAR" "layer-1")
  (setq opcionAYU 0) 
  (if (= mensajes nil)(setq mensajes "1"))
  (setq layerest (C:EJECUTAR layerest)) 
   (if (= bandera 1)
    (progn
	  (CARGAR "C:EST33" "obtener")
	  (setq numero (C:EST33))
      )
  )
(PH1)
)
;----------------------------------------- MODULO MF PARA BOTON OBTENER
(DEFUN AYUDAS1 ()
  (CARGAR "C:EJECUTAR" "layer-1")
  (if (= tipoabc  nil)(setq tipoabc  "0"))
  (if (= mensajes nil)(setq mensajes "1"))
  (CARGAR "C:OBT33" "obtener")
      (if (= tipoabc "0")(setq aaa    (C:OBT33)))
      (if (= tipoabc "1")(setq bbb    (C:OBT33)))
      (if (= tipoabc "2")(setq ccc    (C:OBT33)))
      (if (= tipoabc "3")(setq ddd    (C:OBT33)))
      (if (= tipoabc "4")(setq eee    (C:OBT33)))
      (if (= tipoabc "5")(setq fff    (C:OBT33)))
      (if (= tipoabc "6")(setq ggg    (C:OBT33)))
      (if (= tipoabc "7")(setq angulo (C:OBT33)))
      (PH1)  
 )

;---------------------------------------------------------
(DefUN CALCULAR1 (e le)  
  (setq cci 1 listm (list nil))
  (foreach x le
    (if x
      (progn
	(setq xn (entget x))
	(setq v2 (cdr (assoc 1 xn)))
	(cond
	  ((= cci 1)        
	    (if (and (eq dxttipo "type_")(= (member v2 listtipo) nil))(setq v2 "V"))         
	    (if      (eq dxttipo "fi")(progn(setq v2 (atoi v2) v2 (itoa v2))(if (= (member v2 listfi) nil)(setq v2 "8")) ))        
	    (if      (eq dxttipo "number")(setq v2 (atoi v2) v2 (itoa v2)))        
	    (setq v1 (assoc 1 xn))
	    (setq v2 (cons 1 v2))
	    (setq xn (subst v2 v1 xn))
	    (entmod xn)
		   
	  )
	  ((= cci 2)
	    (if (and (eq dxtfi "type_")(= (member v2 listtipo) nil))(setq v2 "V"))
	    (if      (eq dxtfi "fi")(progn(setq v2 (atoi v2) v2 (itoa v2))(if (= (member v2 listfi) nil)(setq v2 "8")) ))
	    (if      (eq dxtfi "number")(setq v2 (atoi v2) v2 (itoa v2)))
	    (setq v1 (assoc 1 xn))
	    (setq v2 (cons 1 v2))
	    (setq xn (subst v2 v1 xn))
	    (entmod xn)
	  )
	  ((= cci 3)
	    (if (and (eq dxtnumero "type_")(= (member v2 listtipo) nil))(setq v2 "V"))
	    (if      (eq dxtnumero "fi")(progn(setq v2 (atoi v2) v2 (itoa v2))(if (= (member v2 listfi) nil)(setq v2 "8")) ))
	    (if      (eq dxtnumero "number")(setq v2 (atoi v2) v2 (itoa v2)))
	    (setq v1 (assoc 1 xn))
	    (setq v2 (cons 1 v2))
	    (setq xn (subst v2 v1 xn))
	    (entmod xn)
	  )
	  ((and (>= cci 4)(<= cci 10))
	    (setq v2 (atof v2))
	    (setq v2 (rtos v2 2 2))
	    (setq v1 (assoc 1 xn))
	    (setq v2 (cons 1 v2))
	    (setq xn (subst v2 v1 xn))
	    (entmod xn)
	  )
	)
	(setq listm (append listm (list (cdr (assoc 1 xn)))))
      )
      (setq listm (append listm (list "0.00")))
    ) 
    (setq cci (1+ cci))
  )
  (if (eq dxttipo   "type_")(setq vv11 1))
  (if (eq dxtfi     "type_")(setq vv11 2))
  (if (eq dxtnumero "type_")(setq vv11 3))
  (if (eq dxttipo   "number")(setq vv22 1))
  (if (eq dxtfi     "number")(setq vv22 2))
  (if (eq dxtnumero "number")(setq vv22 3))

  (cond
    ((eq (nth vv11 listm) "I1")
      (setq ldes (rtos (+ (atof (nth 4 listm)) (* 2 (atof (nth 10 listm)))) 2 2))
    )
    ((eq (nth vv11 listm) "I")
      (setq ldes (rtos (+ (atof (nth 4 listm)) (* 2 (atof (nth 10 listm)))) 2 2))
    )
    ((eq (nth vv11 listm) "C")
      (setq ldes (rtos (+ (atof (nth 4 listm)) (* 2 (atof (nth 5 listm)))) 2 2))
    )
    ((eq (nth vv11 listm) "O")
      (setq ldes (rtos (+ (* 2 (atof (nth 4 listm))) (* 2 (atof (nth 5 listm))) (* 2 (atof (nth 10 listm)))) 2 2))
    )
    ((eq (nth vv11 listm) "L")
      (setq ldes (rtos (+ (atof (nth 4 listm)) (abs (atof (nth 5 listm))) (atof (nth 10 listm))) 2 2))
    )
    ((eq (nth vv11 listm) "G")
      (setq ldes (rtos (+ (atof (nth 4 listm)) (abs (atof (nth 5 listm))) (abs (atof (nth 6 listm)))) 2 2))
    )
    (T;(eq (nth vv11 listm) "V") modificado para que acepte generales mf
      (setq ldes (rtos (+ (atof (nth 4 listm)) (atof (nth 5 listm)) (atof (nth 6 listm)) (atof (nth 7 listm)) (atof (nth 8 listm)) (atof (nth 9 listm)) (atof (nth 10 listm))) 2 2))
    )
  )
  (if (> (atof ldes) 12)
    (setq nuvar12 (rtos (+ (* (/ (atof ldes) 12) (atof (nth vv22 listm))) 0.5) 2 0))
    (setq nuvar12 (rtos (fix (+ (/ (atof (nth vv22 listm)) (fix (/ 12 (atof ldes)))) 0.999)) 2 0))
  )
  (setq en (entget (nth 10 le)))
  (setq e1 (assoc 1 en))
  (setq e2 (cons 1 ldes))
  (setq en (subst e2 e1 en))
  (entmod en)
  (setq en (entget (nth 11 le)))
  (setq e1 (assoc 1 en))
  (setq e2 (cons 1 nuvar12))
  (setq en (subst e2 e1 en))
  (entmod en)
)
;---------------------------------------------------------
(DEFUN CALCULAR2 (e le)
  (setq cci 1 wtoto 0.00)
  (foreach x le
    (setq xn (entget x))
    (setq v2 (cdr (assoc 1 xn)))
    (if (< cci 12)
      (setq v2 (atoi v2) v2 (itoa v2))
      (progn
	(setq v2 (* (nth (- cci 12) listwm)     (atof (cdr (assoc 1 (entget (nth (- cci 12) le)))))  )) 
	(setq wtoto (+ wtoto v2))
	(setq v2 (rtos v2 2 2))
      )
    )
    (setq v1 (assoc 1 xn))
    (setq v2 (cons 1 v2))
    (setq xn (subst v2 v1 xn))
    (entmod xn)
    (setq cci (1+ cci))
  )

  (setq en (entget e))
  (setq e1 (assoc 1 en))
  (setq e2 (cons 1 (rtos wtoto 2 2)))
  (setq en (subst e2 e1 en))
  (entmod en)
)
;------------ G.N.R. FEB 98 -------------------------------
(DEFUN calcularpeso (FIF LTOTAL / LISTR1 KGM)
  (setq LISTR1 '(("6"  "0.222" "0" "0.00")("8"  "0.395" "0" "0.00")("10" "0.617" "0" "0.00")("12" "0.888" "0" "0.00")("14" "1.208" "0" "0.00")("16" "1.578" "0" "0.00")("18" "2.000" "0" "0.00")
		  ("20" "2.466" "0" "0.00")("22" "2.984" "0" "0.00")("25" "3.853" "0" "0.00")("28" "4.834" "0" "0.00")("32" "6.310" "0" "0.00"))
  ); mf fi 6
  (rtos (* (ATOF (CADR (ASSOC FIF LISTR1))) (ATOF LTOTAL)) 2 2)
)
;---------------------------------------------------------
(DEFUN CALCULAR3 (e le s)
  (setq listres '(("6"  "0.222" "0" "0.00")("8"  "0.395" "0" "0.00")("10" "0.617" "0" "0.00")("12" "0.888" "0" "0.00")("14" "1.208" "0" "0.00")("16" "1.578" "0" "0.00")("18" "2.000" "0" "0.00")
		  ("20" "2.466" "0" "0.00")("22" "2.984" "0" "0.00")("25" "3.853" "0" "0.00")("28" "4.834" "0" "0.00")("32" "6.310" "0" "0.00"))
  );mf fi 6
  (setq wtoto 0.00)
  
  (setq s1 (ssadd) contar 0)
  (repeat (sslength s)
    (setq em (ssname s contar))
    (setq lee (c:llamarplani em))
    (if (<= (length lee) 1)
      (setq s1 (ssadd (car lee) s1))
      (setq s1 (ssadd em s1))
    )
    (setq contar (1+ contar))
  )
  
  (setq valor (sslength s1) contar 0)
  (repeat valor
    (setq lee (c:llamarplani (ssname s1 contar)))
    (if (eq dxttipo "fi")  (setq fimm (cdr (assoc 1 (entget (nth 0 lee))))))
    (if (eq dxtfi "fi")    (setq fimm (cdr (assoc 1 (entget (nth 1 lee))))))
    (if (eq dxtnumero "fi")(setq fimm (cdr (assoc 1 (entget (nth 2 lee))))))
    (setq nuvar (cdr (assoc 1 (entget (last lee)))))
    
    (setq listmm (assoc fimm listres))
    (setq listwmm (nth 1 listmm))
    (setq llmm (itoa (+ (atoi (nth 2 listmm)) (* 12 (atoi nuvar)))))
    (setq listwt (rtos (* (atof listwmm) (atoi llmm)) 2 2))
    
    (setq listp_s (list fimm listwmm llmm listwt))
    (setq listres (subst listp_s listmm listres))
    
    (setq llmm (itoa (* 12 (atoi nuvar))))
    (setq listwt (rtos (* (atof listwmm) (atoi llmm)) 2 2))
    (setq wtoto (+ wtoto (atof listwt))) 
    
    (setq contar (1+ contar))
  )
  (setq ccon 0)
  (foreach x listres
    (setq v1 (nth 2 x))
    (setq en (entget (nth ccon le)))
    (setq e1 (assoc 1 en))
    (setq e2 (cons 1 v1))
    (setq en (subst e2 e1 en))
    (entmod en)
    
    (setq v1 (nth 3 x))
    (setq en (entget (nth (+ ccon 11) le)))
    (setq e1 (assoc 1 en))
    (setq e2 (cons 1 v1))
    (setq en (subst e2 e1 en))
    (entmod en)

    (setq ccon (1+ ccon))
  )
  (setq en (entget e))
  (setq e1 (assoc 1 en))
  (setq e2 (cons 1 (rtos wtoto 2 2)))
  (setq en (subst e2 e1 en))
  (entmod en)
)
;---------------------------------------------------------
(DEFUN EDITARDATO (e le)
  (setq opED 0)
  (SETQ CAJA066 (NEW_DIALOG "ediedi" DCL1))
  
  (if le
    (setq tedi "Data :")
    (setq tedi "Text:")
  )
  (setq bedi (cdr (assoc 1 (entget e))))
  
  (set_tile "tedi" tedi)
  (set_tile "bedi" bedi)
  (mode_tile "bedi" 2)
  (action_tile "cancel" "(setq opED 1)")
  (action_tile "bedi" "(setq bedi $value)(done_dialog)")
  
  (START_DIALOG)
  (DONE_DIALOG)

  (cond
    ((and le (= opED 0)(/= bedi ""))
      (setq en (entget e))
      (setq e1 (assoc 1 en))
      (setq e2 (cons 1 bedi))
      (setq en (subst e2 e1 en))
      (entmod en)
      (if (<= (length le) 1)(setq e (car le) le (c:llamarplani (car le))))
      (if (= (length le) 22)
	(progn
	  (CALCULAR2 e le)
	)
	(progn
	  (CALCULAR1 e le)
	)
      )
    )
    ((and (= le nil)(= opED 0)(/= bedi ""))
      (setq en (entget e))
      (setq e1 (assoc 1 en))
      (setq e2 (cons 1 bedi))
      (setq en (subst e2 e1 en))
      (entmod en)
    )
  )
)  
;---------------------------------------------------------
(DEFUN NUMEMAR1 (s1 numeini)
  (setq contar 0 ee (ssname s1 0) ymax (cadr (cdr (assoc 10 (entget ee)))))
  (while (setq e1 (ssname s1 contar))
    (setq y (cadr (cdr (assoc 10 (entget e1)))))
    (if (> y ymax)(setq ymax y ee e1))
    (setq contar (1+ contar))
  )
  (setq en (entget ee))
  (setq e1 (assoc 1 en))
  (setq e2 (cons 1 (itoa numeini)))
  (setq en (subst e2 e1 en))
  (entmod en)
  ee
)
;---------------------------------------------------------
(DEFUN C:EDIPLA ()
  (setq opcionEP 0)
  (SETQ CAJA66 (NEW_DIALOG "editardato" DCL1))
  
  (action_tile "edidat"  "(setq opcionEP 1)(done_dialog)")
  (action_tile "edimov"  "(setq opcionEP 2)(done_dialog)")
  (action_tile "edicop"  "(setq opcionEP 3)(done_dialog)")
  (action_tile "edibor"  "(setq opcionEP 4)(done_dialog)")
  (action_tile "edical"  "(setq opcionEP 5)(done_dialog)")
  (action_tile "undoedi" "(setq opcionEP 6)(done_dialog)")
  (action_tile "edicon"  "(setq opcionEP 7)(done_dialog)")
  
  (START_DIALOG)
  (DONE_DIALOG)
  
  (cond
    ((= opcionEP 1)
      (setvar "blipmode" 0)(setvar "cmdecho" 0)(CARGAR "C:llamarplani" "datext")   
      (while (setq e (entsel "\nSelect data of the Schedule : "))
	(setq e (car e))
	(setq le (c:llamarplani e))
	(if (eq "TEXT" (cdr (assoc 0 (entget e)))) 
	  (EDITARDATO e le)
	)
      )
      (setvar "blipmode" blipmodeANT)(setvar "cmdecho" old2)(C:EDIPLA)
    )
    ((= opcionEP 2)
      (setvar "blipmode" 0)(setvar "cmdecho" 0)(CARGAR "C:llamarplani" "datext")   
      (setq s (ssget  '((0 . "text") (-3 ("plani")))))
      (if s
	(progn
	  (setq s1 (ssadd) contar 0)
	  (repeat (sslength s)
	    (setq e (ssname s contar))
	    (setq s1 (ssadd e s1))
	    (setq le (c:llamarplani e))
	    (if (<= (length le) 1)
	      (setq s1 (ssadd (car le) s1) le (c:llamarplani (car le)))
	    )
	    (foreach x le
	      (if x (setq s1 (ssadd x s1)))
	    )
	    (setq contar (1+ contar))
	  )
	  (command "_move" s1 "" pause pause)
	)
      )
      (setvar "blipmode" blipmodeANT)(setvar "cmdecho" old2)(C:EDIPLA)
    )
    ((= opcionEP 3)
      (setvar "blipmode" 0)(setvar "cmdecho" 0)(CARGAR "C:llamarplani" "datext")   
      (setq s (ssget  '((0 . "text") (-3 ("plani")))))
      (if s
	(progn
	  (setq s1 (ssadd) s2 (ssadd) contar 0)
	  (repeat (sslength s)
	    (setq e (ssname s contar))
	    (setq s2 (ssadd e s2))
	    (setq le (c:llamarplani e))
	    (if (<= (length le) 1)
	      (progn
		(setq s1 (ssadd (car le) s1))
		(setq s2 (ssadd (car le) s2))
		(setq lee (c:llamarplani (car le)))
		(foreach x lee
		  (if x (setq s2 (ssadd x s2)))
		)
	      )
	      (progn
		(setq s1 (ssadd e s1))
		(setq lee (c:llamarplani e))
		(foreach x lee
		  (if x (setq s2 (ssadd x s2)))
		)
	      )
	    )
	    (setq contar (1+ contar))
	  )                           
	  (setq p1 (getpoint "\nSpecify base point :"))
	  (if p1
	    (progn
	      (command "_copy" s2 "" p1 pause)
	      (setq p2 (getvar "lastpoint"))
	      (command "_undo" "")
	      (setq contar 0)
	      (while (setq ee (ssname s1 contar))
		(setq li nil)
		(command "_copy" ee "" p1 p2)
		(setq li (append li (list (entlast))))
		(setq lee (c:llamarplani ee))
		(setq conte 0)
		(while (< conte 14)
		  (setq ee3 (nth conte lee))
		  (if ee3
		    (progn
		      (command "_copy" ee3 "" p1 p2)
		      (setq li (append li (list (entlast))))
		    )
		  )
		  (setq conte (1+ conte))
		)
		(c:grabarplani li)
		(setq contar (1+ contar))
	      ) 
	    )
	  )
	)
      )
      (setvar "blipmode" blipmodeANT)(setvar "cmdecho" old2)(C:EDIPLA)
    )
    ((= opcionEP 7)
      (setvar "blipmode" 0)(setvar "cmdecho" 0)(CARGAR "C:llamarplani" "datext")   
      (setq s (ssget  '((0 . "text") (-3 ("plani")))))
      (if s
	(progn
	  (setq s1 (ssadd) contar 0)
	  (repeat (sslength s)
	    (setq e (ssname s contar))
	    (setq le (c:llamarplani e))
	    (if (<= (length le) 1)
	      (setq s1 (ssadd (car le) s1))
	      (setq s1 (ssadd e s1))
	    )
	    (setq contar (1+ contar))
	  )                           
	  (setq numeini (getint "\nEnter initial mark : "))
	  (setq numeinc (getint "\nEnter Increment in Numeration : "))
	  (if (and numeini numeinc)
	    (progn
	      (setq ee (NUMEMAR1 s1 numeini))
	      (setq s1 (ssdel ee s1))
	      (while (> (sslength s1) 0)
		(setq numeini (+ numeini numeinc))
		(setq ee (NUMEMAR1 s1 numeini))
		(setq s1 (ssdel ee s1))
	      )
	    )
	  )
	)
      )
      (setvar "blipmode" blipmodeANT)(setvar "cmdecho" old2)(C:EDIPLA)
    )
    ((= opcionEP 4)
      (setvar "blipmode" 0)(setvar "cmdecho" 0)(CARGAR "C:llamarplani" "datext")   
      (setq s (ssget  '((0 . "text") (-3 ("plani")))))
      (if s
	(progn
	  (setq s1 (ssadd) contar 0)
	  (repeat (sslength s)
	    (setq e (ssname s contar))
	    (setq s1 (ssadd e s1))
	    (setq le (c:llamarplani e))
	    (if (<= (length le) 1)
	      (setq s1 (ssadd (car le) s1) le (c:llamarplani (car le)))
	    )
	    (foreach x le
	      (if x (setq s1 (ssadd x s1)))
	    )
	    (setq contar (1+ contar))
	  )                           
	  (command "_erase" s1 "")
	)
      )
      (setvar "cmdecho" old2)(setvar "blipmode" blipmodeANT)(C:EDIPLA)
    )
    ((= opcionEP 5)
      (setvar "blipmode" 0)(setvar "cmdecho" 0)(CARGAR "C:llamarplani" "datext")   
      (setq e (entsel "\nSpecify data of [Wtot (Kg) =] : "))
      (if e
	(progn
	  (setq e (car e))
	  (setq le (c:llamarplani e))
	  (if le
	    (progn
	      (if (<= (length le) 1)
		(setq e (car le) le (c:llamarplani e))
	      )
	      (if (= (length le) 22)
		(progn
		  (print "Select data for recalculate longitudes and weight, ")
		  (setq s (ssget  '((0 . "text") (-3 ("plani")))))
		  (if s
		    (CALCULAR3 e le s)
		    (alert "   Data have not been selected   ")
		  )
		)
	      )
	    )
	  )
	)
      )
      (setvar "cmdecho" old2)(setvar "blipmode" blipmodeANT)(C:EDIPLA)
    )
    ((= opcionEP 6)
      (C:PANZOON1)
      (C:EDIPLA)
    )
  )
)
;-------------------------------------------------------
(defun SELINT (snum1 stext1 / conteo ssint e)
  (setq conteo 0 ssint (ssadd))
  (while (setq e (ssname snum1 conteo))
    (if (ssmemb e stext1)(setq ssint (ssadd e ssint)))
    (setq conteo (1+ conteo))
  )
  ssint
)
;-------------------------------------------------------
(print (read "---------------------------------"))
(print       "ProHierro Professional 2007®    OK.")
(print (read "----------------"))

; SACA LA DISTANCIA ENTRE VARIOS PUNTOS DE UNA LISTA
(defun disvect (awq res)
 (cond ( (cdr awq)
	(disvect (cdr awq) (cons (rtos (distance (car awq) (cadr awq)) 2 2) res))
       )
       (t (setq res1(reverse res)))
 )
)
; ******** Cambia el valor de a por el valor de b gnr enero2002
(defun axbcambio ()
   (setq listaM (list bbb aaa ccc ddd eee fff))
   (setq listalong '(aaa bbb ccc ddd eee fff))
   (mapcar 'set listalong listaM)
)
; ******** SACA LA SUMA DE UN GRUPO DE LINEAS
(DEFUN MAITE1()
	(CARGAR "C:EJECUTAR" "layer-1")
	(setq layerlin (C:EJECUTAR layerlin)) 
	(setq conj (ssget (list (CONS 8 LAYERLIN)))) ; selecciona varios objetos filtrados por layer
	(setq contador 0)
	(setq listaResul1 nil)  
	(setq listaResul nil)
	( if (/= conj nil) 
	  (progn
		(repeat (sslength conj)
			(setq PIAM (ssname conj contador))
			(setq protemp (entget PIAM))
			(setq tipoTEMP (cdr (assoc 0 protemp)))
			(cond
				((= tipoTEMP "LINE")
				(setq listaM nil)                         
				(setq propiP1AM (entget PIAM))
				;******* punto inicial
				(setq punto1M (cdr (assoc 10 propiP1AM)))                         
				(if (/= punto1M nil)    
				(setq listaM (cons punto1M listaM))
				)
				;******** punto final   
				(setq punto1M (cdr (assoc 11 propiP1AM)))                         
				(if (/= punto1M nil)    
					(setq listaM (cons punto1M listaM))
				)       
				(setq listaM (reverse listaM))
				(disvect listaM nil)
				(setq listaResul (reverse res1))                           
			  
				)
				(T
				;(alert "Objeto mal seleccionado")              
				)    
			)      
			(setq contador (+ contador 1))
		       (setq listaResul1 (cons listaResul listaResul1))         
		)
	;*******
		(setq listaResul1 (apply '+ (mapcar 'read (mapcar 'car listaResul1))))          
		(setq aaa (rtos listaResul1 2 2))      
	)  
      (alert "There are not objects")
     ) 
	;********************
  (PH1)
)

; este metodo saca las distancias de una linea, polilínea o lwpolyline
(DEFUN MAITE()
      (setq P1AM1 (ENTSEL))
      (IF (/= P1AM1 nil)                ; gnr ener2002
	(progn
		(SETQ P1AM (CAR P1AM1)) ; gnr ener2002
		(setq protemp (entget P1AM))
		(setq tipoTEMP (cdr (assoc 0 protemp)))
		(cond
			((= tipoTEMP "POLYLINE")
			  (setq listaM nil)
			  (setq tipo1M "VERTEX")
			  (while (= tipo1M "VERTEX")
			    (setq P11M (entnext P1AM))
			    (setq propiP11M (entget P11M))
			    (setq punto1M (cdr (assoc 10 propiP11M)))
			    (setq tipo1M (cdr (assoc 0 propiP11M)))
			    (setq P1AM P11M)
			    (if (/= punto1M nil)        
			      (setq listaM (cons punto1M listaM))
			    )
			  )
			  (setq listaM (reverse listaM))
			  (disvect listaM nil)
			  (repeat (- 6 (length res1))
			    (setq res1(cons "0.0" res1))
			   )
			  (setq listaM (reverse res1))
			  (setq listalong '(aaa bbb ccc ddd eee fff))
			  (mapcar 'set listalong listaM)
			)

;                       gnr ener2002   para abajo
			((= tipoTEMP "LWPOLYLINE")
			  (setq listaM nil)
			  (while (setQ tipo1M (ASSOC 10 protemp))
			    (setq punto1M (cdr tipo1M))
			    (setq protemp (cdr (MEMBER (ASSOC 10 protemp) protemp)))
			    (if (/= punto1M nil)        
			      (setq listaM (cons punto1M listaM))
			    )
			  )
			  (setq listaM (reverse listaM))
			  (disvect listaM nil)
			  (repeat (- 6 (length res1))
			    (setq res1(cons "0.0" res1))
			   )
			  (setq listaM (reverse res1))
			  (setq listalong '(aaa bbb ccc ddd eee fff))
			  (mapcar 'set listalong listaM)
			)
;                       gnr ener2002   para arriba
			
			((= tipoTEMP "LINE")
			  (setq listaM nil)  ;  gnr ener2002
			  (setq listaResul1 nil)
			  (setq listaResul nil)
			  (setq listaM nil)                       
			  (setq propiP1AM (entget P1AM))
			  ;******* punto inicial
			  (setq punto1M (cdr (assoc 10 propiP1AM)))                       
			  (if (/= punto1M nil)  
			    (setq listaM (cons punto1M listaM))
			  )
			  ;******** punto final 
			  (setq punto1M (cdr (assoc 11 propiP1AM)))                       
			  (if (/= punto1M nil)  
			    (setq listaM (cons punto1M listaM))
			  )     
			  (setq listaM (reverse listaM))
			  (disvect listaM nil)
			  (setq listaResul (reverse res1))                                                    
			   (setq listalong '(aaa))
			  (mapcar 'set listalong listaResul)  
			  
			)
			(T
			(alert "The object not well selected")               
			)    
		)
	   )
	  (alert "Objects have not been selected")
	)
	(PH1)
)

(DEFUN C:PANZOON1()
 (command "_zoom" "")
)
;**************************************************************
(defun C:INSTALAR ()
       (setq archivo (getfiled "File with data" "" "" 2))
       (if (/= archivo nil)
	(Progn
		(setq archivo (open archivo "a"))           
	       (write-line "*** PRO_2000" archivo)    
	       (write-line "ID_PRO_2000_0  [_Toolbar(\"PRO_2000\", _Floating, _Show, 400, 50,1)]ID__1  [_Button(\"PRO_HIERRO\", \"ICON8467.bmp\", \"ICON_16_BLANK\")]^C^C(LOAD \"PH\") PH" archivo)    
	      (close archivo)
	);end progn
	(alert "The file was not read")
       );end if
)



*********************
(DEFUN c:PH_NEW()
  (CARGAR "C:AGRUPAR" "cambiar")
  (CARGAR "C:DIBLOSA" "graficos")
  (CARGAR "C:llamarTX" "datext")
  (CARGAR "C:EJECUTAR" "layer-1")
  (CARGAR "HIERROMARCA" "obtener")
  (CARGAR "saqueli" "placorte")  
  ;***********
  
  (if (= espt1 nil)(setq espt1 "ESPECIFICACIONES TECNICAS:"))
  (if (= espt2 nil)(setq espt2 "   HORMIGON f'c = 210 Kg/cm2"))
  (if (= espt3 nil)(setq espt3 "   HIERRO fy = 4200 ;Kg/cm2 EN FORMA DE VARILLA MILIMETRADA CORRUGADA"))
  (if (= espt4 nil)(setq espt4 "   TRASLAPES MINIMOS SI NO SE INDICAN EN LOS;PLANOS = 40 DIAMETROS DE"))
  (if (= espt5 nil)(setq espt5 "   LA VARILLA"))
  
  ;***********
  (if (= tifio nil)(setq tifio "V"))
  ;***********
 
  (if (= incmar nil)(setq incmar "0"))
  (if (= nomarch nil)(setq nomarch "Ninguno"))
  (if (= podercalc nil)(setq podercalc 0))  
  (if (= dxttipo   nil)(setq dxttipo   "tipo"))
  (if (= dxtfi     nil)(setq dxtfi     "fi"))
  (if (= dxtnumero nil)(setq dxtnumero "numero"))  
  (STYLELIST)
  (if (= styloprin  nil)(setq styloprin  "STANDARD"))
  (if (= styloplan  nil)(setq styloplan  "STANDARD"))
  (if (= stylodato  nil)(setq stylodato  "STANDARD"))
  (if (= stylomarca nil)(setq stylomarca "STANDARD"))  
  (if (= laylay nil)(setq laylay 0))
  (setq opcionPH 0)
  (if (= (getvar "handles") 0)(command "_handles" "on"));mf
  ;-- PROPIEDADES DIBUJO ACTUAL -----------------------
  (setq layerANT (getvar "clayer"))
  (setq old2 (getvar "cmdecho"))
  (setq os (getvar "osmode"))
  (setq blipmodeANT (getvar "blipmode"))
  (setq wideANT (getvar "plinewid"))
  (setq stitextANT (getvar "TEXTSTYLE"))
  ;---------------------------------------------------
  (if (= altmar   nil) (SETQ altmar   "0.10"))
  (if (= espace   nil) (SETQ espace   "0.02"))
  (if (= disx     nil) (SETQ disx     "0.000"))
  (if (= disxdefa nil) (SETQ disxdefa "0.150"))  
  (if (= oppremar nil)(setq oppremar  2))
  ;************ inicializar cajas de dialogo
  (SETQ ARCHIVO "PH.DCL")
  (if (= dcl1 nil)(SETQ DCL1 (LOAD_DIALOG ARCHIVO))) 

(IF (null listtipo)
  (setq listtipo (list  "I1"  "I"  "C"  "O"  "L"  "G"  "V"))
)
  (setq listfi   (list  "6"   "8"   "10"  "12"  "14"  "16" "18"  "20"  "22"  "25"  "28" "32")) ;mf aumentado 6
  (setq listwm (list 0.222 0.395 0.617 0.888 1.208 1.578 2.000 2.466 2.984 3.853 4.834 6.310)) ;mf 0.22
  
  (if (= reflejo  nil)(setq reflejo   1))
  (if (= posic    nil)(setq posic     2))
  
  (setvar "cmdecho" 0)
    (if (= layerest  nil) (SETQ layerest  (OBTLAYER "3")))
    (if (= layerpos  nil) (SETQ layerpos  (OBTLAYER "4")))
    (if (= layermar  nil) (SETQ layermar  (OBTLAYER "6")))
    (if (= layerace  nil) (SETQ layerace  (OBTLAYER "5")))
    (if (= layerplat nil) (SETQ layerplat (OBTLAYER "1")))
    (if (= layerplal nil) (SETQ layerplal (OBTLAYER "2")))
    (if (= layerdib  nil) (SETQ layerdib  (OBTLAYER "7")))
    (if (= layerlin  nil) (SETQ layerlin  (OBTLAYER "8")))       ; mf
    
    (if (= laylay 0)
      (progn
	(SETQ alayerest  layerest)  
	(SETQ alayerpos  layerpos)  
	(SETQ alayermar  layermar)   
	(SETQ alayerace  layerace)  
	(SETQ alayerplat layerplat) 
	(SETQ alayerplal layerplal) 
	(SETQ alayerdib  layerdib) 
	(SETQ alayerlin  layerlin) ; mf
      )
    )
  (setvar "cmdecho" old2)
  
  (if (= agrup     nil)(setq agrup      1))
  (if (= enlac     nil)(setq enlac      1))
  (if (= dibuj     nil)(setq dibuj      1))
  
  (foreach x '(pa pb pc pg)
    (set x "1")
  )                                 
  (foreach x '(pd pe pf)
    (if (= (eval x) nil)(set x "0"))
  )                                 
  (CONTNUNU)

  (foreach x '(elecM1 elecM2 elecM3 elecM4 elecM5 elecM6 elecM7 elecM8 elecM9)
    (if (= (eval x) nil)(set x "1"))
  )                                 
  (if (= elecM10  nil)(setq elecM10  "0"))
  
  (if (= M1  nil)(setq M1  "100"))
  (if (= M2  nil)(setq M2  "200"))
  (if (= M3  nil)(setq M3  "300"))
  (if (= M4  nil)(setq M4  "400"))
  (if (= M5  nil)(setq M5  "500"))
  (if (= M6  nil)(setq M6  "600"))
  (if (= M7  nil)(setq M7  "700"))
  (if (= M8  nil)(setq M8  "800"))
  (if (= M9  nil)(setq M9  "900"))
  (if (= M10 nil)(setq M10 "0"))      
  (setvar "cmdecho" 0)
        (command "_view" "_d" (strcat "x1-" alayerplat));mf
	(command "_view" "_d" (strcat "x2-" alayerplal));mf
	(command "_view" "_d" (strcat "x3-" alayerest)) ;mf
	(command "_view" "_d" (strcat "x4-" alayerpos)) ;mf
	(command "_view" "_d" (strcat "x5-" alayerace)) ;mf
	(command "_view" "_d" (strcat "x6-" alayermar)) ;mf
	(command "_view" "_d" (strcat "x7-" alayerdib)) ;mf
	(command "_view" "_d" (strcat "x8-" alayerlin)) ;mf
   
	(command "_view" "_s" (strcat "x1-" layerplat)) ;mf
	(command "_view" "_s" (strcat "x2-" layerplal)) ;mf
	(command "_view" "_s" (strcat "x3-" layerest))  ;mf
	(command "_view" "_s" (strcat "x4-" layerpos))  ;mf
	(command "_view" "_s" (strcat "x5-" layerace))  ;mf
	(command "_view" "_s" (strcat "x6-" layermar))  ;mf
	(command "_view" "_s" (strcat "x7-" layerdib))  ;mf
	(command "_view" "_s" (strcat "x8-" layerlin))  ;mf
      (setvar "cmdecho" old2)  
      (setvar "clayer" layerANT)
      (setvar "osmode" os)
      (setvar "plinewid" wideANT)
      (setq laylay 0)
)  

