;===========================================================+
; ++ NAME ++
PRO dmgr::export2md, attr, filename=filename
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
self->check_connected
;
id = *(self.id)
;


;
;*---------- open file  ----------*
;
IF ~KEYWORD_SET(filename) THEN $
    filename = self.dbname + '_exported.md'
OPENW, lun, filename, /GET_LUN
;


nh = N_ELEMENTS(attr)
;
;*---------- write  ----------*
;
; header
attr0 = ['', attr, '']
attr0 = STRJOIN(attr0, '|')
PRINTF, lun, attr0
;
; separator
sep = STRARR(nh + 1) + '|'
sep = STRJOIN(sep, '---')
PRINTF, lun, sep
;
; data
FOR i = 0, N_ELEMENTS(id) - 1 DO BEGIN
    str = ''
    FOR j = 0, nh - 1 DO BEGIN
        IF ~self->attr_exists(id[i], attr[j]) THEN CONTINUE
        ;
        data = STRING( self->get(id[i], attr[j]) )
        str  = [str, data]
    ENDFOR
    ;
    str = [str, '']
    str = STRJOIN(str, '|')
    PRINTF, lun, str
ENDFOR



FREE_LUN, Lun


END


db = dmgr()
;db.dbname = 'test'
;db->create
db.dbfile = !project + '/data/LR_events.sav'
db->connect
;
;db->add_record, 'id0'
;db->store, 'id0', 'attr0', '2000'
;db->add_record, 'id1'
;db->store, 'id1', 'attr0', '3000'
;;
;db->store, 'id0', 'attr1', '2400'
;db->store, 'id1', 'attr1', '3300'
attr = ['trange_event', 't_sheath', 't_sphere', 't_mva', 't_outflow']
db->export2md, attr, filename='~/test.md'

end
