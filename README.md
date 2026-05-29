# gcp-terraform-labs

# NextEdge Multi-Region Infrastructure via Terraform

This repository contains the infrastructure-as-code (IaC) configuration for the **NextEdge** platform deployed on Google Cloud Platform (GCP) using Terraform. 

The architecture is designed to be multi-regional, spanning the US, Europe, and Asia to ensure low latency and high availability for localized compute, storage, and database layers.

## Architecture Overview

*   **Networking:** A custom global VPC (`nextedge-vpc`) containing 3 regional subnets (US, Europe, Asia) with a global firewall rule opening ports 80 (HTTP) and 443 (HTTPS) to tagged web services.
*   **Compute:** Three `e2-micro` virtual machine instances distributed across the global subnets, running mixed operating systems (Ubuntu 22.04 LTS and Debian 12).
*   **Storage:** Three Google Cloud Storage (GCS) buckets utilizing uniform bucket-level access across multi-regional (US, EU) and regional (Asia) boundaries.
*   **Databases:** Three managed Cloud SQL instances consisting of two MySQL 8.0 nodes and one PostgreSQL 15 node.

---

## File Structure

```text
├── main.tf          # Core infrastructure resources (VPC, Subnets, VMs, Buckets, SQL)
├── provider.tf      # GCP Provider configurations and required version constraints
└── README.md        # This documentation file