## 1. Create and connect to a database 
At first, create a dmgr object and specify name for database.
```
dm = dmgr()
dm.dbname = 'mydb'
```
1. Creating a new database
```
dm->create
```
2. Connect to a existing database
```
dm->connect
```


```
├── README.md
├── background
│   ├── dmgr::close.pro
│   ├── dmgr::connect.pro
│   ├── dmgr::create.pro
│   ├── dmgr::record_exists.pro
│   └── dmgr__define.pro
├── db1.sav
├── dmgr::add_record.pro
├── dmgr::attr_exists.pro
├── dmgr::get.pro
├── dmgr::remove_attr.pro
├── dmgr::remove_record.pro
├── dmgr::store.pro
└── dmgr_test.pro
```
