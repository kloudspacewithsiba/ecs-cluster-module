# ECS Cluster Terraform Module

This Terraform module is designed to simplify the creation of an ECS (Elastic Container Service) cluster on AWS (Amazon Web Services). The module facilitates the setup of essential configurations and resources required for managing containers efficiently within the ECS cluster environment.

## Features

- **ECS Cluster Configuration:** Sets up an ECS cluster with a specified name.
- **Container Insights:** Enables or disables AWS CloudWatch Container Insights for monitoring and analyzing containerized applications within the ECS cluster.
- **Execute Command Configuration:** Configures the execution command settings for ECS tasks, including encryption and logging to CloudWatch Logs.
- **CloudWatch Log Group:** Creates a CloudWatch Log Group for storing ECS container logs.
- **Key Management Service (KMS) Key:** Creates a KMS key for encryption purposes with a defined deletion window.
- **Capacity Providers:** Configures ECS capacity providers, specifying Fargate as the default provider with associated strategies.
- **ECR Repository:** Sets up an Elastic Container Registry (ECR) repository for storing Docker images associated with the ECS cluster, with options for image tag mutability, force deletion, and image scanning configurations.

## Usage

1. **Module Invocation:**

    ```hcl
    module "ecs_cluster" {
      source                     = "git::https://github.com/your-username/ecs-cluster-module.git"
      cluster_name               = "my-ecs-cluster"
      enable_container_insights  = true
      ecr_repository_settings = {
        image_tag_mutability          = "IMMUTABLE"
        force_delete                  = false
        image_scanning_configuration = true
      }
    }
    ```

2. **Variables:**

   - `cluster_name`: Name for the ECS cluster.
   - `enable_container_insights`: Boolean value to enable or disable AWS CloudWatch Container Insights.
   - `ecr_repository_settings`: Object containing settings for ECR repository, including `image_tag_mutability`, `force_delete`, and `image_scanning_configuration`.

3. **Outputs:**

   - `cluster_name`: Name of the created ECS cluster.
   - `cluster_id`: ID of the created ECS cluster.

## Requirements

- AWS Provider: Ensure the AWS provider is configured properly in your Terraform environment.

**Note:**

- This module assumes you have appropriate IAM permissions to create and manage resources on AWS.
- Make sure to review and adjust the settings according to your specific requirements before applying the Terraform configuration.

## Contributing

Contributions are welcome! If you encounter any issues or have suggestions for improvements, feel free to open an issue or submit a pull request.

## License

This module is licensed under the MIT License. See the LICENSE file for details.

## Author

[Your Name] - [Your Email]

## Repository

[Link to your GitHub repository]
