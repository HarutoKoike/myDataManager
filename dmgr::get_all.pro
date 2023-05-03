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
;*---------- check data type ----------*
;
idx   = []
count = 0
FOR i = 0, N_ELEMENTS(idarr) - 1 DO BEGIN
    IF self->attr_exists(idarr[i], attribute) THEN BEGIN
        count ++
        type = SIZE(self->get(idarr[i], attribute), /TYPE)
        IF ~ISA(type0) THEN type0 = type
        IF type NE type0 THEN $
            MESSAGE, 'invalid type'
        idx = [idx, i]
    ENDIF
ENDFOR

IF count EQ 0 THEN BEGIN 
    MESSAGE, 'No data with attribute "' + attribute + '" found', /CONTINUE
    RETURN, 0
END
;


;
;*---------- retrieve data  ----------*
;
arr = MAKE_ARRAY(count, TYPE=type0)
FOREACH i, idx DO $
    arr[i] = self->get(idarr[i], attribute)


RETURN, arr
END
