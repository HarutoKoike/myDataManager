;===========================================================+
; ++ NAME ++
PRO dmgr::remove_record, id
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
self.check_connected
;
exists = self.record_exists(id, idx)
IF ~exists THEN MESSAGE, 'No record was found.'
;



PTR_FREE, (*(self.data))[idx]
;
IF N_ELEMENTS(*(self.id)) EQ 1 THEN BEGIN
    self.id   = PTR_NEW(/ALLOCATE)
    self.data = PTR_NEW(/ALLOCATE)
ENDIF
;
IF N_ELEMENTS(*(self.id)) GE 2 THEN BEGIN
    idx0 = INDGEN(N_ELEMENTS( *(self.id) ) )
    idx1 = WHERE( idx0 NE idx )
    ;
    *(self.id)   = (*(self.id))[idx1]
    *(self.data) = (*(self.data))[idx1]
ENDIF


END
