@dmgr::create.pro
@dmgr::connect.pro
@dmgr::record_exists.pro
@dmgr::add_record.pro
@dmgr::attr_exists.pro
@dmgr::store.pro
@dmgr::get.pro
@dmgr::remove_attr.pro
@dmgr::remove_record.pro
@dmgr::list.pro
@dmgr::close.pro
@dmgr::export2md.pro


FUNCTION  dmgr::init, quiet=quiet, _EXTRA=ex
COMPILE_OPT IDL2
ON_ERROR, 1
self->setproperty, _EXTRA=ex
;
;*---------- initiate  ----------*
;
self.id   = PTR_NEW(/ALLOCATE)
self.data = PTR_NEW(/ALLOCATE)
;
self.is_connected = 0
;
IF ~KEYWORD_SET(quiet) THEN $
    MESSAGE, 'A data manager object has been created', /CONTINUE
;
RETURN, 1
END



;-------------------------------------------------+
; 
;-------------------------------------------------+
PRO dmgr::SetProperty, dbfile=dbfile, $
                       description=description, is_connected=is_connected
COMPILE_OPT IDL2
;
IF KEYWORD_SET(dbfile)       THEN self.dbfile = dbfile
IF KEYWORD_SET(description)  THEN self.description = description
IF KEYWORD_SET(is_connected) THEN self.is_connected = is_connected
END



;-------------------------------------------------+
; 
;-------------------------------------------------+
PRO dmgr::GetProperty, dbfile=dbfile, $
                       description=description, is_connected=is_connected , $
                       id=id, data=data
COMPILE_OPT IDL2
;
IF ARG_PRESENT(dbfile)       THEN dbfile = self.dbfile
IF ARG_PRESENT(description)  THEN description = self.description
IF ARG_PRESENT(is_connected) THEN is_connected = self.is_connected 
IF ARG_PRESENT(id)           THEN id = self.id 
IF ARG_PRESENT(data)         THEN data = self.data 
END




;-------------------------------------------------+
; 
;-------------------------------------------------+
PRO dmgr::check_connected, _EXTRA=ex
COMPILE_OPT IDL2
ON_ERROR, 1
IF ~self.is_connected THEN $
    MESSAGE, 'No database is connected', _EXTRA=ex
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
        dbfile: '',          $
        description: '',     $
        is_connected: 0,     $
        id:PTR_NEW() ,       $
        data:PTR_NEW(),      $
        INHERITS IDL_OBJECT  $
       }

END
