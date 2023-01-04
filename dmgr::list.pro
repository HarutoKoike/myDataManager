;===========================================================+
; ++ NAME ++
PRO dmgr::list
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
;  H.Koike 1/9,2021
;===========================================================+
COMPILE_OPT IDL2 
;
self->check_connected
;
ids = *(self.id)

FOR i = 0, N_ELEMENTS(ids) - 1 DO BEGIN
    PRINT, ''
    PRINT, ''
    PRINT, ''
    PRINT, '+----------------------------------+'
    PRINT, '  id : ' + ids[i]
    PRINT, '+----------------------------------+'
    PRINT, ''
    ;
    h    = *((*(self.data))[i])
    keys = h.Keys()
    FOR j = 0, N_ELEMENTS(keys) - 1 DO BEGIN
        PRINT, keys[j], ' : ',  h[ keys[j] ]
    ENDFOR
ENDFOR

END
