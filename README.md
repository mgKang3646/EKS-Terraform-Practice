
# Terrform으로 EKS 프로비저닝 후, Stateful, Stateless App 배포하기 <br>


## 목차
1. Terraform으로 EKS 구성하기
2. ALB Ingress Controller 구성하기
3. AWS EBS CSI Drive 구성하기
4. Stateful App 배포하기
5. Stateless App 배포하기
6. StatefulSet으로 MySQL App 배포하기
<br>
<br>

## 1. Terraform으로 EKS 구성하기
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

<br>
<br>


## 2.ALB Ingress Controller 구성하기

<br>

![스크린샷 2024-02-23 오후 9 01 20](https://github.com/mgKang3646/Terraform-AWS-Practice/assets/80077569/d3eaeb00-8656-42a0-93b5-ba9a0b739c72)

<br>

EKS가 구성되면 EKS 내부 작업은 ‘OAUTH2.0’ 인증인가 방식을 사용한다. IAM이 Client에게 AccessKey와 SecretKey를 넘기지 않고 OIDC ID와 특정 권한을 가진 Service Account로 api-server에 접근하여 K8S의 다양한 작업을 진행할 수 있다.

<br>


![스크린샷 2024-02-23 오후 9 02 43](https://github.com/mgKang3646/Terraform-AWS-Practice/assets/80077569/7c251c9f-98f8-4ae7-b83e-b8b25bb76655)

<br>

ALB Ingress Controller는 Service Account의 OIDC로 인증하고 부여된 Role로 인가 받아 ALB Ingress 리소스를 모니터링 할 수 있다.

<br>
<br>

## 3.AWS EBS CSI Drive 구성하기

![스크린샷 2024-02-23 오후 9 04 04](https://github.com/mgKang3646/Terraform-AWS-Practice/assets/80077569/3d747e8a-c201-4b89-b29d-ef6eb04bc29e)

<br>

EBS CSI 드라이버 컨트롤러가 api-server에 접근하여 PVC를 탐색한 뒤, AWS EBS에 PVC에 따른 볼륨을 생성한다. EKS 1.23 부터는 CSI Driver만 사용하여 EBS와 연결 할 수 있다.

<br>
<br>

## 4. Stateful App 배포하기 

![스크린샷 2024-02-23 오후 9 07 13](https://github.com/mgKang3646/Terraform-AWS-Practice/assets/80077569/6e537874-ba7c-4e53-b59b-40ce2629bce8)

<br>

WordPress App은 PVC로 EBS와 볼륨마운팅하여 State가 유지되는 Stateful App이다. WordPress App의 resources와 livenessProbe를 설정하였고 HPA를 생성하여 AutoScailing이 되도록 하였다.


## 5. Stateless App 배포하기 

- rollingupdate

https://github.com/mgKang3646/EKS-Terraform-Practice/blob/main/yaml/bluegreen.yaml

- bluegreen

https://github.com/mgKang3646/EKS-Terraform-Practice/blob/main/yaml/rollingupdate.yaml

<br>
<br>


## 6. StatefulSet으로 MySQL App 배포하기

![image](https://github.com/mgKang3646/Terraform-AWS-Practice/assets/80077569/3b1c0f5d-0939-4bb6-b3f5-ee04df8042ff)

<br>

StatefulSet으로 replicas를 3으로 설정하면 POD 당 PVC-PV가 하나씩 만들어진다. POD가 동일하여 로드밸런싱 되는 것이 아니라 독립적인 영역이 존재하여 트래픽이 로드밸런싱 되면 안된다. 그러므로 서비스는 로드밸런싱을 지원하지 않는 Headless-Service로 해야 한다
