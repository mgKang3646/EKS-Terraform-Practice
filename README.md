<div align="center">
<h3>Terrform으로 EKS 프로비저닝 후 Stateful & Stateless App 배포하기</h3>
<br>
</div>

## Terraform으로 EKS 구성하기
<br>

![스크린샷 2024-02-23 오후 8 56 37](https://github.com/mgKang3646/Terraform-AWS-Practice/assets/80077569/2a810c50-472c-4477-aebb-4f38ba1203c7)

<br>

테라폼으로 EKS를 구성하려면 두가지 리소스를 만들어야 한다.

<br>

1) EKS 클러스터 리소스 ( Control Plane )
2) EKS 노드 그룹 ( Worker Node )

<br>

![스크린샷 2024-02-23 오후 8 58 53](https://github.com/mgKang3646/Terraform-AWS-Practice/assets/80077569/9122cde4-09de-4294-b645-ba4c340ae8c5)

<br>

권한을 가진 IAM 사용자의 AccessKey와 SecretKey를 Terraform AWS Provider에게 제공하면, Provider가 IAM 사용자 대신 AWS API에 접근하여 EKS 클러스터를 생성한다
