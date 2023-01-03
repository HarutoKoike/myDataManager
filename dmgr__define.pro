@dmgr::create.pro
@dmgr::connect.pro
@dmgr::add_record.pro


FUNCTION  dmgr::init, _EXTRA=ex
COMPILE_OPT IDL2
self->setproperty, _EXTRA=ex
MESSAGE, 'A data manager object has been created', /CONTINUE
RETURN, 1
END



;-------------------------------------------------+
; 
;-------------------------------------------------+
PRO dmgr::SetProperty, dbname=dbname, dbpath=dbpath, dbfile=dbfile, $
                       description=description, is_connected=is_connected
COMPILE_OPT IDL2
;
IF KEYWORD_SET(dbname) THEN self.dbname = dbname
IF KEYWORD_SET(dbpath) THEN self.dbpath = dbpath
IF KEYWORD_SET(description) THEN self.description = description
IF KEYWORD_SET(is_connected) THEN self.is_connected = is_connected
END



;-------------------------------------------------+
; 
;-------------------------------------------------+
PRO dmgr::GetProperty, dbname=dbname, dbpath=dbpath, dbfile=dbfile, $
                       description=description, is_connected=is_connected , $
                       id=id, data=data
COMPILE_OPT IDL2
;
IF ARG_PRESENT(dbname) THEN dbname = self.dbname
IF ARG_PRESENT(dbpath) THEN dbpath = self.dbpath
IF ARG_PRESENT(description) THEN description = self.description
IF ARG_PRESENT(is_connected) THEN is_connected = self.is_connected 
IF ARG_PRESENT(id) THEN id = self.id 
IF ARG_PRESENT(data) THEN data = self.data 
END



;===========================================================+
; ++ NAME ++
PRO dmgr__define
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

void = {                     $
        dmgr,                $
        dbname: '',          $
        dbpath: '',          $
        dbfile: '',          $
        description: '',     $
        is_connected: 0,     $
        id:PTR_NEW() ,       $
        data:PTR_NEW(),      $
        INHERITS IDL_OBJECT  $
       }

END
