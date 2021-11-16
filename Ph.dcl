//----------------------------------------------------------------------
inicio : dialog {
  label = "P R O - H I E R R O    P R O F E S S I O N A L 2007®";
  : row {
	: boxed_column {
		label = "Parameters";		
	      : image {
        	 key = "imagen_MODO";
	         height = 1;
        	 width = 6;
	      }
	      : row {
	      : popup_list {
        	key = "tipo";
	        label = "Type";
        	list = "I1\nI\nC\nO\nL\nG\nOtro"; 
	        edit_width = 4;
	      }
	      :edit_box {
        	key = "tifio";
        	label ="";
	        edit_width =2;
	        edit_limit =2;
	      }
	      }
	      : row{
	      : popup_list {
        	key = "fi";
	        label = "fi  ";
	        list = "6\n8\n10\n12\n14\n16\n18\n20\n22\n25\n30\n32"; 
	        edit_width = 4;
	      }
	      : text{key="";label="";edit_width=1;}  // gnr ene2002
	     }
	     : row {
	      : edit_box {
        	key = "numero";
	        label = "No. ";
	        edit_width = 6;
	      }
	      : text{key="";label="";edit_width=1;}
	     } 
	    }
    	: boxed_column {
	      label = "Marks";
	      : row {
        	: text { key = "";label = "Code ";edit_width = 6;}
	        : text {
	          key = "codigo";
        	  label = "Cod.";
	          edit_width = 5;
	        	}   
      		}
	      : edit_box {
        	key = "marca";
	        label = "Mark  :";
	        edit_width = 6;
	      }
	      : edit_box {
        	key = "global";
	        label = "Global :";
	        edit_width = 6;
	      }
	      :row {
        	: toggle {
	          key = "fija";
	          label = " Fix ";
        	}
     		   : toggle {
	          key = "cero" ;
	          label = "Cod.0" ;
        	}
	      }
	    }
	    : boxed_row {
	      label = "Data";
	      : column {
        	: edit_box {
	          key = "a";
        	  label = "a :";
	          edit_width = 5;
        	} 
	        : edit_box {
        	  key = "b";
	          label = "b :";
        	  edit_width = 5;
	        } 
        	: edit_box {
	          key = "c";
        	  label = "c :";
	          edit_width = 5;
        	} 
	        : edit_box {
        	  key = "g";
	          label = "g :";
        	  edit_width = 5;
	        }
	      } 
	      : column {
        	: edit_box {
	          key = "d";
        	  label = "d :";
	          edit_width = 5;
        	}
	        : edit_box {
        	  key = "e";
	          label = "e :";
        	  edit_width = 5;
	        }
        	: edit_box {
	          key = "f";
        	  label = "f :";
         	 edit_width = 5;
	        }
        	: edit_box {
	          key = "r";
        	  label = "r :";
	          edit_width = 5;
        	}
     	 }
    }  
  }  
      
  : row {
    : boxed_column {
      label = "Rotation Angle";    
      : row {
        : radio_button {
          key = "ang1" ;
          label = "0" ;
        }
        : radio_button {
          key = "ang2" ;
          label = "90" ;
        }
        : radio_button {
          key = "ang3" ;
          label = "180" ;
        }
        : radio_button {
          key = "ang4" ;
          label = "270" ;
        }
      }
      : row {
        : toggle {
          key = "otroang";
          label = "Other";
        }
        : edit_box {
          key = "angulo";
          label = "Angle:";
        }
      }
    }
    : boxed_column {
      label = "Visualize";    
      : row {
        : radio_button {
          key = "visualcod" ;
          label = "Codes" ;
        }
        : radio_button {
          key = "visualmar" ;
          label = "Marks" ;
        }
      }
      : row {
        : button {
          key = "cambiartext" ;
          label = "Change texts" ;
        }
        : button {
          key = "ejemplo" ;
          label = "Example..." ;
        }
      }
    }
  }
     
  : row {
    : boxed_column {
      label = "Steel Form";
      : image_button {
         key = "Slide_C";
         height = 7;
         width = 20;
      }
      : button {
        key = "mirrort" ;
        label = "Reflection" ;
      }
    } 
   : column {    
      : boxed_column {
        label = "Obtain Information";        
	: button { //botón obtener
          key = "Ob_new" ;
          label = "Dist/Angle" ;
          Align = left;
        }
	: button {
          key = "Ob_new1" ;
          label = "Automatic Dist." ;
        }
	: button {
          key = "Ob_new2" ;
          label = "Sum Lines" ;
        }
        
        : button {
          key = "hierromarca" ;
          label = "Bar or Mark" ;
        }        
        : button {
	  key = "donas" ;
          label = "N. Donuts" ;
	}	     	
	: button {
	  key = "estribo" ;
          label = "N. Stirrups" ;
        }	
      }     
     }   	
    : column {
	: boxed_row {
        label = "Draw";
        : popup_list {
          key = "tdibuj";
          label = "";
          list = " Steel,Mark\nOnly Mark\nOnly Steel"; 
          edit_width = 11;	
        }
        : button {
          key = "dibujarAM" ;
          label = "Draw" ;
        }
      }    
      : boxed_column {
        label = "Modify";
        : button {
          key = "actualizarmarcas" ;
          label = "  Global Edit.. " ;
        }
	: button {
          key = "editarmarca" ;
          label = "Mark Edit >>" ;
        }
        
      }
      : boxed_column {
        label = "Manner";
        : button {
          key = "nuevamarca" ;
          label = "New Mark" ;
        }
        : button {
          key = "borrarmarcas" ;
          label = "Delete..." ;
        }
      }     
    }
}
  : row {  
  : text { key = "";label = "   ";edit_width = 20;}     
   : button {
      key = "undol" ;
      label = "Zoom" ;
    }
  : text { key = "";label = "   ";edit_width = 5;}     
    : button {
      key = "especiales" ;
      label = "Special..." ;
    }
    : button {                  // gnr ene2002
        key = "axb" ;           // gnr ene2002
       label = "a X b" ;        // gnr ene2002
       edit_width = 1;          // gnr ene2002
    }                           // gnr ene2002
    : text {
      key = "tmensajes" ;
      label = "" ;
      edit_width = 1;
    } 
     : text { key = "";label = "   ";edit_width = 5;}     
      ok_only;
     : text { key = "";label = "   ";edit_width = 20;}     
  }

}

//----------------------------------------------------------------------
especial : dialog {
  label = "SPECIAL DATA";
  
  : boxed_column {
    label = "DatA";
    : row {  
      : button {
        key = "layermar" ;
        label = "Layer Mark..." ;
      }
      : text {
        key = "tlayermar";
        label = "                ";
        edit_width = 16;
      }
      : image_button {
         key = "imagenL1";
         height = 1;
         width = 3;
      }
    }
    : row {
      : button {
        key = "layerace" ;
        label = "Layer Steel..." ;
      }
      : text {
        key = "tlayerace";
        label = "                ";
        edit_width = 16;
      }
      : image_button {
         key = "imagenL2";
         height = 1;
         width = 3;
      }
    }
    : row {
      : edit_box   {key = "altmar"  ;label = "Mark Height  :";edit_width = 6;}
      : popup_list {key = "stimarca";label = ""               ;edit_width = 10;}
    }
    : edit_box {
      key = "espace";
      label = "Steel Thickness :";
    }
  }

  : boxed_column {
    label = "Update";
    : radio_button {
      key = "marcas" ;
      label = "Mark Text" ;
    }
    : radio_button {
      key = "aceros" ;
      label = "Steel Graphic" ;
    }
    : radio_button {
      key = "marcasyaceros" ;
      label = "Mark Text and Steel Graphic" ;
    }
    : button {
      key = "actualizar" ;
      label = "Select Objets" ;
    }
  }
  ok_cancel;
}

//----------------------------------------------------------------------
opciones : dialog {
  label = "SCHEDULE OPTIONS";

  : boxed_column {
    label = "Options";
    : text {
      key = "archivo" ;
      label = "File Name : None" ;
    }
    : button {
      key = "calcular" ;
      label = "Calculate Schedule..." ;
    }
    : row {
      : button {
        key = "veditar" ;
        label = "Visualize Schedule...   " ;
      }
      : button {
        key = "reditar" ;
        label = "Visualize Results... " ;
      }
    }
    : row {
      : button {
        key = "gralla1" ;
        label = "Save Schedule..." ;
      }
      : button {
        key = "gralla2" ;
        label = "Open Schedule..." ;
      }
    }
    : text {key = "" ;label = "Schedule of Bars in the Drawing" ;}
    : row {
      : button {
        key = "dibuplani" ;
        label = "Draw S. Steels<  " ;
      }
      : button {
        key = "dibuplani1" ;
        label = "Draw S. Cut< " ;
      }
    }
    : row {
    	: button {
        key = "presentar" ;
        label = "Parameters...     " ;
        }
    }
  }

  : boxed_column {
    label = "Marks";

    : row {
      : column {
        : row {
          : toggle {
            key = "elecM1";
            label = "Mark :";
          }
          : edit_box {
            key = "M1";
            label = "";
          }
        }
        : row {
          : toggle {
            key = "elecM2";
            label = "Mark :";
          }
          : edit_box {
            key = "M2";
            label = "";
          }
        }
        : row {
          : toggle {
            key = "elecM3";
            label = "Mark :";
          }
          : edit_box {
            key = "M3";
            label = "";
          }
        }
        : row {
          : toggle {
            key = "elecM4";
            label = "Mark :";
          }
          : edit_box {
            key = "M4";
            label = "";
          }
        }
        : row {
          : toggle {
            key = "elecM5";
            label = "Mark :";
          }
          : edit_box {
            key = "M5";
            label = "";
          }
        }
      }

      : column {
        : row {
          : toggle {
            key = "elecM6";
            label = "Mark :";
          }
          : edit_box {
            key = "M6";
            label = "";
          }
        }
        : row {
          : toggle {
            key = "elecM7";
            label = "Mark :";
          }
          : edit_box {
            key = "M7";
            label = "";
          }
        }
        : row {
          : toggle {
            key = "elecM8";
            label = "Mark :";
          }
          : edit_box {
            key = "M8";
            label = "";
          }
        }
        : row {
          : toggle {
            key = "elecM9";
            label = "Mark :";
          }
          : edit_box {
            key = "M9";
            label = "";
          }
        }
        : row {
          : toggle {
            key = "elecM10";
            label = "Mark :";
          }
          : edit_box {
            key = "M10";
            label = "";
          }
        }
      }

    }
  }
 : row { 
  : button {
        key = "undopla" ;
        label = "Zoom" ;
      }
      
  ok_cancel;
}
}

//----------------------------------------------------------------------
editar : dialog {
  label = "VISUALIZE BARS SCHEDULE";

  : column {
    : concatenation {
      : text_part {
        label = "Marks Numbers : ";
      }
      : text_part {
        label = "                 ";
        key = "numermar";
      }
    }
    : concatenation {
      : text_part {label = "Mark" ;width = 5;}
      : text_part {label = " No."  ;width = 6;}
      : text_part {label = "Type"  ;width = 5;}
      : text_part {label = "fi"    ;width = 5;}
      : text_part {label = " a"    ;width = 6;}
      : text_part {label = " b"    ;width = 6;}
      : text_part {label = " c"    ;width = 6;}
      : text_part {label = " d"    ;width = 6;}
      : text_part {label = " g"    ;width = 6;}
      : text_part {label = "Ldes"  ;width = 7;}
      : text_part {label = "Nv12"  ;width = 5;}
    }

    : list_box {
      tabs = "5 11 16 21 27 33 39 45 51 58 63";
      width = 65;
      height = 12;
      key = "editplani";
      fixed_width = true;
      multiple_select = true;
    }
  }

  ok_only;
}
//----------------------------------------------------------------------
forma : dialog {
  label = "F O R M    S C H E D U L E ";
  : boxed_column {
    label = "Colums";
    : row {
      : column {
        : text     {key = ""       ;label = " Mark";}
        : edit_box {key = "dxmarca";label = "";edit_width = 7;}
      }
      : column {                                                   
        : popup_list {key = "dxttipo";label = ""  ;list = " Type\n  fi\nNumber";edit_width = 6;}
        : edit_box   {key = "dxtipo" ;label = "";edit_width = 8;}
      }
      : column {
        : popup_list {key = "dxtfi";label = ""    ;list = " Type\n  fi\nNumber";edit_width = 6;}
        : edit_box   {key = "dxfi" ;label = "";edit_width = 8;}
      }
      : column {
        : popup_list {key = "dxtnumero";label = "";list = " Type\n  fi\nNumber";edit_width = 6;}
        : edit_box   {key = "dxnumero" ;label = "";edit_width = 8;}
      }
      : column {
        : text     {key = ""     ;label = " Dimen.";}
        : edit_box {key = "dxdim";label = "";edit_width = 7;}
      }
      : column {
        : text     {key = ""      ;label = "No.Var12";}
        : edit_box {key = "dxnv12";label = "";edit_width = 7;}
      }
      : column {
        : text     {key = ""     ;label = " Observ.";}
        : edit_box {key = "dxobs";label = "";edit_width = 7;}
      }
    }
    : row {
      : text {key = "" ;label = "Distance X total schedule :" ;}
      : text {key = "disxx" ;label = "10.30" ;}
      : text {key = "" ;label = "          " ;edit_width = 10;}
      : button {key = "defax"  ;label = "Default X";}
    }
  }
  : boxed_column {
    label = "Rows";
    : row {
      : column {
        : text     {key = ""     ;label = "     Text      ";}
        : text     {key = ""     ;label = "   Main Title  ";}
        : text     {key = ""     ;label = "Schedule Titles";}
        : text     {key = ""     ;label = "Schedule Data  ";}
      }
      : column {
        : text     {key = ""     ;label = "Height Row";}
        : edit_box {key = "altprin";label = "";edit_width = 11;}
        : edit_box {key = "altplan";label = "";edit_width = 11;}
        : edit_box {key = "altdato";label = "";edit_width = 11;}
      }
      : column {
        : text     {key = ""     ;label = " Style Text";}
        : popup_list {key = "stiprin";label = "";edit_width = 11;}
        : popup_list {key = "stiplan";label = "";edit_width = 11;}
        : popup_list {key = "stidato";label = "";edit_width = 11;}
      }
      : column {
        : text     {key = ""     ;label = "Height Text";}
        : edit_box {key = "alttprin";label = "";edit_width = 11;}
        : edit_box {key = "alttplan";label = "";edit_width = 11;}
        : edit_box {key = "alttdato";label = "";edit_width = 11;}
      }
    }
    : row {
      : edit_box {key = "numedema";label = "Rows Number to final ";edit_width = 8;}
      : text {key = "" ;label = "            " ;edit_width = 12;}
      : button {key = "defay"  ;label = "Default Y";}
    }   
  }
  ok_only;
}
//----------------------------------------------------------------------
presentar : dialog {
  label = "VISUALIZE BARS SCHEDULE";

  : boxed_column {
    label = "characteristic";
    : row {
      : button {
        key = "layerplat" ;
        label = "Texts Layer Schedule..." ;
      }
      : text {
        key = "tlayerplat";
        label = "                ";
        edit_width = 16;
      }
      : image_button {
        key = "imagenL3";
        height = 1;
        width = 3;
      }
    } 
    : row {
      : button {
        key = "layerplal" ;
        label = "Lines Layer Schedule..." ;
      }
      : text {
        key = "tlayerplal";
        label = "                ";
        edit_width = 16;
      }
      : image_button {
        key = "imagenL4";
        height = 1;
        width = 3;
      }
    } 
    : row {
      : button {key = "picpun" ;label = "X Schedule Distance" ;}
      : text {key = "disx" ;label = "10.30" ;}
      : button {key = "formapla" ;label = "Schedule Form..." ;}
    }
  }
  :boxed_column{
     label = "Technical Specifications";
    : column {
      : edit_box {key = "esptec1";label = "";edit_limit=50;}
      : edit_box {key = "esptec2";label = "";edit_limit=50;}
      : edit_box {key = "esptec3";label = "";edit_limit=50;}
      : edit_box {key = "esptec4";label = "";edit_limit=50;}
      : edit_box {key = "esptec5";label = "";edit_limit=50;}		
    }	

  }
  : boxed_row {
    label = "Dimension";
    : toggle {key = "pa";label = "a ";}
    : toggle {key = "pb";label = "b ";}
    : toggle {key = "pc";label = "c ";}
    : toggle {key = "pd";label = "d ";}
    : toggle {key = "pe";label = "e ";}
    : toggle {key = "pf";label = "f ";}
    : toggle {key = "pg";label = "g ";}
  }
  : row {
    : text {key = "" ;label = "               " ;edit_width = 15;}
    : button {
      key = "undopre" ;
      label = "Zoom" ;
    }
    ok_only;
    : text {key = "" ;label = "               " ;edit_width = 15;}
  }
}

//----------------------------------------------------------------------
calcular : dialog {
  label = "CALCULATE BARS SCHEDULE";

  :boxed_column {
    label = "Advance";
    
    : text {key = "tcalc1";label = "";}
    : row {
      : text {key = "";label = "0%";}
      : image {key = "icalc1";height = 1;width = 26;}
      : text {key = "";label = "100%";}
    }
    
    : text {key = "tcalc2";label = "";}
    : row {
      : text {key = "";label = "0%";}
      : image {key = "icalc2";height = 1;width = 26;}
      : text {key = "";label = "100%";}
    }
  }
  ok_only;
}

//----------------------------------------------------------------------
resultados : dialog {
  label = "VISUALIZE SCHEDULE RESULTS";

  : column {
    : row {
      : concatenation {
        : text_part {
          label = "W(Kg) Total : ";
        }
        : text_part {
          label = "                 ";
          key = "wtot";
        }
      }
      : toggle {
        key = "restt";
        label = "All";
      }
    }
    : concatenation {
      : text_part {label = "fi(mm)   " ;width = 10;}
      : text_part {label = "W/m(Kg/m)" ;width = 10;}
      : text_part {label = "L(m)     " ;width = 10;}
      : text_part {label = "W(Kg)    " ;width = 10;}
    }
    : list_box {
      tabs = "10 20 30 40";
      width = 41;
      height = 11;
      key = "editresul";
      fixed_width = true;
      multiple_select = true;
    }
  }
  ok_only;
}

//----------------------------------------------------------------------
acerca2 : dialog {
  label = "A B O U T ";
  
  : text {
    label ="Information :";
  }
  
  : row {  
    : button {
      key = "acer" ;
      label = " ProHierro2007®... " ;
    }
    : button {
      key = "servincad" ;
      label = "SINCOW... " ;
    }
  }
  spacer_1;
  ok_only;
}

//----------------------------------------------------------------------
servincad : dialog {
  label = "S I N C O W";
  
  : row {
    : image {
      key = "imageC";
      height = 5;
      width = 12;
    }
    : column {
      : text {
        key ="text11";
        label ="                              ";
      }
      : text {
        key ="text22";
        label ="                              ";
      }
      : text {
        key ="text33";
        label ="                              ";
      }
    }
  }

  spacer_1;
  
  : list_box {
    key = "editservincad";
    width = 40;
    height = 7;
  }

  spacer_1;
  ok_only;
}

//----------------------------------------------------------------------
acerca : dialog {
  label = "PROHIERRO  PROFESSIONAL";
  
  : text {
    key ="text1";
    label ="                              ";
  }
  : text {
    key ="text2";
    label ="                              ";
  }
  : text {
    key ="text3";
    label ="                              ";
  }
  
  : image {
    key = "imageB";
    height = 10;
    width = 28;
    fixed_width = true;
    fixed_height = true;
    alignment = centered;
  }

  spacer_1;
  
  : list_box {
    key = "editacerca";
    width = 40;
    height = 5;
  }

  spacer_1;
  ok_only;
}

//----------------------------------------------------------------------
ejemplo : dialog {
  label = "E X A M P L E";
      
  spacer_1;
  : row {
    : text {
      key ="eje1";
      label ="";
      width = 25 ;
      alignment = right;
    }
    : image {
      key = "eje11";
      height = 1;
      width = 3;
      fixed_width = true;
      fixed_height = true;
      alignment = top;
    }
    : text {
      key ="eje111";
      label ="";
      width = 10 ;
      alignment = left;
    }
  }
  spacer_1;
  : row {
    : text {
      key ="eje2";
      label ="";
      width = 10 ;
      alignment = right;
    }
    : image {
      key = "eje22";
      height = 1;
      width = 3;
      fixed_width = true;
      fixed_height = true;
      alignment = top;
    }
    : text {
      key ="eje222";
      label ="";
      width = 25 ;
      alignment = left;
    }
  }
  spacer_1;
  : row {
    : text {
      key ="eje3";
      label ="";
      width = 10 ;
      alignment = right;
    }
    : image {
      key = "eje33";
      height = 1;
      width = 3;
      fixed_width = true;
      fixed_height = true;
      alignment = top;
    }
    : text {
      key ="eje333";
      label ="";
      width = 25 ;
      alignment = left;
    }
  }
  spacer_1;
  ok_only;
  spacer_1;
}

//----------------------------------------------------------------------
ayudas : dialog {
  label = "O B T A I N   D A T A";
  
  : boxed_column {
    label = "Data" ;
    : row {  
      : button {
        key = "layerest" ;
        label = "Stirrups Layer" ;
      }
      : text {
        key = "tlayerest";
        label = "                ";
        edit_width = 16;
      }
      : image_button {
         key = "imagenL6";
         height = 1;
         width = 3;
      }
    }
    : row {  
      : button {
        key = "layerpos" ;
        label = "Marks Layer  " ;
      }
      : text {
        key = "tlayerpos";
        label = "                ";
        edit_width = 16;
      }
      : image_button {
         key = "imagenL7";
         height = 1;
         width = 3;
      }
    }
  }
  : boxed_row {
    label = "Contar" ;
    : button {
      key = "contarest" ;
      label = "Stirrups" ;
    }
    : button {
      key = "contarpos" ;
      label = "Slab Marks" ;
    }
  }  
  spacer_1;
  : toggle {
    key = "mensajes";
    label = "Visualize Menssages";
  }
  spacer_1;
  ok_cancel;
}

//----------------------------------------------------------------------
presentacion : dialog {
  label = "PROHIERRO  2007®";  
  : column {
	: row{
    		: image {
	 		key = "imageD";
      			height =10;
      			width = 28;     
    		}
        }
        : column {	
      		: button {
        		key = "hierros" ;
        		label = "Bars..." ;        		
      		}
      		: button {
        		key = "ah" ;
        		label = "Group Bars..." ;
      		}
      		: button {
        		key = "ag" ;
        		label = "Graphical Assistance..." ;
      		}  	    	
      		
      		: button {
        		key = "op" ;
        		label = "Schedule..." ;
      		}     
      
      		: button {
        		key = "edipla" ;
        		label = "Edit..." ;
      		}
      		: button {
        	key = "ad" ;
        	label = "About..." ;
        		
    	        }
        
      
      	
  
    
	ok_only;
       } 
   } 	
}

//----------------------------------------------------------------------
panzoon : dialog {
  label = "S C R E E N ";
  
  : row {
    : popup_list {
      key = "tipozp";
      label = "";
      list = " Zoom+\n Zoom-\n Src X\n Scr Y"; 
      edit_width = 7;
    }
    : text {
      key = "tzp" ;
      label = " 1.1x " ;
    }
    : button {
      key = "zp-" ;
      label = "<" ;
    }
    : button {
      key = "zp+" ;
      label = ">" ;
    }
  }  

  : image_button {
    key = "panzoon";
    height =11;
    width = 30;
  }
  
  ok_only;
}

//----------------------------------------------------------------------
falla : dialog {
  label = "ERROR IN FIX MARKS";
  
  : boxed_column {  
    label = "Alert";
    : text { label = "Same fix Marks cannot exist with different data." ;key = "" ;}
    : edit_box {key = "marcafalla";label = "";}
    : text { label = "The Schedule Calculate, It cannot continue." ;key = "" ;}
  }
  ok_only;
}
//----------------------------------------------------------------------
opcion : dialog {
  label = "F I N A L   O P T I O N";
  
  : boxed_column {  
    label = "Options";
    : radio_button {key = "opfi1" ;label = "Visualize the Calculate Marks" ;}
    spacer_1;
    : radio_button {key = "opfi2" ;label = "Don not Visualize" ;}
  }   
  : boxed_column {  
    : row {
      : text { key = "";label = "Note.- ";edit_width = 7;}
      : text { key = "";label = "If you choose the option (No to Visualize), the  ";edit_width = 44;}
    }
    : row {
      : text { key = "";label = "       ";edit_width = 7;}
      : text { key = "";label = "The marks won't be updated by those calculated.";edit_width = 44;}
    }
    : row {
      : text { key = "";label = "       ";edit_width = 7;}
      : text { key = "";label = "If you want later that to change the marks ";edit_width = 44;}
    }
    : row {
      : text { key = "";label = "       ";edit_width = 7;}
      : text { key = "";label = "by the new ones, you must make a GLOBAL    ";edit_width = 44;}
    }
    : row {
      : text { key = "";label = "       ";edit_width = 7;}
      : text { key = "";label = "EDITION, the option fix activated.";edit_width = 44;}
    }
  }
  ok_only;
}
//----------------------------------------------------------------------
editardato : dialog {
  label = "EDIT SCHEDULE DATA";
  
  : boxed_column {  
    label = "Options";
    : button {key = "edidat" ;label = "Edit Data"  ;}
    : row {
      : button {key = "edimov" ;label = "Move Data" ;}
      : button {key = "edicop" ;label = "Copy Data" ;}
    }
    : row {
      : button {key = "edibor" ;label = "Delete Data" ;}
      : button {key = "edicon" ;label = " Enumerate  " ;}
    }
    : button {key = "edical" ;label = "Recalculate Weigth" ;}
  }
  : row {
    : text { key = "";label = "   ";edit_width = 2;}    
    : button {
      key = "undoedi" ;
      label = "Zoom" ;
    } 
    : text { key = "";label = "   ";edit_width = 2;}    
    ok_only;
    : text { key = "";label = "   ";edit_width = 2;}
  }
}
//----------------------------------------------------------------------
ediedi : dialog {
  label = "      E D I T    D A T A ";
  : row {
    : text     { key = "tedi";label = "       ";edit_width = 7;}
    : edit_box { key = "bedi";label = "";edit_width = 33;}
  }
  ok_cancel;
}
