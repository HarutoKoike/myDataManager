 



if file_test('db1.sav') then file_delete, 'db1.sav'
dm = dmgr(dbname='db1')
dm->create, /skip
dm->connect
dm->add_record, 'id0'
dm->store, 'id0', 'data1', indgen(9)
dm->add_record, 'id1'
;dm->list
;
dm->close


end     
