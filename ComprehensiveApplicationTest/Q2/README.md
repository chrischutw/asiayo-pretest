# Q2

## Question
試想有一服務架構圖如下
![kubeernetes_architecture](kubeernetes_architecture.jpg)

作答要求：
● 請使用terraform 架設如上述的AWS Elastic Kubernetes Service (EKS)
的cluster 服務。
● 請撰寫如圖中，適用於 k8s 的應用程式服務manifest 設定檔。
● 設計時，請考量以高可用性為主。

## Answer

### Terraform 說明

- Terraform 結構
terraform/
├── backend.tf             # 設定 Terraform backend 存放位置
├── main.tf                # 主要的 Terraform 配置檔案
├── output.tf              # 輸出 terraform 輸出值
├── providers.tf           # 設定 Providers
├── variables.tf           # 定義變數
├── versions.tf            # Terraform 版本 & Provider 限制
├── modules/               # 模組
│   ├── vpc/               # VPC 相關資源
│   │   └── main.tf
│   │   ├── variables.tf   # 定義變數
│   ├── eks/               # EKS 叢集
│   │   └── main.tf
│   │   ├── variables.tf   # 定義變數
└── terraform.tfvars       # 設定具體環境變數

### formatting

```shell
terraform fmt -recursive
```

### Kubernetes 說明

#### mysql

- 暫時跳過 mysql.cnf 設定
- 機敏性資料也暫時不處理
- 參考此[文章](https://cloud.google.com/kubernetes-engine/docs/tutorials/stateful-workloads/mysql#router)的作法，採用 mysql router 達到讀寫分離

#### app

- 隨便產生個 web app，讓他可以從 ingress 收到流量，並且可以連到 DB
- 透過 HPA 的方式達成高可用
