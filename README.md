
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
docker run -itd --name python -p 3000:3000 -v /$PWD://app -w //app python-developer bash
docker run -itd --name golang -p 3000:3000-v /$PWD://app -w //app golang-developer bash
docker run -itd --name nvm -p 3000:3000 -v /$PWD://app -w //app nvm-developer bash
docker run -itd --name php -p 8787:8787 -p 1236:1236 -p 7200:7200 -v /$PWD://app -w //app php8.0-developer bash
```
