Terraform 으로 AWS IAM 관리하기
==========================

사용 이유
----------
여러 명의 IAM 계정 및 권한들을 관리하려면, AWS Console로 최적 / 최소한의 권한을 입력해주어야 한다. 하지만 IaC(Terraform)을 사용하여 IAM 계정을 관리하게 되면, 하나의 파일에서 IAM을 생성하고 삭제, Permission 설정 등의 관리들을 진행할 수 있으며 관리적인 측면에서 좋다.

또한 Terraform 과 연동할 수 있는 보안범위 점검 오픈소스 tfsec 등을 활용하여 권한에 대한 보안성도 향상할 수 있다.

---

## 사전 설정
* Terraform 설치: [Terraform Install Guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
* Terraform에서 사용할 IAM 수정 권한을 가진 AWS IAM 계정 생성 및 Access Key ID 및 Secret Key 저장
* AWS $HOME/.aws/ 하위의 config 및 credential에 위 내용을 정의: [User Guide for awscli](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)

---

## 실행 방법
1. <pre>$ cd terraform/example</pre>
2. <pre>$ terraform init</pre>
3. <pre>$ terraform plan</pre>
3. <pre>$ terraform apply</pre>


---

## 참고 문헌
* [Terraform AWS IAM Document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) 에서 aws_iam으로 필터링해서 검색