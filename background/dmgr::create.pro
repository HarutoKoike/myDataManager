;===========================================================+
; ++ NAME ++
PRO dmgr::create, renew=renew
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
;  H.Koike 2022/10
;===========================================================+
;
COMPILE_OPT IDL2
ON_ERROR, 1
; 
IF STRLEN(self.dbfile) EQ 0 THEN $
    MESSAGE, 'File name for database is specified to "dbfile" property.'

;
IF FILE_TEST(self.dbfile) THEN BEGIN
    IF ~KEYWORD_SET(renew) THEN BEGIN
        MESSAGE, 'database ' + '"' + self.dbfile + '" already exists.', $
                 /CONTINUE
        RETURN
    ENDIF
ENDIF


id   = *(self.id)
data = *(self.data)
;                           
desc = 'This is a database created by "dmgr" object'  
SAVE, id, data, FILENAME=self.dbfile, DESCRIPTION=desc
;
self.is_connected = 1
END
