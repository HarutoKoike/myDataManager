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
IF ~self.is_connected THEN MESSAGE, 'No datebase is connected'
;
IF SIZE(id, /TYPE) NE 7 THEN $
    MESSAGE, 'id must be string'
;
IF ~PTR_VALID(self.id) THEN BEGIN
    self.id   = PTR_NEW([id])
    self.data = PTR_NEW(/ALLOCATE)
    help, *(self.data)
    RETURN
ENDIF

;
dum       = WHERE(STRMATCH(*self.id, id, /FOLD_CASE) EQ 1, count)
IF count NE 0 THEN MESSAGE, 'id :' + id + ' already exists'
*(self.id)   = [*(self.id), id]
*(self.data) = [self.data, PTR_NEW(/ALLOCATE)]

END
