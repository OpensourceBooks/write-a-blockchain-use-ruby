### 创建创世区块
```
cd server
ruby g.rb hello
```
### 开启RPC服务

```
ruby rpc_server.rb
```

### 客户端

```
cd ..
```
```
ruby rpc_client.rb localhost 1212 all
```

```
ruby rpc_client.rb localhost 1212 add hi
```

```
ruby rpc_client.rb localhost 1212 last
```

```
ruby rpc_client.rb localhost 1212 all
```

### 浏览器

```
cd explore
ruby app.rb localhost 1212
```

```
http://localhost:3000/
```