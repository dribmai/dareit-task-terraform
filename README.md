# cloud_challenge - task_7

> The goal of this task was to create **CI/CD pipeline** and understand the principles of the CI/CD practice.

<br>

### introductory part of the task:
> Every time you **commit** to your repository that holds terraform code, a pipeline will be triggered that will contain a few steps like running `terraform plan` or `terraform apply` steps.

1. Create a **Service Account** for Terraform.
2. Download a file contain the **private key in JSON**.
3. Create a bucket in which we will store the terraform state file.
4. Create a new repository in Github (this one) and create **secret** with key from step 2.
5. Put prepared code into created files: `backend.tf`, `provider.tf` and `main.tf`.
6. Create file (using prepared code) with the definition of the pipeline - **.github/workflows/**`terraform.yml`
7. Commit all files to the repo and push the change to the remote repository - check the **Actions** tab in your repository and see the workflows.


### the right part of the task:
> Modify the workflow so that the job will only be triggered whenever a new **pull request** is opened.

1. Change some part of code in `terraform.yml` from:
```yaml
on:
  push:
    branches:
    - main
```
to:
```yaml
on:
  pull_request:
```
2. Create a branch called `feat/add-bucket`.
3. On the new branch modify the code of the `main.tf` to add a new bucket, add this part:
```terraform
resource "google_storage_bucket" "bucket" {
  name          = "task_7_terraform_ci"
  project       = "data-tangent-378423"
  storage_class = "standard"
  location      = "EU"
}
```
5. Open a **pull request** and look at the actions