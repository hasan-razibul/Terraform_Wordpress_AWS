## Terraform : Wordpress on aws Lightsail

I made this terraform project to deploy wordpress on aws lightsail. 

All the variables e.g region, blueprint selection is in the variables.tf file. Change those variables accordingly to your preferences. <br>

#### Terraform commands to run - <br>
terraform init <br>
terraform plan <br>
terraform apply <br>

After successful execution, the commandline/terminal output will show the public ip for the lightsail instance. Lightsail takes a bit of time to initialize everything. When everything is completed after some time, visit http://"public ip"/wp-admin to start wordpress.

