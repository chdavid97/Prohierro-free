//-------------------------------------------------------------------
setlayer : dialog {
    subassembly = 0;
    label = /*MSG14*/"Select Layer";
    initial_focus = "listbox";
    : concatenation {
        children_fixed_width = true;
        key = "clayer";
        : text_part {
            label = /*MSG15*/"Current Layer: ";
        }
        : text_part {
            key = "cur_layer";
            width = 35;
        }
    }
    : row {
        fixed_width = true;
        key = "titles";
        children_fixed_width = true;
        : text {
            label = /*MSG16*/"Layer Name";
            width = 34;
        }
        : text {
            label = /*MSG17*/"State";
            width = 9;
        }
        : text {
            label = /*MSG18*/"Color";
            width = 8;
        }
        : text {
            label = /*MSG19*/"Linetype";
            width = 12;
        }
    }
    : list_box {
        tabs = "32 35 37 39 41 44 53";
        width = 67;
        height = 12;
        key = "list_lay";
        allow_accept = true;
    }
    : row {
        key = "controls";
        : column {
            key = "lname";
            fixed_width = true;
            : edit_box {
                label = /*MSG20*/"Set Layer Name:";
                mnemonic = /*MSG21*/"S";
                key = "edit_lay";
                width = 32;
                edit_width = 32;
                edit_limit = 31;
                allow_accept = true;
            }
        }
    }
    ok_cancel_err;
}

