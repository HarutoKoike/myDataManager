;===========================================================+
; ++ NAME ++
PRO dmgr::close
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
id   = *(self.id)
data = *(self.data)
;
description = 'This is a database created by "dmgr" object'
SAVE, id, data, description=description, $
      FILENAME=self.dbfile
;
self.is_connected = 0
END
