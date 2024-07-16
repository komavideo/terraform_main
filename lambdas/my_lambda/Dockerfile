# 使用官方的 AWS Lambda Python 3.8 运行时作为基础镜像
# FROM --platform=linux/amd64 public.ecr.aws/lambda/python:3.12
FROM --platform=arm64 public.ecr.aws/lambda/python:3.12

# 将当前目录下的代码复制到容器中的 /var/task 目录
COPY requirements.txt .

# 安装所需的依赖包
RUN dnf update -y \
  && dnf clean all \
  && pip install --upgrade pip \
  && pip install --no-cache-dir -r requirements.txt

COPY . ${LAMBDA_TASK_ROOT}

# 指定 Lambda 函数的处理程序
CMD ["index.main"]
