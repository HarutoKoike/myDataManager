;===========================================================+
; ++ NAME ++
PRO dmgr::store, id, attribute, data, overwrite=overwrite 
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
exists = self->record_exists(id, idx)
;
IF ~exists THEN MESSAGE, 'No record: ' + id + ' was found'



IF N_ELEMENTS(attribute) NE 1 THEN $
    MESSAGE, 'attribute must be 1 element'

;
;*---------- not exists  ----------*
;   
IF ~ISA(*((*(self.data))[idx]) ) THEN BEGIN
    hash = HASH(attribute, d)
    (*(self.data))[idx] = PTR_NEW(hash)
    RETURN
ENDIF


;
;*---------- exists  ----------*
;
rec = (*((*(self.data))[idx]))
IF ~rec.HasKey(attribute) OR KEYWORD_SET(overwrite) THEN BEGIN
    (*((*(self.data))[idx]))[attribute] = data
ENDIF ELSE BEGIN
    MESSAGE, 'record: ' + id + ',  attribute: ' + attribute + $
             ' already exists.'
ENDELSE

END
