 



if file_test('db1.sav') then file_delete, 'db1.sav'
dm = dmgr(dbname='db1')
dm->create
dm->add_record, 'id0'
dm->store, 'id0', 'data1', indgen(9)
dm->add_record, 'id1'
dm->store, 'id1', 'data2', 'aaa'
dm->store, 'id0', 'data3', 'aaa'
dm->store, 'id0', 'data4', 321  
dm->store, 'id0', 'data4', 300, /over
;
dm->close

dm->connect
dm->remove_attr, 'id0', 'data4'
print, dm->get('id0', 'data4')

end     
