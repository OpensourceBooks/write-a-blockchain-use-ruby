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

```
ruby blockchain.rb
```

```
{:index=>2,
 :timestamp=>1541586804,
 :data=>"jerry",
 :pre_hash=>"ed9dff84049e5e30a034a237635c6738c2edfd318ea56466f32586fe5bda7929",
 :hash=>"e26996ae059a44db8ab32dc6281b2e19235b26cd1d4f2826fc6a42bc5e1d2e24"}
[{:index=>0,
  :timestamp=>1541586804,
  :data=>"hi",
  :pre_hash=>"0",
  :hash=>"f16ba39039f2503a7c0c092073c04951da8359f743a37e21c6201cf1ca6e46c2"},
 {:index=>1,
  :timestamp=>1541586804,
  :data=>"tom",
  :pre_hash=>
   "f16ba39039f2503a7c0c092073c04951da8359f743a37e21c6201cf1ca6e46c2",
  :hash=>"ed9dff84049e5e30a034a237635c6738c2edfd318ea56466f32586fe5bda7929"},
 {:index=>2,
  :timestamp=>1541586804,
  :data=>"jerry",
  :pre_hash=>
   "ed9dff84049e5e30a034a237635c6738c2edfd318ea56466f32586fe5bda7929",
  :hash=>"e26996ae059a44db8ab32dc6281b2e19235b26cd1d4f2826fc6a42bc5e1d2e24"}]
false

```

```
true
```