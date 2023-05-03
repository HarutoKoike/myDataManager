;===========================================================+
; ++ NAME ++
FUNCTION dmgr::get_all, attribute
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
;
IF ~ISA(attribute, 'string') OR n_elements(attribute) ne 1 THEN $
    message, 'Attribute must be one element string.'
;
IF ~self.is_connected THEN MESSAGE,'No database is connected'
;
;
idarr = *(self.id)
IF N_ELEMENTS(idarr) eq 0 then $
    message, 'No data is stored yet'


;
;*---------- retrieve data ----------*
;
data = []
FOR i = 0, N_ELEMENTS(idarr) - 1 DO BEGIN
    IF self->attr_exists(idarr[i], attribute) THEN $
        data = [data, PTR_NEW(self->get(idarr[i], attribute)]
ENDFOR

IF N_ELEMENTS(data) EQ 0 THEN BEGIN 
    MESSAGE, 'No data with attribute "' + attribute + '" found', /CONTINUE
    RETURN, 0
END

RETURN, arr
END
