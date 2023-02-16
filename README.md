# running the WebGoat project on EKS

# create the infrastructure

```
cd terraform
terraform init
terraform plan
terraform apply
```

you need to have an active AWS account, you'll also need to create an IAM user with enough permissions to allow terraform perform the creation of the necessary resources.

This is the simplest way to create the environment (here only staging is created).

In real world, you should think of using Terraform Cloud (or Terraform Entreprise), this will enable team working on the same repository, it is more secure when it comes to share credentials.

In an ideal situation we should follow the zero trust approach, to achieve this you should use a tool like teleport in combination of okta for example to only allow trusted people with lowest level privileges.


# build the project

A github action is provided, it allows the build then the push of the docker image into AWS ECR, it also sends notifications on slack.

# deploy to EKS

simple deployment manifests are available, they allow the deployment of the following 

* namespace logging : fluentd as Daemonset which pushs the logs into cloudwatch
* namespace nginx   : nginx is the ingress controller
* namespace webgoat : this is our application

# scaling the application

we can consider the following 

* HPA , Karpenter
* use message brokers to collect logs and metrics

# Metrics

we can deploy prometheus to scrape metrics and push them to an ELK stack. we can then grafana for visualization

# gitops

instead of using `kubectl` command to deploy application it would be better to use git as source of truth for the deployment of the application. We can consider using argoCD or fluxCD, these tools will auto consolidate monitored clusters with the content found in the corresponding git repository.