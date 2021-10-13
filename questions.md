## Technical Assement Questions

1. How long did you spend on the coding test? What would you add to your solution if you had more time? If you didn't spend much time on the coding test then use this as an opportunity to explain what you would add.

  * I spent around 3-4 hours to solve this challenge. 

# In case I had more time I would have :

  1. Modularize the whole code
  2. Create A Jenkins pipeline with agent on Ec2 instance to build and update website as and when change is pushed
  3. Current websites are test pages, I could have installed php and could have rendered beautiful webpages
  4. Create an eks cluster, built a docker image and deployed a pod, exposed it as service

2. Why did you choose the language you used for the coding test?
- I used Terraform as its compatible across major cloud providers.

3. What was the most useful feature that was added to the latest version of your chosen language?
- Terraform 0.14 has one of the useful feature added, which is In Terraform v0.13 and earlier, the terraform init command would always install the newest version of any provider in the configuration that would meet the configured version constraints. To better meet that goal, Terraform v0.14 introduces a new dependency lock file, which Terraform will generate automatically after running terraform init in the same directory as your configuration's root module. This file includes the specific version numbers selected for each provider, and also includes the package checksums for the selected version to help ensure that the provider packages you depend on are not changed in-place upstream, whether accidentally or maliciously.