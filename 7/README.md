```sql
CREATE TABLE `block` (
	`index`	INTEGER NOT NULL,
	`timestamp`	INTEGER NOT NULL,
	`data`	TEXT NOT NULL,
	`pre_hash`	TEXT NOT NULL,
	`hash`	TEXT NOT NULL,
	PRIMARY KEY(`index`)
);
```

创世区块

```
ruby g.rb "hello"
```

新增区块

```
ruby add.rb "hello"
```

获得所有区块
```
ruby get.rb all
```

获得最后区块
```
ruby get.rb last
```

获得创世区块
```
ruby get.rb g
```