Terraform Project Template
===========================

我的 Terraform 我做主。

## 使用方法

```bash
# 确认 AWS CLI 工具安装
$ aws --version
$ aws s3 ls
# 确认 Terraform CLI 工具安装
$ terraform -install-autocomplete
$ terraform version
# 克隆 Terraform 模版库
$ git clone https://github.com/komavideo/terraform_main
$ cd terraform_main
# 1.目录初始化
$ terraform init
# 2.检验 tf 文件
$ terraform validate
# 3.实施计划, 准备资源
$ terraform plan
# 4.应用部署
$ terraform apply
$ terraform apply -auto-approve
# 5.摧毁系统
$ terraform destroy
$ terraform destroy -auto-approve
```

## HashiCorp Developer
https://developer.hashicorp.com/

## Terraform AWS modules
https://registry.terraform.io/namespaces/terraform-aws-modules

## Amazon EKS Blueprints for Terraform
https://github.com/aws-ia/terraform-aws-eks-blueprints
