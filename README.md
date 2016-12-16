# Empatico.org Prometheus module for Terraform

A Prometheus module.

## Usage

```hcl
module "prometheus" {
  source             = "github.com/EmpaticoOrg/tf_prometheus"
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

