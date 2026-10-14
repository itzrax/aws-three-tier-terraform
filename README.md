# Three-Tier AWS Application Infrastructure (Terraform)

A Terraform-based project for building a three-tier AWS application infrastructure, with a focus on network isolation, secure access, and automated deployment.

## Architecture

![Architecture Diagram](docs/architecture.png)

### Network Layout (`10.0.0.0/16`)
* **Public Subnets (x2):** Host Application Load Balancer (ALB) & NAT Gateway.
* **Private App Subnets (x2):** Host ECS Fargate container tasks running the Flask application (no public IPs).
* **Private Data Subnets (x2):** Host RDS PostgreSQL instance with zero direct internet or external exposure.

### Security Model & Traffic Flow
Traffic is strictly isolated using chained Security Groups:
1. **Internet $\rightarrow$ ALB:** Port 80
2. **ALB $\rightarrow$ ECS Tasks:** Port 5000 (ECS accepts ingress **only** from ALB SG)
3. **ECS Tasks $\rightarrow$ RDS PostgreSQL:** Port 5432 (RDS accepts ingress **only** from ECS Task SG)

---

## Estimated Monthly Cost Breakdown

| Component | Class / Configuration | Approx. Monthly Cost |
| :--- | :--- | :--- |
| **AWS NAT Gateway** | 1 NAT Gateway (~720 hrs) + Data process | ~$32.00 |
| **Application Load Balancer** | 1 ALB | ~$18.00 |
| **Amazon RDS (PostgreSQL)** | `db.t4g.micro` (Single-AZ, 20GB gp3) | ~$15.00 |
| **AWS Fargate** | 1 Task (0.25 vCPU, 0.5 GB RAM) | ~$9.00 |
| **Amazon ECR / CloudWatch** | Storage & Log Retention (7 days) | ~$2.00 |
| **Total Estimated Cost** | | **~$76.00 / month** |

> **Note:** Apply for demo or testing sessions and execute `make destroy` immediately after testing to minimize charges.

---

## What I'd Change for Production

* **Multi-AZ High Availability:** Deploy NAT Gateways in each Availability Zone for fault tolerance.
* **Multi-AZ Database:** Enable Multi-AZ deployment for RDS automatic failover.
* **AWS WAF:** Attach AWS Web Application Firewall to the ALB to protect against OWASP Top 10 web vulnerabilities.
* **HTTPS / TLS Termination:** Provision an ACM SSL certificate and enforce HTTPS on port 443.