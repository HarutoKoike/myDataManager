;===========================================================+
; ++ NAME ++
PRO dmgr::create
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
IF STRLEN(self.dbname) EQ 0 THEN $
    MESSAGE, '"dbname" property must be set'
;
IF STRLEN(self.dbpath) EQ 0 THEN CD, current=dbpath 
self.dbpath = dbpath

;
self.dbfile = FILEPATH(self.dbname + '.sav', ROOT=self.dbpath)

description = 'This is a database created by "dmgr" object'
SAVE, self, description=description, FILENAME=self.dbfile
;
self.is_connected = 1
END
