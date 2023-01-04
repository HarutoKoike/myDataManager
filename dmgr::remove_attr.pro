;===========================================================+
; ++ NAME ++
PRO dmgr::remove_attr, id, attribute
;
; ++ PURPOSE ++
;  -->
;
; ++ POSITIONAL ARGUMENTS ++
;  -->
;
; ++ KEYWORDS ++
; -->
;
; ++ CALLING SEQUENCE ++
;  -->
;
; ++ HISTORY ++
;  H.Koike 
;===========================================================+
COMPILE_OPT IDL2
;
self->check_connected
;
dum    = self->record_exists(id, idx) 
exists = self->attr_exists(id, attribute)
IF TOTAL(exists) EQ 0 THEN BEGIN
    MESSAGE, 'No attribute was found', /CONTINUE
    RETURN
END

(*((*(self.data))[idx])).Remove, attribute
END 
