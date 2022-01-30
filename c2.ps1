# Using powershell for challenge 2. 

# Came across the article(https://docs.aws.amazon.com/powershell/latest/reference/items/Get-EC2InstanceMetadata.html ) from AWS vendor
# that metadata of an instance can also be broght from powershell cmdlets like IMDSv1 or IMDSv2 using curl.


# ###################################################### script usage ############################################
#
#      .\c2.ps1
#
# Note : Login into AWS ec2 instance either windows/linux with AWS CLI. If it is linux install pwsh module and 
# then install AWS CLI Module     
# ################################################################################################################



# Command to get the Categories of metadata and save it in a file
Get-EC2InstanceMetadata -ListCategory >> content.txt

# Creating a emplty folder for saving the json values
Add-Content ./name.json "{"

#Read Category data to a variable
$data = Get-Content -Path ./content.txt

# Run Get-EC2InstanceMetadata -Category for each category and convert the data to json format and append it to file
foreach($d in $data)
{
    $command = {Get-EC2InstanceMetadata -Category $d}
    $result = Invoke-Command -ScriptBlock $command

        #Check if there are any nested key value pair
        if($result -like '{*'){
            $result = $result
            }
         else {
         # Converting the results to json
          $result = $result | ConvertTo-Json
         }


$out="`"$d`" : $result,"
Add-Content ./name.json $out # Appending the results to name.json

} 
Add-Content ./name.json "}"

# Display the content in json format.
cat ./name.json