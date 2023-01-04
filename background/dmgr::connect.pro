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
ON_ERROR, 1
;
IF STRLEN(self.dbname) EQ 0 THEN $
    MESSAGE, 'dbname property is needed.'
;
IF STRLEN(self.dbfile) EQ 0 THEN $
    self.dbfile = FILEPATH(self.dbname + '.sav', ROOT=self.dbpath)

;
;*----------   ----------*
;
IF ~FILE_TEST(self.dbfile) THEN $
    MESSAGE, 'No file was fount ' + self.dbfile 
;
RESTORE, self.dbfile, description=desc
txt = 'This is a database created by "dmgr" object' 
IF STRMATCH(desc, txt) THEN self.is_connected = 1
;
IF ISA(id)   THEN *(self.id)     = id
IF ISA(data) THEN *(self.data)   = data
END
