executeSls () {
   pwd
   sls remove --stage $1
}

cd api/
executeSls $1
cd ../bookings-consumer/
executeSls $1
cd ../sms-notification/
executeSls $1
cd ../email-notification
executeSls $1

cd ../terraform/environments/$1
pwd
terraform destroy -auto-approve 
