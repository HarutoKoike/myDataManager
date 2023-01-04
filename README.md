This object is intended to handle a database with two elements: records with unique IDs and attributes for each record. <br>
All data is stored as "attribute 'attr1' in record 'ID01'". Data type (array, object, pointer...) is not restricted.

## Create and connect to a database 
At first, create a dmgr object and specify name for database.
```
dm = dmgr()
dm.dbname = 'mydb'
```
Creating a new database
```
dm->connect, /new
```
Connecting to a existing database
```
dm->connect
```

## Store data
Record must be created when storing data in a new record. ID must be string.
```
dm->add_record, 'id01'
```
After inserting a new record, store data with ID and attribute.
```
data = indgen(8)
dm->store, 'id01', 'attr1', data
```
If you overwrite existing data, store with overwrite keyword.
```
dm->store, 'id01', 'attr1', data, /overwrite
```


## Retrieve stored data
```
data = dm->get('id01', 'attr1')
```


## Remove record and attribute
Remove a record
```
dm->remove_record, 'id01'
```
Remove a attribute in a record
```
dm->remove_attr, 'id01', 'attr1'
```


## Save database
dmgr::close method closes a connection and saves database. By default, database will be saved in 'mydb.sav' in the 
current directory. You can specify save directory and file name by dmgr.dbfile property.
```
dm.dbfile = '~/idl/database/mydb.sav'
dm->close
```

## File tree
```
├── README.md
├── background
│   ├── dmgr::close.pro
│   ├── dmgr::create.pro
│   ├── dmgr::record_exists.pro
│   └── dmgr__define.pro
├── dmgr::add_record.pro
├── dmgr::attr_exists.pro
├── dmgr::get.pro
├── dmgr::remove_attr.pro
├── dmgr::remove_record.pro
├── dmgr::store.pro
└── dmgr_test.pro
```
