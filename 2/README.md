```
blockchain = []

def block(index,data,pre_hash)
    {
        "index" => index,
        "timestamp" => Time.now,
        "data" => data,
        "pre_hash" => pre_hash
    }
end

def get_pre_hash
    blockchain.last["pre_hash"]
end

blockchain << block(0,"g","0")
pp get_pre_hash
```

```
ruby blockchain.rb
```

```
Traceback (most recent call last):
        1: from blockchain.rb:21:in `<main>'
blockchain.rb:17:in `get_pre_hash': undefined local variable or method `blockchain' for main:Object (NameError)
Did you mean?  block_given?
```

```
require "digest"
require "json"
require "pp"

@blockchain = []

def block(index,data,pre_hash)
    {
        "index" => index,
        "timestamp" => Time.now,
        "data" => data,
        "pre_hash" => pre_hash
    }
end

def get_pre_hash
    @blockchain.last["pre_hash"]
end

@blockchain << block(0,"g","0")
pp get_pre_hash
```

```
"11823b78ae9fe744f56429da282e304ce4449ea2e78b39264e48003cac36c6d1"
```

