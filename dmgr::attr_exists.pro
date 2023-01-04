;===========================================================+
; ++ NAME ++
FUNCTION dmgr::attr_exists, id, attribute
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
IF N_ELEMENTS(id) NE 1 THEN MESSAGE, 'id must be 1-element'
IF ~SIZE(id, /TYPE) EQ 7 THEN MESSAGE, 'id must be string'
;
exists = self->record_exists(id, idx)
IF ~exists THEN MESSAGE, 'No record: ' + id + ' was found'

rec = (*((*(self.data))[idx]))
RETURN, rec.HasKey(attribute)
END
