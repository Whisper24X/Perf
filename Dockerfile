FROM python:3.9-slim

# 安装 ADB 工具
RUN apt-get update && apt-get install -y \
    usbutils \
    android-tools-adb \
    openjdk-17-jre-headless

# 复制 ADB 配置和脚本
COPY . /app
WORKDIR /app
#
## 安装 Python 依赖（如果有）
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
