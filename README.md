# aws-network-template
Criacao de network para AWS

# Instrucoes:

Configurar variaveis conforme necessidade:

## Variables
- aws_profile
- aws_region
- project
- environment
- cidr_block
- subnet_pvt_config
- subnet_pub_config

## Example:

- aws_profile   -> "usuario_profile"
- aws_region    -> "us-east-1"
- project       -> "dev-rc"
- environment   -> "hml"
- cidr_block    -> "10.0.0.0/16"
- subnet_pvt_config -> [
		{
		  cidr_block     = "10.0.1.0/24"
		  available_zone = "${var.aws_region}a"
		},
		{
		  cidr_block     = "10.0.2.0/24"
		  available_zone = "${var.aws_region}b"
		},
		{
		  cidr_block     = "10.0.3.0/24"
		  available_zone = "${var.aws_region}c"
		},
		{
		  cidr_block     = "10.0.4.0/24"
		  available_zone = "${var.aws_region}d"
		}
		]

- subnet_pub_config = [
		{
		  cidr_block     = "10.0.8.0/24"
		  available_zone = "${var.aws_region}a"
		},
		{
		  cidr_block     = "10.0.9.0/24"
		  available_zone = "${var.aws_region}b"
		}
	  ]

# outputs

Dados da infraestrutura retornados:

- aws_vpc_vpc_id
- avaiable_zones
- private-subnet-ids [] -> list(string)
- public-subnet-ids [] -> list(string)

# TF commands

## Plan
terraform plan -out="tfplan.out"
## Apply
terraform apply "tfplan.out"
## Destroy
terraform destroy -auto-approve