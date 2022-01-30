Using terraform for Challenge 1.


Terraform has a facility to pass variables or varfiles when running init or apply command. So, I have statefile variables and Env variables saved in different location for different enviornments. 



Whenever I want to build Env for DEV/UAT/Prod, i can use below command for running it. so it creates a infrastructure with name+ENV(as suffix/prefix). This also manages different statefile for different ENVs.

Commands :

	Dev:
		 Apply:		 
		 terraform init -backend-config=environments/dev-backend.tfvars
		 terraform apply -auto-approve -var-file=environments/dev.tfvars
		 
		 Destory:
		 terraform init -backend-config=environments/dev-backend.tfvars
		 terraform destroy -auto-approve -var-file=environments/dev.tfvars
		 
	UAT:
		 Apply:		 
		 terraform init -backend-config=environments/UAT-backend.tfvars
		 terraform apply -auto-approve -var-file=environments/UAT.tfvars
		 
		 Destory:
		 terraform init -backend-config=environments/UAT-backend.tfvars
		 terraform destroy -auto-approve -var-file=environments/UAT.tfvars
		 
	Prod:
		 Apply:		 
		 terraform init -backend-config=environments/dev-backend.tfvars
		 terraform apply -auto-approve -var-file=environments/dev.tfvars
		 
		 Destory:
		 terraform init -backend-config=environments/dev-backend.tfvars
		 terraform destroy -auto-approve -var-file=environments/dev.tfvars

 

 