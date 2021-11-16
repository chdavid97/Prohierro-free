;--------------------------------------------------------------------
(defun C:EJECUTAR (lay33 / ant antt)
   (setq bandera 2)
   (setq ant lay33)
   (setq sortlist nil)
   (setq templist (tblnext "LAYER" T))
   (while templist
      (setq name (cdr (assoc 2 templist)))
      (setq sortlist (cons name sortlist))
      (setq templist (tblnext "LAYER"))
   ) 
   (if (>= (getvar "maxsort") (length sortlist))
     (setq sortlist (acad_strlsort sortlist))
     (setq sortlist (reverse sortlist))
   )
   (setq laynmlst sortlist)
   
   (setq lay-idx (getindex lay33 laynmlst))
   
   (setq dcl_id (load_dialog "layer-1.dcl"))
   (makelaylists)
   (setq antt (getlayer))
   (if (or (= antt "Varies")(= antt nil))
     (setq antt ant)
   )
   antt
)
  
;--------------------------------------------------------------------
  (defun getindex (item itemlist / m n)
    (setq n (length itemlist))
    (if (> (setq m (length (member item itemlist))) 0)
        (- n m)
        nil
    )
  )

;;;----------------------------------------------------------------------------
;;;
;;;   DDCHPROP.LSP   Version 0.5
;;;
;;;   Copyright (C) 1991-1992 by Autodesk, Inc.
;;;
;;;   Permission to use, copy, modify, and distribute this software
;;;   for any purpose and without fee is hereby granted, provided
;;;   that the above copyright notice appears in all copies and that
;;;   both that copyright notice and this permission notice appear in
;;;   all supporting documentation.
;;;
;;;   THIS SOFTWARE IS PROVIDED "AS IS" WITHOUT EXPRESS OR IMPLIED
;;;   WARRANTY.  ALL IMPLIED WARRANTIES OF FITNESS FOR ANY PARTICULAR
;;;   PURPOSE AND OF MERCHANTABILITY ARE HEREBY DISCLAIMED.
;;;
;;;   2 February 1992
;;;   Modificado por G.N.R.  2 September 1996  

;--------------------------------------------------------------------
(defun test-ok ( / errtile)
  (setq errtile (get_tile "error"))
  (cond
    (  (= errtile "")
       (setq bandera 1)(done_dialog 1))
    (  (= errtile "Invalid thickness.")
       (mode_tile "eb_thickness" 2))
  )
)

;--------------------------------------------------------------------
(defun colorname (colnum)
    (setq cn (abs colnum))
    (cond ((= cn 1) "red")
          ((= cn 2) "yellow")
          ((= cn 3) "green")
          ((= cn 4) "cyan")
          ((= cn 5) "blue")
          ((= cn 6) "magenta")
          ((= cn 7) "white")
          (T (itoa cn))
    )
  )


  (defun makelaylists (/ layname onoff frozth color linetype vpf vpn ss cvpname
                         xdlist vpldata sortlist name templist bit-70
                      )
    (if (= (setq tilemode (getvar "tilemode")) 0)
      (progn
        (setq ss (ssget "x" (list (cons 0 "VIEWPORT")
                                  (cons 69 (getvar "CVPORT"))
                            )
                 )
        )     
        (setq cvpname (ssname ss 0))
        (setq xdlist (assoc -3 (entget cvpname '("acad"))))
        (setq vpldata (cdadr xdlist))
      )
    )
    (setq sortlist nil)
    (setq templist (tblnext "LAYER" T))
    (while templist
      (setq name (cdr (assoc 2 templist)))
      (setq sortlist (cons name sortlist))
      (setq templist (tblnext "LAYER"))
    ) 
    (if (>= (getvar "maxsort") (length sortlist))
      (setq sortlist (acad_strlsort sortlist))
      (setq sortlist (reverse sortlist))
    )
    (setq laynmlst sortlist)
    (setq longlist nil)
    (setq layname (car sortlist))
    (while layname
      (setq laylist (tblsearch "LAYER" layname))
      (setq color (cdr (assoc 62 laylist)))
      (if (minusp color)
        (setq onoff ".")
        (setq onoff "On")
      )
      (setq color (abs color))
      (setq colname (colorname color))
      (setq bit-70 (cdr (assoc 70 laylist)))
      (if (= (logand bit-70 1) 1)
        (setq frozth "F" fchk laylist)
        (setq frozth ".")
      )
      (if (= (logand bit-70 2) 2)
        (setq vpn "N")
        (setq vpn ".")
      )
      (if (= (logand bit-70 4) 4)
        (setq lock "L")
        (setq lock ".")
      )
      (setq linetype (cdr (assoc 6 laylist)))
      (setq layname (substr layname 1 31))
      (if (= tilemode 0)
        (progn
          (if (member (cons 1003 layname) vpldata)
            (setq vpf "C")
            (setq vpf ".")
          )
        )
        (setq vpf ".")
      )
      (setq ltabstr (strcat layname "\t"
                              onoff "\t"
                             frozth "\t"
                               lock "\t"
                                vpf "\t"
                                vpn "\t"
                            colname "\t"
                           linetype
                    )
      )
      (setq longlist (append longlist (list ltabstr)))
      (setq sortlist (cdr sortlist))
      (setq layname (car sortlist))
    )
  )


  (defun laylist_act (index / layinfo color dashdata)
    ;; Update the list box, edit box, and color tile
    (set_tile "error" "")
    (setq lay-idx (atoi index))
    (setq layname (nth lay-idx laynmlst))
    (setq layinfo (tblsearch "layer" layname))
    (if (= (logand (cdr (assoc 70 layinfo)) 4) 4)
      (set_tile "error" "Cannot change entity to locked layer.")
      (progn
        (setq color (cdr (assoc 62 layinfo)))
        (setq color (abs color))
        (setq colname (colorname color))
        (set_tile "list_lay" (itoa lay-idx))
        (set_tile "edit_lay" layname)
        (mode_tile "list_lay" 2)
      )
    )
  )
  ;;
  ;; Reset to original layer when cancel is selected
  ;;
  (defun reset-lay ()
    (setq lay-idx old-idx)
    (done_dialog 0)
  )



  (defun getlayer (/ old-idx layname on off frozth linetype colname)
    ;; Load a dialogue from dialogue file
    (if (not (new_dialog "setlayer" dcl_id)) (exit))
    (start_list "list_lay")
    (mapcar 'add_list longlist)        ; initialize list box
    (end_list)
    ;; Display current layer, show initial layer name in edit 
    ;; box, and highlight list box.
    (setq old-idx lay-idx)
    (if (/= lay-idx nil) (laylist_act (itoa lay-idx)))
    (set_tile "cur_layer" (getvar "clayer"))
    (action_tile "list_lay" "(laylist_act $value)")
    (action_tile "edit_lay" "(layedit_act $value)")
    (action_tile "accept" "(test-ok)")
    (action_tile "cancel" "(reset-lay)")
    (if (= (start_dialog) 1)           ; User pressed OK
      (progn
        (if (= lay-idx nil) (setq layname "Varies"))
        (set_tile "t_layer" layname)
        ; If layer or ltype equals bylayer reset their tiles
        (if (= lt-idx 0)
          (set_tile "t_ltype" (bylayer_lt))
        )
        (if (= ecolor 256)
          (progn
            (set_tile "t_color" (bylayer_col))
            (col_tile "show_image" cn nil)
          )
        )
        layname
      )
      elayer
    )
  )
