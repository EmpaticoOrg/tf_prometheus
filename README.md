# Empatico.org Jenkins module for Terraform

A lightweight Jenkins service module.

## Usage

```hcl
module "jenkins" {
  source             = "github.com/EmpaticoOrg/tf_jenkins"
  environment        = "${var.environment}"
  vpc_id             = "${data.terraform_remote_state.vpc.vpc_id}"
  public_subnet_id   = "${data.terraform_remote_state.vpc.public_subnet_ids.2}"
  role               = "${var.role}"
  app                = "${var.app}"
  region             = "${var.region}"
  key_name           = "${var.key_name}"
  domain             = "${var.domain}"
}
```

Assumes you're building your Web service inside a VPC created from [this
module](https://github.com/EmpaticoOrg/tf_vpc).

See `interface.tf` for additional configurable variables.

## License

MIT

