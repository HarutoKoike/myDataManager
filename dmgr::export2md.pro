;===========================================================+
; ++ NAME ++
PRO dmgr::export2md, attr, all=all, filename=filename
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
id = *(self.id)
;


;
;*---------- open file  ----------*
;
IF ~KEYWORD_SET(filename) THEN $
    filename = self.dbname + '_exported.md'
OPENW, lun, filename, /GET_LUN
;


nh = N_ELEMENTS(attr)
;
;*---------- write  ----------*
;
; header
;IF KEYWORD_SET(all) THEN $
;    attr = 

attr0 = ['', 'No.', attr, '']
attr0 = STRJOIN(attr0, '|')
PRINTF, lun, attr0
;
; separator
sep = STRARR(nh + 2) + '|'
sep = STRJOIN(sep, '---')
PRINTF, lun, sep
;
; data
format = CEIL( ALOG10(N_ELEMENTS(id)) )
format = STRCOMPRESS( '(I0' + STRING(format) + ')', /REMOVE)
;
FOR i = 0, N_ELEMENTS(id) - 1 DO BEGIN
    str = STRING(i, FORMAT=format)
    ;
    FOR j = 0, nh - 1 DO BEGIN
        IF ~self->attr_exists(id[i], attr[j]) THEN CONTINUE
        ;
        data = STRING( self->get(id[i], attr[j]) )
        IF N_ELEMENTS(data) GE 2 THEN $
            data = STRJOIN(data, '<br>')
        str  = [str, data]
    ENDFOR
    ;
    str = [str, '']
    str = STRJOIN(str, '|')
    PRINTF, lun, str
ENDFOR



FREE_LUN, Lun


END
