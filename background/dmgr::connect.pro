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
;
IF STRLEN(self.dbname) EQ 0 AND STRLEN(self.dbfile) EQ 0 THEN $
    MESSAGE, 'dbname or dbfile property is needed.'
;
IF STRLEN(self.dbfile) EQ 0 THEN $
    self.dbfile = FILEPATH(self.dbname + '.sav', ROOT=self.dbpath)

;
;*----------   ----------*
;
IF ~FILE_TEST(self.dbfile) THEN $
    MESSAGE, 'No file was found: ' + self.dbfile 
;
RESTORE, self.dbfile, description=desc
txt = 'This is a database created by "dmgr" object' 
IF STRMATCH(desc, txt) THEN self.is_connected = 1
;
IF ISA(id)   THEN *(self.id)     = id
IF ISA(data) THEN *(self.data)   = data


IF ~KEYWORD_SET(quiet) THEN $
    PRINT, '% connection to "' + self.dbname  + '"is established'
END
