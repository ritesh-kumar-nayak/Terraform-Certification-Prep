/* 
This var file will be auto-loaded as we have named it as "app.auto.tfvars"
and we don't need to use -var-file argument at terraform apply command.

we'll be taking "instance_count" from terraform.tfvars file

"terraform.tfvars" get autoloaded by defualt and we have named this file as "app.auto.tfvars" so it will be
auto-loaded as well.

So it just eliminates this "-var-file=file_name" argument at the CLI
*/

instance_type="t2.medium"
#instance_count = 4