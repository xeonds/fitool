# 使用 Python 官方镜像作为基础镜像
FROM python:3.11-slim

# 设置工作目录
WORKDIR /app

# 复制 requirements.txt 文件并安装 Python 依赖
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# 启动 Flask 应用（代码目录会在运行时挂载到 /app）
CMD ["python", "app.py"]
