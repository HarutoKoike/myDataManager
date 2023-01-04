;==========================================================+
; ++ NAME ++
PRO dmgr::connect, new=new
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
self.dbfile = FILEPATH(self.dbname + '.sav', ROOT=self.dbpath)
;
;
;*----------   ----------*
;
IF KEYWORD_SET(new) THEN BEGIN
    self.is_connected = 1
    RETURN
ENDIF

;
;*----------   ----------*
;
IF ~FILE_TEST(self.dbfile) THEN $
    MESSAGE, 'No file was fount ' + self.dbfile 
;
RESTORE, self.dbfile, description=desc
txt = 'This is a database created by "dmgr" object' 
IF STRMATCH(desc, txt) THEN $
    self.is_connected = 1
;
IF ISA(id) THEN *(self.id)   = id
IF ISA(data) THEN *(self.data) = data
END
