## Test Cases

The test cases for this repo are stored in `tests/tests.tftest.hcl`.
Current features tested:
* Generation of API Connection and existence of a valid connection runtime URL.
* Access policy granting access to a logic app using a system assigned identity.

To run tests locally run `terraform init` and then `terraform test` in the root directory 

When running the tests locally if you encounter issues authenticating the `azapi` provider, try setting the following environment variables:
* `ARM_USE_CLI = "true"`
* `ARM_USE_MSI = "false"`
