;===========================================================+
; ++ NAME ++
PRO dmgr::list, rec_num=rec_num
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
;
IF KEYWORD_SET(rec_num) OR ARG_PRESENT(rec_num) THEN BEGIN
    rec_num = N_ELEMENTS(ids)
    PRINT, '% database: "' + self.dbname + '"'
    PRINT, '%  Total ' + STRCOMPRESS(STRING(N_ELEMENTS(ids)), /REMOVE) + ' records'
    RETURN
ENDIF

FOR i = 0, N_ELEMENTS(ids) - 1 DO BEGIN
    PRINT, ''
    PRINT, ''
    PRINT, ''
    PRINT, '+----------------------------------+'
    PRINT, '  id : ' + ids[i]
    PRINT, '+----------------------------------+'
    PRINT, ''
    ;
    IF ~ISA( *((*(self.data))[0]) ) THEN RETURN
    ;
    h    = *((*(self.data))[i])
    keys = h.Keys()
    FOR j = 0, N_ELEMENTS(keys) - 1 DO BEGIN
        PRINT, keys[j], ' : ',  h[ keys[j] ]
    ENDFOR
ENDFOR

END
