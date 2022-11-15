# How to run
### **Configure AWS credentials**
<br>

    aws configure
<br>

### **Terraform init and apply**
<br>

    terraform init

    terraform apply -auto-approve
<br>

### **Update kubeconfig context**

    aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)