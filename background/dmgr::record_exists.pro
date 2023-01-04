;==========================================================+
; ++ NAME ++
FUNCTION dmgr::record_exists, id, idx
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
;==========================================================+
COMPILE_OPT IDL2
;
self->check_connected
;
IF N_ELEMENTS(id) NE 1 THEN BEGIN
    MESSAGE, 'id must be 1-element', /CONTINUE
    RETURN, 0
ENDIF
;
IF ~SIZE(id, /TYPE) EQ 7 THEN BEGIN
    MESSAGE, 'id must be string', /COUTINUE
    RETURN, 0
ENDIF
;
;
IF ~ISA(*(self.id)) THEN RETURN, 0 

idx = WHERE(STRMATCH(*(self.id), id, /FOLD_CASE), $
            count, /NULL)
IF ISA(idx) THEN idx = idx[0]
;
RETURN, count EQ 1
END
