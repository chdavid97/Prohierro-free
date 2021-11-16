;-------------  S  E  R  V  I  N  C  A  D -------------
(defun C:grabarTX (entTX / identific datos a11 b11 c11 d11 e11 f11 g11 r11 ref11 pos11)
  (setq identific  "acerTX")
  
  (cond
    ((= tipo "0")(setq a11 aaa      b11 "0.00"   c11 "0.00"   d11 "0.00"   e11 "0.00"   f11 "0.00"   g11 ggg      r11 "0.00"))
    ((= tipo "1")(setq a11 aaa      b11 "0.00"   c11 "0.00"   d11 "0.00"   e11 "0.00"   f11 "0.00"   g11 ggg      r11 rrr   ))
    ((= tipo "2")(setq a11 aaa      b11 bbb      c11 "0.00"   d11 "0.00"   e11 "0.00"   f11 "0.00"   g11 "0.00"   r11 "0.00"))
    ((= tipo "3")(setq a11 aaa      b11 bbb      c11 "0.00"   d11 "0.00"   e11 "0.00"   f11 "0.00"   g11 ggg      r11 rrr   ))
    ((= tipo "4")(setq a11 aaa      b11 bbb      c11 "0.00"   d11 "0.00"   e11 "0.00"   f11 "0.00"   g11 ggg      r11 rrr   ))
    ((= tipo "5")(setq a11 aaa      b11 bbb      c11 ccc      d11 "0.00"   e11 "0.00"   f11 "0.00"   g11 "0.00"   r11 "0.00"))
    ((= tipo "6")(setq a11 aaa      b11 bbb      c11 ccc      d11 ddd      e11 eee      f11 fff      g11 ggg      r11 "0.00"))
  )
  
  (setq ref11 (itoa reflejo) pos11 (itoa posic))

  (setq datos (strcat "\""   codigo   "\""       ;  1
                      " \""  Mfija    "\""       ;  2
                      " \""  Mmarca   "\""       ;  3
                      " \""  Mglobal  "\""       ;  4
                      " \""  Mtipo    "\""       ;  5
                      " \""  fi       "\""       ;  6
                      " \""  numero   "\""       ;  7
                      " \""  a11      "\""       ;  8
                      " \""  b11      "\""       ;  9
                      " \""  c11      "\""       ; 10
                      " \""  d11      "\""       ; 11
                      " \""  e11      "\""       ; 12
                      " \""  f11      "\""       ; 13
                      " \""  g11      "\""       ; 14
                      " \""  r11      "\""       ; 15
                      " \""  HPL      "\""       ; 16
                      " \""  HTX      "\""       ; 17
                      " \""  ref11    "\""       ; 18
                      " \""  pos11    "\"")      ; 19
  )
  
  (gdato identific entTX datos)
)
;------------------------------------------
(defun C:llamarTX (entTX / identific tiene tener ref11 pos11)
  (setq identific  "acerTX")
  (setq tiene (odato identific entTX))
  (setq tieneV tiene)
  (if (/= tiene nil)
    (progn

      (setq tener (read (strcat "(" tiene ")")))
      (setq Wcodigo  (nth  0 tener)) 
      (setq WMfija   (nth  1 tener)) 
      (setq WMmarca  (nth  2 tener)) 
      (setq WMglobal (nth  3 tener)) 
      (setq WMtipo   (nth  4 tener)) 
      (setq Wfi      (nth  5 tener)) 
      (setq Wnumero  (nth  6 tener)) 
      (setq Wa11     (nth  7 tener)) 
      (setq Wb11     (nth  8 tener)) 
      (setq Wc11     (nth  9 tener)) 
      (setq Wd11     (nth 10 tener)) 
      (setq We11     (nth 11 tener)) 
      (setq Wf11     (nth 12 tener)) 
      (setq Wg11     (nth 13 tener)) 
      (setq Wr11     (nth 14 tener)) 
      (setq WHPL     (nth 15 tener)) 
      (setq WHTX     (nth 16 tener)) 
      (setq Wref11   (nth 17 tener)) 
      (setq Wpos11   (nth 18 tener)) 
    )        
    (progn      
      (setq Wcodigo  codigo) 
      (setq WMfija   Mfija) 
      (setq WMmarca  Mmarca) 
      (setq WMglobal Mglobal) 
      (setq WMtipo   Mtipo)      
      (setq Wfi      fi) 
      (setq Wnumero  numero) 
      (setq Wa11     aaa) 
      (setq Wb11     bbb) 
      (setq Wc11     ccc) 
      (setq Wd11     ddd) 
      (setq We11     eee) 
      (setq Wf11     fff) 
      (setq Wg11     ggg) 
      (setq Wr11     rrr) 
      (setq WHPL     HPL) 
      (setq WHTX     HTX) 
      (setq Wref11   (itoa reflejo)) 
      (setq Wpos11   (itoa posic)) 
    )                
  )
  (setq Wreflejo (atoi Wref11) Wposic (atoi Wpos11))
  tieneV  
)
;----------------------------------------------
(defun C:grabarPL (entPL / identific datos a11 b11 c11 d11 e11 f11 g11 r11 ref11 pos11)
  (setq identific  "acerPL")
  
  (cond
    ((= tipo "0")(setq a11 aaa      b11 "0.00"   c11 "0.00"   d11 "0.00"   e11 "0.00"   f11 "0.00"   g11 ggg      r11 "0.00"))
    ((= tipo "1")(setq a11 aaa      b11 "0.00"   c11 "0.00"   d11 "0.00"   e11 "0.00"   f11 "0.00"   g11 ggg      r11 rrr   ))
    ((= tipo "2")(setq a11 aaa      b11 bbb      c11 "0.00"   d11 "0.00"   e11 "0.00"   f11 "0.00"   g11 "0.00"   r11 "0.00"))
    ((= tipo "3")(setq a11 aaa      b11 bbb      c11 "0.00"   d11 "0.00"   e11 "0.00"   f11 "0.00"   g11 ggg      r11 rrr   ))
    ((= tipo "4")(setq a11 aaa      b11 bbb      c11 "0.00"   d11 "0.00"   e11 "0.00"   f11 "0.00"   g11 ggg      r11 rrr   ))
    ((= tipo "5")(setq a11 aaa      b11 bbb      c11 ccc      d11 "0.00"   e11 "0.00"   f11 "0.00"   g11 "0.00"   r11 "0.00"))
    ((= tipo "6")(setq a11 aaa      b11 bbb      c11 ccc      d11 ddd      e11 eee      f11 fff      g11 ggg      r11 "0.00"))
  )
  
  (setq ref11 (itoa reflejo) pos11 (itoa posic))

  ;(setq datos (strcat "\""   HNT    "\""       ;  1
  ;                    " \""  Mtipo  "\""       ;  2
  ;                    " \""  pos11  "\""       ;  3
  ;                    " \""  ref11  "\""       ;  4
  ;                    " \""  a11    "\""       ;  5
  ;                    " \""  b11    "\""       ;  6
  ;                    " \""  c11    "\""       ;  7
  ;                    " \""  d11    "\""       ;  8
  ;                    " \""  e11    "\""       ;  9
  ;                    " \""  f11    "\""       ; 10
  ;                    " \""  g11    "\""       ; 11
  ;                    " \""  r11    "\"")      ; 12
  ;)
  
  (setq datos (strcat "\""   HNT    "\""       ;  1
                      " \""  Mtipo  "\""       ;  2
                      " \""  pos11  "\""       ;  3
                      " \""  ref11  "\""       ;  4
                      " \""  g11    "\"")      ;  5 
  )
  (gdato identific entPL datos)
  ;(print datos)
)
;----------------------------------------------
(defun C:llamarPL (entPL / identific tiene tener Wpos11 Wref11)
  (setq identific  "acerPL")
  (setq tiene (odato identific entPL))
  (setq tieneP tiene)
  (if (/= tiene nil)
    (progn
      (setq tener (read (strcat "(" tiene ")")))
      ;(print tener)
      (setq WHNT    (nth  0 tener)) 
      (setq WMTI    (nth  1 tener)) 
      (setq Wpos11  (nth  2 tener)) 
      (setq Wref11  (nth  3 tener)) 
      ;(setq Wa11    (nth  4 tener)) 
      ;(setq Wb11    (nth  5 tener)) 
      ;(setq Wc11    (nth  6 tener)) 
      ;(setq Wd11    (nth  7 tener)) 
      ;(setq We11    (nth  8 tener)) 
      ;(setq Wf11    (nth  9 tener)) 
      ;(setq Wg11    (nth 10 tener)) 
      ;(setq Wr11    (nth 11 tener)) 
      (setq Wreflejo (atoi Wref11) Wposic (atoi Wpos11))
      
      (setq Wg11    (nth 4 tener)) 
      (C:PPLL entPL)
    )
    (progn
      (setq WHNT "no") 
    )
  )
  tieneP
)
;----------------------------------
(defun C:grabarplani (listt / l5 datos l identific) 
  (setq l5 nil)(repeat (length listt) (setq l5 (append l5 (list 5))))
  (setq l (mapcar 'cdr (mapcar 'assoc l5 (mapcar 'entget listt))))
  (if (/= (length l) 23)
    (progn
      (setq identific  "plani")
      (setq listename nil)
      (setq listename (append listename (list (nth 0 l))))
      (if (eq dxttipo "type")    (setq listename (append listename (list (nth 1 l)))))
      (if (eq dxtfi "type")      (setq listename (append listename (list (nth 2 l)))))
      (if (eq dxtnumero "type")  (setq listename (append listename (list (nth 3 l)))))
      (if (eq dxttipo "fi")      (setq listename (append listename (list (nth 1 l)))))
      (if (eq dxtfi "fi")        (setq listename (append listename (list (nth 2 l)))))
      (if (eq dxtnumero "fi")    (setq listename (append listename (list (nth 3 l)))))
      (if (eq dxttipo "number")  (setq listename (append listename (list (nth 1 l)))))
      (if (eq dxtfi "number")    (setq listename (append listename (list (nth 2 l)))))
      (if (eq dxtnumero "number")(setq listename (append listename (list (nth 3 l)))))
      (setq listename (append listename (list (nth 4 l))))
      (setq listename (append listename (list (nth 5 l))))
      (setq listename (append listename (list (nth 6 l))))
      
      (if (and (eq pd "1")(eq pe "1")(eq pf "1"))(setq listename (append listename (list (nth 7 l) (nth 8 l) (nth 9 l)))))
      (if (and (eq pd "0")(eq pe "0")(eq pf "0"))(setq listename (append listename (list "no" "no" "no"))))
      (if (and (eq pd "1")(eq pe "0")(eq pf "0"))(setq listename (append listename (list (nth 7 l) "no" "no"))))
      (if (and (eq pd "1")(eq pe "1")(eq pf "0"))(setq listename (append listename (list (nth 7 l) (nth 8 l) "no"))))
      (if (and (eq pd "1")(eq pe "0")(eq pf "1"))(setq listename (append listename (list (nth 7 l) "no" (nth 8 l)))))
        
      (if (and (eq pd "0")(eq pe "1")(eq pf "0"))(setq listename (append listename (list "no" (nth 7 l) "no"))))
      (if (and (eq pd "0")(eq pe "1")(eq pf "1"))(setq listename (append listename (list "no" (nth 7 l) (nth 8 l)))))
      (if (and (eq pd "0")(eq pe "0")(eq pf "1"))(setq listename (append listename (list "no" "no" (nth 7 l)))))

      (setq listename (append listename (list (nth 2 (reverse l)))))
      (setq listename (append listename (list (nth 1 (reverse l)))))
      (setq listename (append listename (list (nth 0 (reverse l)))))
      (setq l listename listename nil)
    )
    (setq identific  "resul")
  )
  
  (setq l5 nil)(repeat (length l) (setq l5 (append l5 (list "\""))))
  (setq l (mapcar 'strcat l5 l l5))

  (setq cco 0)
  (while (setq ae (nth cco listt))
    (if (= cco 0)
      (progn
        (setq datos (car (mapcar 'stl (list (cdr l)))))
        (gdato identific ae datos)
      )
      (progn
        (setq datos (car l))
        (gdato identific ae datos)
      )
    )
    (setq cco (1+ cco))
  )
)
;----------------------------------
(defun C:llamarplani (ent) 
  (setq tener nil)
  (setq tiene1 (odato "plani" ent))
  (setq tiene2 (odato "resul" ent))
  (if tiene1
    (progn
      (setq tener (read (strcat "(" tiene1 ")")))
      (setq tener (mapcar 'handent tener))
    )        
  )  
  (if tiene2
    (progn
      (setq tener (read (strcat "(" tiene2 ")")))
      (setq tener (mapcar 'handent tener))
    )
  )
  tener
)
