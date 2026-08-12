# Terraform Infrastructure as Code (IaC) – EC2 Automation

## 1. Introduction

Infrastructure as Code (IaC) is a DevOps practice in which infrastructure is defined and managed using configuration files instead of manually creating and configuring resources through a cloud provider's graphical interface.

In this internship task, **Terraform** is used as the IaC tool to automate the creation and management of an **Amazon EC2 instance**.

The objective of this project is to understand how Terraform can be used to:

* Define cloud infrastructure as code
* Automate infrastructure provisioning
* Create an AWS EC2 instance
* Configure infrastructure using variables
* Display resource information using outputs
* Validate infrastructure configuration
* Preview infrastructure changes before applying them
* Destroy infrastructure when it is no longer required
* Understand the basic Terraform workflow

---

## 2. Objectives

The main objectives of this task are:

1. Understand the concept of Infrastructure as Code.
2. Explore different IaC tools.
3. Understand the basic architecture of Terraform.
4. Install and configure Terraform.
5. Configure Terraform to work with AWS.
6. Create an EC2 instance using Terraform.
7. Use Terraform variables to make the configuration reusable.
8. Use Terraform outputs to display resource information.
9. Understand Terraform's initialization, planning, applying, and destroying workflow.
10. Understand how Terraform can automate DevOps and cloud infrastructure tasks.

---

# 3. What is Infrastructure as Code?

Infrastructure as Code is the practice of managing infrastructure through machine-readable configuration files.

Traditionally, cloud infrastructure is created manually:

```text
AWS Console
    ↓
Select EC2
    ↓
Choose AMI
    ↓
Choose Instance Type
    ↓
Configure Network
    ↓
Add Tags
    ↓
Launch Instance
```

This approach works for small environments, but it becomes difficult to manage when infrastructure grows.

With IaC, infrastructure is defined in code:

```text
Terraform Configuration
        ↓
Terraform CLI
        ↓
AWS Provider
        ↓
AWS API
        ↓
EC2 Instance
```

The infrastructure configuration can also be stored in Git, reviewed by team members, and reused whenever required.

---

# 4. Benefits of Infrastructure as Code

## 4.1 Automation

Infrastructure can be created and configured automatically instead of manually.

## 4.2 Consistency

The same configuration can be used repeatedly, reducing human errors.

## 4.3 Version Control

Infrastructure configuration can be stored in Git repositories.

This allows developers and DevOps engineers to:

* Track changes
* Review modifications
* Revert changes
* Collaborate with other team members

## 4.4 Reusability

Terraform configurations can be reused for different environments such as:

* Development
* Testing
* Staging
* Production

## 4.5 Faster Deployment

Infrastructure can be deployed using a few commands instead of manually configuring every resource.

## 4.6 Reduced Human Error

Manual configuration can result in mistakes. IaC reduces these errors by using predefined configurations.

---

# 5. IaC Tools Explored

Several tools are commonly used for infrastructure automation.

| Tool               | Purpose                                                 |
| ------------------ | ------------------------------------------------------- |
| Terraform          | Infrastructure provisioning and management              |
| AWS CloudFormation | AWS-native infrastructure provisioning                  |
| Ansible            | Configuration management and automation                 |
| Pulumi             | Infrastructure provisioning using programming languages |
| Azure Bicep        | Infrastructure deployment on Microsoft Azure            |

For this project, **Terraform** was selected because it is widely used for multi-cloud infrastructure automation and provides a declarative configuration language.

---

# 6. What is Terraform?

Terraform is an Infrastructure as Code tool developed by HashiCorp.

It allows users to define infrastructure using configuration files written in **HashiCorp Configuration Language (HCL)**.

Terraform can manage infrastructure from different providers, including:

* AWS
* Microsoft Azure
* Google Cloud
* Kubernetes
* GitHub
* Cloudflare
* Many other platforms

Instead of manually creating resources through a cloud console, Terraform allows infrastructure to be described using code.

For example:

```hcl
resource "aws_instance" "demo" {
  ami           = var.ami_id
  instance_type = var.instance_type
}
```

Terraform reads this configuration and communicates with AWS to create the requested infrastructure.

---

# 7. Why Terraform?

Terraform was selected for this project because it provides several useful features:

* Declarative infrastructure configuration
* Infrastructure automation
* Multi-cloud support
* Infrastructure version control
* Reusable configuration
* Dependency management
* State management
* Execution planning
* Easy infrastructure destruction
* Integration with CI/CD pipelines

---

# 8. Terraform Architecture

The basic Terraform architecture used in this project is:

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
                    AWS Infrastructure
                           |
                           v
                      EC2 Instance
```

### Components

### Terraform Configuration

Contains `.tf` files describing the desired infrastructure.

### Terraform CLI

Commands such as:

```bash
terraform init
terraform validate
terraform plan
terraform apply
terraform destroy
```

are used to manage the infrastructure.

### AWS Provider

The AWS provider allows Terraform to communicate with AWS APIs.

### AWS API

Terraform uses AWS APIs to create, modify, and delete resources.

### AWS Infrastructure

The final infrastructure is created inside the AWS account.

---

# 9. Project Architecture

The project uses Terraform to create an EC2 instance.

```text
Developer
    |
    | Terraform Code
    v
+----------------------+
| Terraform CLI        |
+----------------------+
    |
    | Provider
    v
+----------------------+
| AWS Provider         |
+----------------------+
    |
    | AWS API
    v
+----------------------+
| AWS Account          |
|                      |
|  +----------------+  |
|  | EC2 Instance   |  |
|  +----------------+  |
+----------------------+
```

---

# 10. Project Directory Structure

The recommended project structure is:

```text
terraform-iac-demo/
│
├── main.tf
├── variables.tf
├── outputs.tf
├── .gitignore
└── README.md
```

Each file has a specific purpose.

| File           | Purpose                                                   |
| -------------- | --------------------------------------------------------- |
| `main.tf`      | Defines AWS provider and EC2 resource                     |
| `variables.tf` | Defines configurable input variables                      |
| `outputs.tf`   | Displays information about created resources              |
| `.gitignore`   | Prevents sensitive/unnecessary files from being committed |
| `README.md`    | Project documentation                                     |

---

# 11. Prerequisites

Before running the project, the following tools are required:

* AWS account
* AWS CLI
* Terraform
* Git
* Internet connection
* Basic understanding of AWS EC2

---

# 12. AWS Configuration

Terraform needs permission to communicate with AWS.

AWS credentials should **not** be hard-coded inside Terraform files.

The recommended approach is to configure the AWS CLI.

After installing AWS CLI, run:

```bash
aws configure
```

Provide:

```text
AWS Access Key ID
AWS Secret Access Key
Default region name
Default output format
```

Example:

```text
AWS Access Key ID: ********
AWS Secret Access Key: ********
Default region name: ap-south-1
Default output format: json
```

Verify the configuration:

```bash
aws sts get-caller-identity
```

If the command returns your AWS account information, AWS authentication is working.

---

# 13. Terraform Configuration

The project contains three primary Terraform files:

```text
main.tf
variables.tf
outputs.tf
```

---

# 14. `main.tf`

The `main.tf` file defines the Terraform configuration, AWS provider, and EC2 instance.

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  required_version = ">= 1.6.0"
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "demo" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name        = "Terraform-Demo-Server"
    Environment = "Internship"
  }
}
```

---

# 15. Explanation of `main.tf`

## Terraform Block

```hcl
terraform {
```

The Terraform block specifies Terraform and provider requirements.

---

## Required Provider

```hcl
required_providers {
  aws = {
    source  = "hashicorp/aws"
    version = "~> 6.0"
  }
}
```

This tells Terraform that the project requires the AWS provider.

The provider source is:

```text
hashicorp/aws
```

The version constraint specifies the compatible provider version.

---

## Required Terraform Version

```hcl
required_version = ">= 1.6.0"
```

This specifies that Terraform version 1.6.0 or newer is required.

---

# 16. AWS Provider

```hcl
provider "aws" {
  region = var.aws_region
}
```

The AWS provider allows Terraform to communicate with AWS.

The region is taken from:

```hcl
var.aws_region
```

This means the region can be changed without modifying the resource configuration.

---

# 17. EC2 Resource

```hcl
resource "aws_instance" "demo" {
```

This creates an AWS EC2 instance.

The syntax is:

```text
resource "<provider_resource_type>" "<local_name>"
```

In this example:

```text
aws_instance
```

is the AWS resource type.

```text
demo
```

is the local Terraform name.

---

# 18. AMI

```hcl
ami = var.ami_id
```

An AMI, or Amazon Machine Image, provides the operating system and software configuration used to launch the EC2 instance.

The AMI ID is provided through a Terraform variable.

The AMI must be compatible with the selected AWS region.

---

# 19. Instance Type

```hcl
instance_type = var.instance_type
```

This specifies the EC2 instance type.

For example:

```text
t3.micro
```

The instance type determines the compute resources allocated to the EC2 instance.

---

# 20. Tags

```hcl
tags = {
  Name        = "Terraform-Demo-Server"
  Environment = "Internship"
}
```

Tags provide metadata for AWS resources.

The configuration adds:

```text
Name = Terraform-Demo-Server
Environment = Internship
```

Tags make resources easier to identify and manage.

---

# 21. `variables.tf`

The `variables.tf` file defines the inputs used by the Terraform configuration.

```hcl
variable "aws_region" {
  description = "AWS region where the EC2 instance will be created"
  type        = string
  default     = "ap-south-1"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}
```

---

# 22. Explanation of Variables

## AWS Region

```hcl
variable "aws_region"
```

Defines the AWS region.

The default value is:

```text
ap-south-1
```

which is the Mumbai AWS region.

---

## AMI ID

```hcl
variable "ami_id"
```

Stores the AMI ID.

There is no default value because the correct AMI depends on the AWS region and operating system selected.

---

## Instance Type

```hcl
variable "instance_type"
```

Defines the EC2 instance type.

The default value is:

```text
t3.micro
```

---

# 23. `outputs.tf`

The `outputs.tf` file defines information that Terraform should display after infrastructure is created.

```hcl
output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.demo.id
}

output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.demo.public_ip
}
```

---

# 24. Explanation of Outputs

## Instance ID

```hcl
aws_instance.demo.id
```

returns the ID of the EC2 instance.

Example:

```text
i-0123456789abcdef0
```

## Public IP

```hcl
aws_instance.demo.public_ip
```

returns the public IPv4 address assigned to the EC2 instance.

Example:

```text
13.234.xxx.xxx
```

---

# 25. Terraform Workflow

Terraform follows a standard workflow:

```text
Write Configuration
        ↓
terraform init
        ↓
terraform validate
        ↓
terraform plan
        ↓
terraform apply
        ↓
Infrastructure Created
        ↓
terraform destroy
```

Each stage has a specific purpose.

---

# 26. Step 1 – Initialize Terraform

Run:

```bash
terraform init
```

Terraform downloads the required providers and initializes the working directory.

Expected result:

```text
Terraform has been successfully initialized!
```

This command should normally be run when setting up the project for the first time or when provider/module requirements change.

---

# 27. Step 2 – Validate Configuration

Run:

```bash
terraform validate
```

This checks whether the Terraform configuration is syntactically valid and internally consistent.

Example result:

```text
Success! The configuration is valid.
```

---

# 28. Step 3 – Format Terraform Code

Run:

```bash
terraform fmt
```

This automatically formats Terraform configuration files according to Terraform's standard formatting rules.

It improves code readability and consistency.

---

# 29. Step 4 – Create an Execution Plan

Run:

```bash
terraform plan -var="ami_id=YOUR_AMI_ID"
```

Terraform analyzes the configuration and determines what changes are required.

The plan allows you to review the proposed infrastructure changes before applying them.

A new EC2 instance will typically appear as:

```text
+ aws_instance.demo
```

The `+` symbol means Terraform plans to create the resource.

---

# 30. Step 5 – Apply the Configuration

Run:

```bash
terraform apply -var="ami_id=YOUR_AMI_ID"
```

Terraform displays the execution plan and asks for confirmation.

You will normally see:

```text
Do you want to perform these actions?
  Terraform will perform the actions described above.

Enter a value:
```

Enter:

```text
yes
```

Terraform will then create the EC2 instance.

---

# 31. Step 6 – View Outputs

After successful deployment, Terraform displays the configured outputs.

For example:

```text
instance_id = "i-0123456789abcdef0"

public_ip = "13.234.xxx.xxx"
```

You can also retrieve outputs later using:

```bash
terraform output
```

---

# 32. Step 7 – Verify the EC2 Instance

Open the AWS Management Console and navigate to:

```text
EC2 → Instances
```

The created instance should appear with the tag:

```text
Terraform-Demo-Server
```

You can verify:

* Instance ID
* Instance state
* Instance type
* Public IP
* Availability Zone
* Tags

This confirms that Terraform successfully automated the provisioning process.

---

# 33. Step 8 – Destroy Infrastructure

After testing, the EC2 instance should be removed to avoid unnecessary AWS charges.

Run:

```bash
terraform destroy -var="ami_id=YOUR_AMI_ID"
```

Terraform will show the resources that will be deleted.

Confirm with:

```text
yes
```

Terraform will remove the infrastructure it manages.

---

# 34. Terraform State

Terraform maintains a state file called:

```text
terraform.tfstate
```

The state file records information about resources managed by Terraform.

For example, it can contain information about:

* EC2 instance ID
* Resource attributes
* Provider information
* Infrastructure relationships

Terraform uses this state to compare the desired configuration with the existing infrastructure.

---

# 35. Why `terraform.tfstate` Should Not Be Committed

The Terraform state file can contain sensitive infrastructure information.

Therefore, it should generally not be committed to a public Git repository.

Add the following to `.gitignore`:

```gitignore
.terraform/
*.tfstate
*.tfstate.*
crash.log
crash.*.log
*.tfvars
*.tfvars.json
```

The `.terraform/` directory should also normally be excluded because Terraform can recreate it using:

```bash
terraform init
```

---

# 36. Important Security Practices

Never store AWS credentials directly inside Terraform code.

Avoid configurations such as:

```hcl
provider "aws" {
  access_key = "YOUR_ACCESS_KEY"
  secret_key = "YOUR_SECRET_KEY"
}
```

This is unsafe.

Instead, configure AWS credentials using the AWS CLI, environment variables, IAM roles, or another secure credential mechanism.

Also:

* Do not upload AWS credentials to GitHub.
* Do not commit secret keys.
* Do not share private credentials in screenshots.
* Use IAM with the minimum required permissions.
* Delete unused infrastructure after testing.

---

# 37. Important Terraform Commands

| Command                | Purpose                              |
| ---------------------- | ------------------------------------ |
| `terraform init`       | Initializes Terraform                |
| `terraform fmt`        | Formats Terraform code               |
| `terraform validate`   | Validates configuration              |
| `terraform plan`       | Shows planned changes                |
| `terraform apply`      | Creates or updates infrastructure    |
| `terraform output`     | Displays outputs                     |
| `terraform show`       | Displays Terraform state information |
| `terraform state list` | Lists managed resources              |
| `terraform destroy`    | Deletes managed infrastructure       |

---

# 38. Complete Project Code

## `main.tf`

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  required_version = ">= 1.6.0"
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "demo" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name        = "Terraform-Demo-Server"
    Environment = "Internship"
  }
}
```

## `variables.tf`

```hcl
variable "aws_region" {
  description = "AWS region where the EC2 instance will be created"
  type        = string
  default     = "ap-south-1"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}
```

## `outputs.tf`

```hcl
output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.demo.id
}

output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.demo.public_ip
}
```

## `.gitignore`

```gitignore
.terraform/
*.tfstate
*.tfstate.*
crash.log
crash.*.log
*.tfvars
*.tfvars.json
```

---

# 39. Complete Execution Procedure

Create a project directory:

```bash
mkdir terraform-iac-demo
cd terraform-iac-demo
```

Create the Terraform files:

```text
main.tf
variables.tf
outputs.tf
.gitignore
```

Add the Terraform configuration to the respective files.

Then execute:

```bash
terraform init
```

Next:

```bash
terraform fmt
```

Then:

```bash
terraform validate
```

Provide the AMI ID and create the execution plan:

```bash
terraform plan -var="ami_id=YOUR_AMI_ID"
```

Apply the configuration:

```bash
terraform apply -var="ami_id=YOUR_AMI_ID"
```

Confirm:

```text
yes
```

Check outputs:

```bash
terraform output
```

Verify the EC2 instance from the AWS Console.

After completing the experiment:

```bash
terraform destroy -var="ami_id=YOUR_AMI_ID"
```

Confirm:

```text
yes
```

---

# 40. Expected Result

After executing:

```bash
terraform apply
```

Terraform should successfully create an EC2 instance in the configured AWS region.

The output should provide information such as:

```text
instance_id = "i-xxxxxxxxxxxxxxxxx"
public_ip   = "xx.xx.xx.xx"
```

The same infrastructure can then be removed using:

```bash
terraform destroy
```

This demonstrates that infrastructure can be created and destroyed programmatically rather than manually through the AWS Console.

---

# 41. Manual Provisioning vs Terraform

| Feature                      | Manual AWS Console | Terraform                            |
| ---------------------------- | ------------------ | ------------------------------------ |
| Infrastructure creation      | Manual             | Automated                            |
| Repeatability                | Low                | High                                 |
| Version control              | Difficult          | Easy                                 |
| Configuration consistency    | Depends on user    | High                                 |
| Infrastructure documentation | Often manual       | Code itself documents infrastructure |
| Deployment speed             | Slower             | Faster                               |
| Error probability            | Higher             | Lower                                |
| CI/CD integration            | Limited            | Excellent                            |
| Infrastructure deletion      | Manual             | Automated                            |

---

# 42. DevOps Relevance

Terraform is highly relevant to DevOps because infrastructure can become part of the software delivery lifecycle.

A typical DevOps workflow can look like:

```text
Developer
    ↓
Git Repository
    ↓
CI/CD Pipeline
    ↓
Terraform
    ↓
Cloud Infrastructure
    ↓
Application Deployment
```

Terraform can therefore be integrated with CI/CD tools such as:

* GitHub Actions
* GitLab CI/CD
* Jenkins
* AWS CodePipeline

This allows infrastructure changes to be reviewed and deployed through automated pipelines.

---

# 43. Infrastructure Lifecycle

Terraform manages infrastructure through a lifecycle:

```text
Define
  ↓
Initialize
  ↓
Plan
  ↓
Apply
  ↓
Manage
  ↓
Update
  ↓
Destroy
```

For example:

```text
main.tf
   ↓
terraform init
   ↓
terraform plan
   ↓
terraform apply
   ↓
EC2 Created
   ↓
Modify Terraform Code
   ↓
terraform plan
   ↓
terraform apply
   ↓
EC2 Updated
   ↓
terraform destroy
   ↓
EC2 Deleted
```

---

# 44. Key Concepts Learned

During this task, the following Terraform concepts were explored:

### Infrastructure as Code

Infrastructure can be represented through code.

### Declarative Configuration

Terraform describes the desired final state rather than requiring every individual action to be manually specified.

### Provider

A provider allows Terraform to communicate with an external platform such as AWS.

### Resource

A resource represents infrastructure managed by Terraform.

### Variable

Variables allow configurations to be customized without modifying the core infrastructure code.

### Output

Outputs expose useful information about deployed infrastructure.

### State

Terraform state allows Terraform to keep track of managed infrastructure.

### Plan

The plan previews infrastructure changes.

### Apply

The apply command executes the planned changes.

### Destroy

The destroy command removes infrastructure managed by Terraform.

---

# 45. Challenges and Solutions

## Challenge 1: AWS Authentication

Terraform needs valid AWS credentials.

### Solution

Configure AWS CLI credentials securely rather than storing credentials inside Terraform files.

---

## Challenge 2: AMI Availability

AMI IDs are region-specific.

### Solution

Use an AMI that exists in the selected AWS region.

---

## Challenge 3: Terraform State

Terraform requires state information to track infrastructure.

### Solution

Allow Terraform to manage its state and avoid committing the state file to public repositories.

---

## Challenge 4: Unexpected AWS Costs

Cloud resources can generate charges if they remain running.

### Solution

Destroy test resources after completing the experiment.

```bash
terraform destroy
```

---

# 46. Learning Outcome

After completing this project, I gained an understanding of how Infrastructure as Code can be used to automate cloud infrastructure.

The project demonstrated how Terraform can:

* Define infrastructure using code
* Connect to AWS using a provider
* Provision an EC2 instance
* Use variables for configuration
* Generate resource outputs
* Preview infrastructure changes
* Apply infrastructure changes
* Track infrastructure using state
* Destroy infrastructure automatically

The project also demonstrated the importance of automation, consistency, repeatability, and version-controlled infrastructure in DevOps.

---

# 47. Conclusion

This project demonstrates a basic but practical implementation of **Infrastructure as Code using Terraform**.

Instead of manually creating an EC2 instance through the AWS Management Console, the infrastructure is defined using Terraform configuration files. Terraform then communicates with AWS and provisions the required infrastructure automatically.

The workflow:

```text
Terraform Code
      ↓
terraform init
      ↓
terraform validate
      ↓
terraform plan
      ↓
terraform apply
      ↓
EC2 Instance
      ↓
terraform destroy
```

shows how infrastructure can be managed throughout its lifecycle using code.

Although this project uses only a single EC2 instance, the same Terraform concepts can be extended to larger environments involving:

* VPCs
* Subnets
* Security Groups
* Load Balancers
* Auto Scaling Groups
* RDS
* S3
* IAM
* Kubernetes
* Multi-environment infrastructure

Therefore, Terraform provides a strong foundation for automating infrastructure as part of modern DevOps practices.

---

# 48. Future Improvements

The current project can be extended by adding additional AWS resources.

Possible improvements include:

1. Create a custom VPC using Terraform.
2. Create public and private subnets.
3. Configure security groups.
4. Create an EC2 instance inside the custom VPC.
5. Install Nginx automatically using a user-data script.
6. Add an Application Load Balancer.
7. Create an Auto Scaling Group.
8. Add an S3 bucket.
9. Use Terraform modules.
10. Store Terraform state remotely using an S3 backend with appropriate state locking.
11. Integrate Terraform with GitHub Actions.
12. Create separate development, staging, and production environments.

A more advanced architecture could look like:

```text
                    GitHub
                       |
                       v
                GitHub Actions
                       |
                       v
                  Terraform
                       |
          +------------+------------+
          |            |            |
          v            v            v
         VPC           S3           IAM
          |
    +-----+------+
    |            |
    v            v
  Public       Private
  Subnet       Subnet
    |             |
    v             v
   ALB            RDS
    |
    v
 EC2 / ASG
```

