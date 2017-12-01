# Connectivity Tester Terraform

Implementation of the [Connectivity Tester](http://github.com/ukhomeoffice/connectivity-tester) in terraform

## Example usage:
```hcl-terraform
module "tester" {
  source = "github.com/ukhomeoffice/connectivity-tester-tf"
  user_data = "CHECK_self=127.0.0.1:80 CHECK_google=google.com:80 CHECK_googletls=google.com:443 LISTEN_http=0.0.0.0:80"
}
```