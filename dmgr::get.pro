;===========================================================+
; ++ NAME ++
FUNCTION dmgr::get, id_in, attribute, null=null
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
ON_ERROR, 1
;
id = id_in
IF ISA(id, 'INT') THEN id = (*(self.id))[id]
;
IF ~self.is_connected THEN MESSAGE,'No database is connected'
;
exists = self->record_exists(id, idx)
IF ~exists THEN BEGIN
    MESSAGE, 'No record: ' + id + ' was found', /CONTINUE
    RETURN, !NULL
ENDIF




exists = self->attr_exists(id, attribute)
IF ~exists THEN BEGIN 
    MESSAGE, 'No attribute ' + attribute + ' exists', /CONTINUE
    RETURN, !NULL
ENDIF

data = *((*(self.data))[idx])
RETURN, data[attribute]
END
