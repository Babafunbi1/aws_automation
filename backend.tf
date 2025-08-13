terraform {
  backend "s3" {
    bucket         = "babafunbi-test-cli-bucket"   
    key            = "global/mystatefile/terraform.tfstate" 
    region         = "us-east-1"                  
    dynamodb_table = "dynamodb_terraform"       
    encrypt        = true                     
  }
}
