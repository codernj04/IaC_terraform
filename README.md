# Terraform IaC – AWS EC2 Automation

## 📌 Project Overview

This project demonstrates the use of **Infrastructure as Code (IaC)** with **Terraform** to automate the provisioning of an **AWS EC2 instance**.

Instead of manually creating an EC2 instance through the AWS Management Console, Terraform is used to define the infrastructure as code and automatically create, manage, and destroy the resource.

This project was completed as part of an **internship task to explore IaC tools and understand infrastructure automation in DevOps**.

---

## 🎯 Objectives

The main objectives of this project are:

* Understand the concept of Infrastructure as Code.
* Explore Terraform and its role in DevOps.
* Configure Terraform with AWS.
* Automate EC2 instance provisioning.
* Understand Terraform providers, resources, variables, and outputs.
* Learn the basic Terraform workflow.
* Practice infrastructure creation and destruction using code.

---

## 🛠️ Technologies Used

| Technology | Purpose                          |
| ---------- | -------------------------------- |
| Terraform  | Infrastructure as Code           |
| AWS        | Cloud infrastructure             |
| Amazon EC2 | Compute resource                 |
| AWS CLI    | AWS authentication               |
| HCL        | Terraform configuration language |
| Git        | Version control                  |

---

## 📂 Project Structure

```text
terraform-iac-demo/
│
├── main.tf          # Terraform provider and EC2 configuration
├── variables.tf     # Terraform input variables
├── outputs.tf       # Outputs from the EC2 instance
├── .gitignore       # Files excluded from Git
└── README.md        # Project documentation
```

---

## 🏗️ Architecture

```text
                Terraform Configuration
                         |
                         v
                   Terraform CLI
                         |
                         v
                   AWS Provider
                         |
                         v
                     AWS API
                         |
                         v
                    AWS Account
                         |
                         v
                    EC2 Instance
```

---

## ⚙️ Prerequisites

Before running this project, make sure the following are installed and configured:

* AWS Account
* AWS CLI
* Terraform
* Git
* Internet connection

Verify Terraform:

```bash
terraform --version
```

Verify AWS CLI:

```bash
aws --version
```

Verify AWS authentication:

```bash
aws sts get-caller-identity
```

---

## 🔐 AWS Authentication

Configure AWS credentials using the AWS CLI:

```bash
aws configure
```

Provide your:

```text
AWS Access Key ID
AWS Secret Access Key
Default Region
Default Output Format
```

### ⚠️ Security Warning

**Never store AWS access keys or secret keys directly inside Terraform files or commit them to GitHub.**

Use secure authentication methods such as:

* AWS CLI credentials
* Environment variables
* IAM roles
* CI/CD secrets

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone <repository-url>
```

Move into the project directory:

```bash
cd terraform-iac-demo
```

---

### 2. Initialize Terraform

```bash
terraform init
```

This downloads the required AWS provider and initializes the Terraform working directory.

---

### 3. Format the Configuration

```bash
terraform fmt
```

This formats the Terraform files according to standard Terraform formatting rules.

---

### 4. Validate the Configuration

```bash
terraform validate
```

A successful validation should return:

```text
Success! The configuration is valid.
```

---

### 5. Review the Execution Plan

Provide an appropriate AMI ID for your AWS region:

```bash
terraform plan -var="ami_id=YOUR_AMI_ID"
```

Terraform will show what resources it intends to create or modify.

---

### 6. Create the EC2 Instance

Run:

```bash
terraform apply -var="ami_id=YOUR_AMI_ID"
```

Terraform will display the execution plan and ask for confirmation.

Enter:

```text
yes
```

Terraform will then create the EC2 instance.

---

## 📤 View Outputs

After deployment, Terraform displays the EC2 instance information.

You can also run:

```bash
terraform output
```

Example:

```text
instance_id = "i-0123456789abcdef0"
public_ip   = "13.234.xxx.xxx"
```

---

## 🔍 Verify the Deployment

Open the AWS Management Console and navigate to:

```text
EC2 → Instances
```

Look for the instance with the tag:

```text
Name = Terraform-Demo-Server
```

You can verify:

* Instance ID
* Instance state
* Instance type
* Public IP
* AWS region
* Tags

---

## 🗑️ Destroy the Infrastructure

After testing, destroy the EC2 instance to avoid unnecessary AWS charges:

```bash
terraform destroy -var="ami_id=YOUR_AMI_ID"
```

Confirm the operation by entering:

```text
yes
```

Terraform will remove the resources managed by this configuration.

---

## 📋 Terraform Commands Used

| Command                | Description                          |
| ---------------------- | ------------------------------------ |
| `terraform init`       | Initializes the Terraform project    |
| `terraform fmt`        | Formats Terraform files              |
| `terraform validate`   | Validates Terraform configuration    |
| `terraform plan`       | Shows planned infrastructure changes |
| `terraform apply`      | Creates or updates infrastructure    |
| `terraform output`     | Displays Terraform outputs           |
| `terraform show`       | Displays Terraform state information |
| `terraform state list` | Lists Terraform-managed resources    |
| `terraform destroy`    | Deletes managed infrastructure       |

---

## 📚 Key Terraform Concepts

### Provider

The AWS provider allows Terraform to communicate with AWS.

### Resource

A resource represents infrastructure managed by Terraform.

Example:

```hcl
resource "aws_instance" "demo" {
  ...
}
```

### Variable

Variables make the Terraform configuration reusable and configurable.

### Output

Outputs display useful information about deployed resources.

### State

Terraform uses state to track infrastructure managed by Terraform.

### Plan

`terraform plan` previews changes before they are applied.

### Apply

`terraform apply` executes the planned infrastructure changes.

### Destroy

`terraform destroy` removes infrastructure managed by Terraform.

---

## 🔄 Terraform Workflow

```text
Write Terraform Code
        ↓
terraform init
        ↓
terraform fmt
        ↓
terraform validate
        ↓
terraform plan
        ↓
terraform apply
        ↓
AWS EC2 Instance Created
        ↓
terraform output
        ↓
terraform destroy
        ↓
Infrastructure Removed
```

---

## 🎓 Learning Outcomes

After completing this project, the following concepts were explored:

* Infrastructure as Code
* Terraform fundamentals
* AWS provider configuration
* EC2 provisioning
* Terraform variables
* Terraform outputs
* Terraform state
* Infrastructure planning
* Infrastructure deployment
* Infrastructure destruction
* Basic cloud automation
* DevOps infrastructure practices

---

## 🚀 Future Improvements

The project can be extended by adding:

* Custom AWS VPC
* Public and private subnets
* Security Groups
* Internet Gateway
* Route Tables
* Application Load Balancer
* Auto Scaling Group
* Amazon S3
* Amazon RDS
* Terraform Modules
* Remote Terraform State
* GitHub Actions CI/CD
* Automated Nginx installation
* Development, staging, and production environments

---
