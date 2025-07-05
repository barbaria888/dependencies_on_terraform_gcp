# ☁️ terraform-dependency-models-gcp

> A focused Terraform project demonstrating how to model **resource dependencies**—both **implicit** and **explicit**—on **Google Cloud Platform (GCP)**.  
> Built for clarity, precision, and real-world relevance.

---

## 🎯 Project Purpose

This repository illustrates how Terraform manages the order of resource creation using two core approaches:

- 🧩 **Implicit Dependencies** – Automatically inferred through resource references.
- 🔗 **Explicit Dependencies** – Declared using the `depends_on` meta-argument when Terraform cannot infer them from context.

Ideal for cloud engineers, SREs, and IaC practitioners refining their skills in **modular, dependency-aware infrastructure design**.

---

## 🗂️ Folder Structure

├── provider.tf       
├── instance.tf     
├── variables.tf    
├── outputs.tf     
├── external_dependency_storage_bucket.tf    
├── dependency_graph.png    
---

## 🧱 What’s Inside

### ✅ Implicit Dependency Example (`instance.tf`)
- Allocates a **static IP address** (`google_compute_address`)
- Attaches it to a **VM instance** (`google_compute_instance`)
- Terraform detects the dependency via `nat_ip = google_compute_address.vm_static_ip.address`

### ✅ Explicit Dependency Example (`exp.tf`)
- Creates a **Cloud Storage bucket**
- Creates a **second VM instance** that explicitly depends on the bucket
- Enforced using:  
  ```hcl
  depends_on = [google_storage_bucket.example_bucket]
