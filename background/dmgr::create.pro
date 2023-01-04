;===========================================================+
; ++ NAME ++
PRO dmgr::create, renew=renew, skip_existing=skip_existing
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
;  H.Koike 1/9,2021
;===========================================================+
COMPILE_OPT IDL2
ON_ERROR, 1
; 
IF STRLEN(self.dbname) EQ 0 THEN $
    MESSAGE, 'dbname property is needed.' 
;
IF STRLEN(self.dbfile) EQ 0 THEN $
    self.dbfile = FILEPATH(self.dbname + '.sav', ROOT=self.dbpath)
;
IF FILE_TEST(self.dbfile) AND ~KEYWORD_SET(renew) THEN BEGIN
    MESSAGE, 'database ' + '"' + self.dbfile + '" already exists.', $
             CONTINUE=skip_existing
    RETURN
ENDIF


id   = *(self.id)
data = *(self.data)
;                           
desc = 'This is a database created by "dmgr" object'  
SAVE, id, data, FILENAME=self.dbfile, DESCRIPTION=desc
END
