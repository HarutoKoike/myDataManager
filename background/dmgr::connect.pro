;==========================================================+
; ++ NAME ++
PRO dmgr::connect
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
;==========================================================+
COMPILE_OPT IDL2
;
IF STRLEN(self.dbfile) EQ 0 THEN $
    MESSAGE, '"dbfile" property must be set.'
;
IF ~FILE_TEST(self.dbfile) THEN $
    MESSAGE, 'No file was fount ' + self.dbfile 
;
RESTORE, self.dbfile, description=desc
;
txt = 'This is a database created by "dmgr" object' 
IF STRMATCH(desc, txt) THEN $
    self.is_connected = 1
;
*(self.id)   = id
*(self.data) = data
END
