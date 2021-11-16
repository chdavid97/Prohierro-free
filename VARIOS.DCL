//----------------------------------------------------------------------
actualizarm : dialog {
  label = "U P D A T E ";
  : boxed_row {
    label ="Option";
    : edit_box {key = "incmar";label = "Value added to Fixed Mark : ";edit_width = 6;}
    : text   { key = "" ;label = "   " ;edit_width = 3;}
    : text   { key = "vism" ;label = "Visualized Marks" ;}
  }
  : boxed_column {
    label ="Update Data";
    : row {
      : column {
        : row {
          : toggle { key = "actmarca"  ;label = "Mark " ;}
          : text   { key = "acttmarca" ;label = "115" ;}
        }
        : row {
          : toggle { key = "actglobal"  ;label = "Global" ;}
          : text   { key = "acttglobal" ;label = "100" ;}
        }
        : row {
          : toggle { key = "actfija"  ;label = "Fix" ;}
          : text   { key = "acttfija" ;label = "Si" ;}
        }
        : row {
          : toggle {key = "actcero"  ;label = "Zero" ;}
          : text   {key = "acttcero" ;label = "No" ;}
        }
      }
      : column {
        : row {
          : toggle {key = "acttipo"  ;label = "Type" ;}
          : text   {key = "actttipo" ;label = "I" ;}
        }
        : row {
          : toggle {key = "actfi"  ;label = "fi" ;}
          : text   {key = "acttfi" ;label = "14" ;}
        }
        : row {
          : toggle {key = "actnumero"  ;label = "Number" ;}
          : text   {key = "acttnumero" ;label = "3333" ;}
        }
      }
      : column {
        : row {
          : toggle {key = "actangulo"  ;label = "Angle" ;}
          : text   {key = "acttangulo" ;label = "333" ;}
        }      
        : row {
          : toggle {key = "actposic"  ;label = "Position" ;}
          : text   {key = "acttposic" ;label = "Cen" ;}
        }
        : row {
          : toggle {key = "actreflejo"  ;label = "Refletion" ;}
          : text   {key = "acttreflejo" ;label = "X-Y" ;}
        }
      }
      : column {
        : row {
          : toggle {key = "acta"  ;label = "a " ;}
          : text   {key = "actta" ;label = "2.50" ;}
        }
        : row {
          : toggle {key = "actb"  ;label = "b " ;}
          : text   {key = "acttb" ;label = "0.50" ;}
        }
        : row {
          : toggle {key = "actc"  ;label = "c " ;}
          : text   {key = "acttc" ;label = "0.00" ;}
        }
        : row {                   
          : toggle {key = "actg"  ;label = "g " ;}
          : text   {key = "acttg" ;label = "0.30" ;}
        }
      }
      : column {
        : row {
          : toggle {key = "actd"  ;label = "d " ;}
          : text   {key = "acttd" ;label = "0.00" ;}
        }
        : row {
          : toggle {key = "acte"  ;label = "e " ;}
          : text   {key = "actte" ;label = "0.00" ;}
        }
        : row {
          : toggle {key = "actf"  ;label = "f " ;}
          : text   {key = "acttf" ;label = "0.00" ;}
        }
        : row {
          : toggle {key = "actr"  ;label = "r " ;}
          : text   {key = "acttr" ;label = "0.05" ;}
        }
      }
    }
    : row {
      : text { key = "" ; label = "    " ; }
      : button {
        key = "acttodos" ;
        label = " All " ;
      }
      : text { key = "" ; label = "    " ; }
      : button {
        key = "actninguno" ;
        label = "None" ;
      }
      : text { key = "" ; label = "    " ; }
    }
    : row{
    	 : text   { key = "" ;label = "   " ;edit_width = 20;}
          : button {
	      key = "actm" ;
	      label = "Select Objects" ;
	    }
       	 : text   { key = "" ;label = "   " ;edit_width = 20;}
   }
  }
  
  ok_cancel;
}

//----------------------------------------------------------------------
graficos : dialog {
  label = "Graphical Assistance";
  
  : boxed_row {
    label = "Connection" ;
    : column {
      : radio_button {
        key = "verenla" ;
        label = "Verify Connection" ;
      }
      : radio_button {
        key = "mirarenla" ;
        label = "Display Connection" ;
      }
      : radio_button {
        key = "enla" ;
        label = "Connect Bar and Mark" ;
      }
      : radio_button {
        key = "desenla" ;
        label = "Disconnect Bar and Mark" ;
      }
    }
    : image_button {
      key = "enlazar";
      height = 5;
      width = 7;
    }
  }
  
  : image {
    key = "enlace-I";
    height = 5;
    width = 20;
  }

  : boxed_column {
    label = "Drawing Options" ;
    : column {
      : row {  
        : button {
          key = "layerdib" ;
          label = "Layer..." ;
        }
        : text {
          key = "tlayerdib";
          label = "                      ";
          edit_width = 22;
        }
        : image_button {
           key = "imagenDIB";
           height = 1;
           width = 3;
        }
      }
      
      : row {
        : radio_button {key = "Dbloques" ; label = "Blocks        " ;}
        : radio_button {key = "Dmarcas" ;  label = "Slab Donuts   " ;}
      }
      : row {
        : radio_button {key = "Dvigas" ;   label = "Slabs/Columns " ;}
        : radio_button {key = "Destribos" ;label = "Stirrups V/C  " ;}
      }    
      : row {
        : radio_button {key = "Dgradas" ;  label = "Stairs        " ;}
        : radio_button {key = "Dlosa" ;    label = "Drawing Plants" ;}
      }
      : row {
        : radio_button {key = "Dcorte" ;   label = "Insert        " ;}
        : radio_button {key = "Dvarios" ;  label = "Various       " ;}
      }
    }
    : row {
      : button {
        key = "dibujar" ;
        label = "         Go...         " ;
      }
      
    }
  }
  : row {
	: button {
        key = "undog" ;
        label = "Zoom" ;
      }
  ok_cancel;
}
}

//----------------------------------------------------------------------
borrar : dialog {
  label = "S T E E L S  A N D  M A R K S";
  
  : boxed_column {
     label = "Delete" ;
    : radio_button {
      key = "bmarcas" ;
      label = "Marks Text" ;
    }
    : radio_button {
      key = "baceros" ;
      label = "Steel Graphic" ;
    }
    : radio_button {
      key = "bmarcasyaceros" ;
      label = "Marks Text and Steel Graphic" ;
    }
    : button {
      key = "bborrar" ;
      label = "Select Object" ;
    }
  }

  ok_cancel;
}

//----------------------------------------------------------------------
agrupar : dialog {
  label = "G R O U P   B A R S ";
  
  : boxed_column {
     label = "Options" ;
    : row { 
      : edit_box {key = "nom1" ;label = "Name";edit_width = 6;}
      : edit_box {key = "alt1" ;label = "Hei.";edit_width = 6;}
      : button   {key = "nom2" ;label = "Draw" ;}
    }
    : radio_button {key = "veragrupamientos" ;label = "Visualize Group" ;}
    : radio_button {key = "agruparhierros" ;label = "Group Bars under a name" ;}
    : radio_button {key = "desagruparhierros" ;label = "Ungroup Bars of name" ;}
    : row { 
      : button {key = "agrupar" ;label = "  Select Objects  " ;}
      
    }
  }
  
  : image {
    key = "viga";
    height = 7;
    width = 20;
  }
: row {
	: button {key = "undover" ;label = "Zoom" ;}	
  ok_cancel;
}
}

//----------------------------------------------------------------------
Walert : dialog {
  label = " I N C O R R E C T   C O N N E C T I O N ";
  
  : text {
    key = "Wtexto" ;
    label = "               " ;
  }
  
  : row {
    : button {
      key = "Wenla" ;
      label = "Connect" ;
    }
    : button {
      key = "Wdesenla" ;
      label = "disconnect" ;
    }
  }

  ok_only;
}


