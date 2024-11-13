# 部署

## 运行环境

```shell
docker-compose -f manifests/c9s-docker-compose.yml up -d
```

## 创建数据库表

sql 路径 `configs/cybernetics.sql` 

## 配置文件

复制 `configs/appconfig/cybernetics-usercenter.config.tmpl.yaml` 再修改。

```yaml
# cybernetics-usercenter 服务配置文件
http:
  addr: 0.0.0.0:38080 # HTTP 服务监听地址
grpc:
  addr: 0.0.0.0:39090 # gRPC 服务监听地址
tls:
  use-tls: false # 是否启用 TLS
  cert: ${CYBERNETICS_USERCENTER_TLS_CERT} # TLS 证书路径
  key: ${CYBERNETICS_USERCENTER_TLS_KEY} # TLS 私钥路径
mysql:
  host: 127.0.0.1:3306 # 数据库主机地址
  database: cybernetics # 数据库名称
  username: cybernetics # 数据库用户名
  password: cybernetics(#)666 # 数据库密码
  log-level: 1 # 数据库日志级别，1 为最低，4 为最高
redis:
  addr: 127.0.0.1:6379 # Redis 地址
  database: 0 # Redis 数据库索引
  password: cybernetics(#)666 # Redis 密码
etcd:
  endpoints: 127.0.0.1:2379 # etcd 服务地址
kafka:
  brokers: 127.0.0.1:9092
  topic: 
  timeout: 3s
  # tls:
  #mechanism:
  #username:
  #password:
  #algorithm:
  #compressed:
  writer: # 使用默认值即可，不需要在 manifests/env.local 中配置
    max-attempts: 10
    required-acks: 1
    async: true
    batch-size: 100
    batch-timeout: 1s
    batch-bytes: 1024
jaeger:
  env: dev # Jaeger 环境
  server: 127.0.0.1:4317 # Jaeger 服务地址
  service-name: cybernetics-usercenter  # Jaeger 服务名称
log: # 使用默认值即可，不需要在 manifests/env.local 中配置
    level: debug # 日志级别，优先级从低到高依次为：debug, info, warn, error, dpanic, panic, fatal。
    format: console # 支持的日志输出格式，目前支持 console 和 json 两种。console 其实就是 text 格式。
    enable-color: true # 是否开启颜色输出，true: 是，false: 否
    disable-caller: false # 是否开启 caller，如果开启会在日志中显示调用日志所在的文件、函数和行号
    disable-stacktrace: false # 是否再 panic 及以上级别禁止打印堆栈信息
    output-paths: [stdout] # 多个输出，逗号分开。stdout：标准输出，
```

## 构建

```shell
make build
```

## 运行


```shell
./_output/platforms/linux/amd64/cybernetics-usercenter -c configs/cybernetics-usercenter.config.yaml
```