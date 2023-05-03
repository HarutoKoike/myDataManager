## データベースの作成
```
db = dmgr()              　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　# データベースオブジェクトの作成
db.dbfile = '~/hoge/hoge/mydatabase.sav'    # データ保存用ファイルの名前を指定
db->create                                  # データベースの作成
```

## データの保存
```
db->add_record, 'id001'                   # レコードの作成
db->store, 'id001', 'attr01', [1, 2, 4]   # 'id0001'というレコードに'attr01'という属性のデータを保存
```

## データベースを閉じる
```
db->close   # これにより、データベースが保存されるので、必ず終了時には行う。
```

## データを復元する
```
db = dmgr()
db.dbfile = '~/hoge/hoge/mydatabase.sav'
db->connect                 # 既存のデータベースに接続する
data = db->get('id001', 'attr01')
```
