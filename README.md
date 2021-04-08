
## 构建

```
cd python
docker build -t python:local .
```

## 启动开发环境

```
docker run -it -v /$PWD://app -w //app python:local bash
```
