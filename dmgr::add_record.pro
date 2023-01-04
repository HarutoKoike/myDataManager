;===========================================================+
; ++ NAME ++
PRO dmgr::add_record, id
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
IF SIZE(id, /TYPE) NE 7 THEN $
    MESSAGE, 'id must be string'

;
exists = self->record_exists(id)
IF exists THEN MESSAGE, 'id :' + id + ' already exists'
;
*(self.id)   = [*(self.id), id]
*(self.data) = [*(self.data), PTR_NEW(/ALLOCATE)]

END
