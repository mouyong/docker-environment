
## 构建

```
cd python
docker build -t python-developer:latest .
docker build -t golang-developer:latest .
docker build -t nvm-developer:latest .
docker build -t php8.0-developer:latest .
```

## 启动开发环境

```
docker run -it -v /$PWD://app -w //app python-developer bash
docker run -it -v /$PWD://app -w //app golang-developer bash
docker run -it -v /$PWD://app -w //app nvm-developer bash
docker run -it -v /$PWD://app -w //app php8.0-developer bash
```
