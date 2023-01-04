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
self.check_connected
;
IF N_ELEMENTS(id) NE 1 THEN MESSAGE, 'id must be 1-element'
IF ~SIZE(id, /TYPE) EQ 7 THEN MESSAGE, 'id must be string'
;
;
IF ~ISA(*(self.id)) THEN RETURN, 0 

idx = WHERE(STRMATCH(*(self.id), id, /FOLD_CASE), $
            count, /NULL)
IF ISA(idx) THEN idx = idx[0]
;
RETURN, count EQ 1
END
