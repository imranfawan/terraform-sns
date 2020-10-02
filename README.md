# terraform-sns




## Overview

This terraform module will provision a single SNS topic. 
   
## Usage

Example of the module's usage is as follows:

Execute `terraform apply` from the `example` folder.

```{r, engine='bash', count_lines}

/**
terraform {
  backend "s3" {
    bucket = "<BUCKET>"
    key    = "<BUCKET>/terraform.tfstate"
    region = "<REGION>"
  }
}
**/

provider "aws" {
  version = "~> 2.7.0"
  region  = "eu-west-1"
}


module "sns" {
  #source = "../"
  source = "github.com/imranfawan/terraform-sns?ref=v1.0"
  topic_name = var.topic_name
  sns_role_name = var.sns_role_name
}


```

## Outputs

The SNS topics `notification_target_arn` and `role_arn` are outputted and so can be used as inputs for any modules that need to push to this topic notic. Below is an example of how to use the outputs as in inputs for other modules.

```
  notification_target_arn = module.sns.notification_target_arn
  role_arn                = module.sns.role_arn
```

You may run the module locally by cloning the module and simply assigning the `source` to `../`.
