;===========================================================+
; ++ NAME ++
FUNCTION dmgr::get, id, attribute
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
IF ~self.is_connected THEN MESSAGE,'No database is connected'
;
exists = self->record_exists(id, idx)
IF ~exists THEN MESSAGE, 'No record: ' + id + ' was found'
exists = self->attr_exists(id, attribute)
IF ~exists THEN MESSAGE, 'No attribute ' + id + ' exists'

data = *((*(self.data))[idx])
RETURN, data[attribute]
END
