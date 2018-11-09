### 使用RPC

因为 XMLRPC::Server.new(1212) 这句里面貌似也有一个hash方法，因此把我们之前的hash简写为h。conn 也简写为c。另外区块链高度改为 i 代表 index。

运行RPC服务端

```
ruby s.rb
```

运行RPC 客户端

```
ruby c.rb
```

返回

```
"build ok"
{"index"=>0,
 "timestamp"=>1541746424,
 "data"=>"hi~",
 "pre_hash"=>0,
 "hash"=>"1aa0b428d545796616c335607c8229158aaf9f94a09e6bd217c714661cf27cfc"}
{"index"=>3,
 "timestamp"=>1541746424,
 "data"=>"cr4fun",
 "pre_hash"=>
  "6114eec03fb78abad97937e5a99e976a0d81408e4f5b3ca44b18b18d69ede3d9",
 "hash"=>"c478160225a48b0213d2dc817bc4dcd60c469e81beccc595d43fa60a6d55ab0c"}
[{"index"=>0,
  "timestamp"=>1541746424,
  "data"=>"hi~",
  "pre_hash"=>"0",
  "hash"=>"1aa0b428d545796616c335607c8229158aaf9f94a09e6bd217c714661cf27cfc"},
 {"index"=>1,
  "timestamp"=>1541746424,
  "data"=>"tom",
  "pre_hash"=>
   "1aa0b428d545796616c335607c8229158aaf9f94a09e6bd217c714661cf27cfc",
  "hash"=>"75c7fc12c524b18c01d04f2aec3820123f6a4a3e3a65b2aaa783725ee1d9c2e7"},
 {"index"=>2,
  "timestamp"=>1541746424,
  "data"=>"jerry",
  "pre_hash"=>
   "75c7fc12c524b18c01d04f2aec3820123f6a4a3e3a65b2aaa783725ee1d9c2e7",
  "hash"=>"6114eec03fb78abad97937e5a99e976a0d81408e4f5b3ca44b18b18d69ede3d9"},
 {"index"=>3,
  "timestamp"=>1541746424,
  "data"=>"cr4fun",
  "pre_hash"=>
   "6114eec03fb78abad97937e5a99e976a0d81408e4f5b3ca44b18b18d69ede3d9",
  "hash"=>"c478160225a48b0213d2dc817bc4dcd60c469e81beccc595d43fa60a6d55ab0c"}]
true
```