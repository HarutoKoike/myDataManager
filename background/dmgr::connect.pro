;==========================================================+
; ++ NAME ++
PRO dmgr::connect, quiet=quiet
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
ON_ERROR, 1

IF ~FILE_TEST(self.dbfile) THEN $
    MESSAGE, 'No file was found: ' + self.dbfile 
;
;
;*----------   ----------*
;
RESTORE, self.dbfile, description=desc
txt = 'This is a database created by "dmgr" object' 
IF STRMATCH(desc, txt) THEN self.is_connected = 1
IF ~STRMATCH(desc, txt) THEN $
    MESSAGE, 'This is not a database created by "dmgr" object'
;
IF ISA(id)   THEN *(self.id)     = id
IF ISA(data) THEN *(self.data)   = data


IF ~KEYWORD_SET(quiet) THEN $
    PRINT, '% Connection to "' + self.dbfile  + '" is established'


END
