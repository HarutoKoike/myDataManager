;===========================================================+
; ++ NAME ++
PRO dmgr::list, rec_num=rec_num, index=index, attributes=attributes
;
; ++ PURPOSE ++
;  -->
;
; ++ POSITIONAL ARGUMENTS ++
;  -->
;
; ++ KEYWORDS ++
; -->  rec_num : receives number of records
; -->  index   : 
; -->  attributes : 
;
; ++ CALLING SEQUENCE ++
;  -->
;
; ++ HISTORY ++
;===========================================================+
COMPILE_OPT IDL2 
;
self->check_connected
;
ids = *(self.id)
IF ~KEYWORD_SET(index) THEN index = LINDGEN(N_ELEMENTS(ids))
;
IF KEYWORD_SET(rec_num) OR ARG_PRESENT(rec_num) THEN BEGIN
    rec_num = N_ELEMENTS(ids)
    PRINT, '% database: "' + self.dbname + '"'
    PRINT, '%  Total ' + STRCOMPRESS(STRING(N_ELEMENTS(ids)), /REMOVE) + ' records'
    RETURN
ENDIF

FOREACH i, index DO BEGIN
    print, i
    PRINT, ''
    PRINT, ''
    PRINT, ''
    PRINT, '+----------------------------------------------------------------------+'
    PRINT, ';  id :          ' + STRING(ids[i])
    PRINT, '+----------------------------------------------------------------------+'
    PRINT, ''
    ;
    IF ~ISA( *((*(self.data))[i]) ) THEN RETURN
    ;
    h    = *((*(self.data))[i])
    dum  = h.Keys()
    keys = []
    FOREACH k, dum DO BEGIN
        keys = [keys, STRING(k)]
    ENDFOREACH
    ;
    IF KEYWORD_SET(attributes) THEN BEGIN
        idx = []
        FOR j = 0, N_ELEMENTS(attributes) - 1 DO BEGIN
            idx = [idx, WHERE(STRMATCH(keys, attributes[j]), /NULL)] 
        ENDFOR
        keys = keys[idx]
    ENDIF
    ;

    FOR j = 0, N_ELEMENTS(keys) - 1 DO BEGIN
        PRINT, keys[j], ' : ',  h[ keys[j] ]
    ENDFOR
ENDFOREACH

END
