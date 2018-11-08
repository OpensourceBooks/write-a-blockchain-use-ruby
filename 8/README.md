1. 建立数据库
```
ruby bc.rb build
```
返回
```
"build ok"
```
2. 创世
```
ruby bc.rb init "从零开始写区块链"
```

返回
```
{:index=>0,
 :timestamp=>1541663817,
 :data=>"从零开始写区块链",
 :pre_hash=>0,
 :hash=>"3726dbcfffcf8066acaad883445c0bc7e6a8fc76a6bc8106cb0601ecf96d909d"}
```

3. 新增区块
```
ruby bc.rb add "你好，这是第一个区块"
```

4. 查看是否新增成功（查看最后一个区块）
```
ruby bc.rb last
```
返回

```
{:index=>1,
 :timestamp=>1541663897,
 :data=>"你好，这是第一个区块",
 :pre_hash=>"3726dbcfffcf8066acaad883445c0bc7e6a8fc76a6bc8106cb0601ecf96d909d",
 :hash=>"5763b85e3cfc36fafa9aa70debdf2ff36571d8d46323a2ae97308dbf672494f7"}
```

5. 查看全部区块

```
ruby bc.rb all
```

返回
```
[{:index=>0,
  :timestamp=>1541663817,
  :data=>"从零开始写区块链",
  :pre_hash=>"0",
  :hash=>"3726dbcfffcf8066acaad883445c0bc7e6a8fc76a6bc8106cb0601ecf96d909d"},
 {:index=>1,
  :timestamp=>1541663897,
  :data=>"你好，这是第一个区块",
  :pre_hash=>
   "3726dbcfffcf8066acaad883445c0bc7e6a8fc76a6bc8106cb0601ecf96d909d",
  :hash=>"5763b85e3cfc36fafa9aa70debdf2ff36571d8d46323a2ae97308dbf672494f7"}]
```

6. 查看创世区块

```
ruby bc.rb g
```

返回
```
{:index=>0,
 :timestamp=>1541663817,
 :data=>"从零开始写区块链",
 :pre_hash=>"0",
 :hash=>"3726dbcfffcf8066acaad883445c0bc7e6a8fc76a6bc8106cb0601ecf96d909d"}
```