# Using powershell for challenge 3. 

# I have used Hashtables in powershell to achieve task. As hash tables are in a format like '@{name = value}', but the given inputs are different.
# So, I have taken input as string and converted them to name value pair and nested them one after the other and used the similar technique for key.



# ###################################################### script usage ############################################
# .\c3.ps1 
#      - Object : Mandatory Value, Ex: '{“a”:{“b”:{“c”:”z”}}}}'
#      - key    : Mandatory Value, Ex: 'a/b/c'
# ----------------------------------------------------[OR]--------------------------------------------------------
# Set variables like below and call the fuction with variables
# $object = '{“Vegies”:{“fruit”:{“Apple”:”Mango”}}}}';
# $key = 'Vegies/fruit/Apple';
# challange3 $object $key;
# ################################################################################################################


param

        ([Parameter(Mandatory = $true)] [string] $object,
        [Parameter(Mandatory = $true)] [string] $key

  )

function challange3(){

Param(

        $object,
        $key
)


#Formating the object string to name values pair

$t = $object -split ':{'
$t= $t.replace('{','')
$t= $t.replace('}','')
$t= $t.replace(':','=')
$t= $t.replace('“','')
$t= $t.replace('”','')
[array]::Reverse($t) # For nested hastable
[hashtable]$result = @{} # Empty hastbale


# Nesting is happened here
foreach ($w in $t) { 
         # check if, there is any name value and add it to hash table
         if( $w -match '='){
                    $pos = $w.IndexOf("=")
                    $leftPart = $t[0].Substring(0, $pos)
                    $rightPart = $t[0].Substring($pos+1)
                    #$result.Add($leftPart,$rightPart)
                    $result.Add($leftPart,$rightPart)
                    
                     }                 

                 else {$result = @{ $w = $result }}                  

        }

#Formating the key string to string array so, i can pass value in foreach condition
$key = $key.split("/")

foreach($k in $key)
{
        if ( $k -eq $key[$key.count-1])
        {
               $out=$result.$k | Out-String
               write-host "Value is : $out";
               }
        else
        {
        $result=$result.$k}


}        

}

#fucntion with two parameters
challange3 $object $key;



# Exmples variables 
$object = '{“Vegies”:{“fruit”:{“Apple”:”Mango”}}}}';
$key = 'Vegies/fruit/Apple';

$object = '{“a”:{“b”:{“c”:”z”}}}}';
$key = 'a/b/c';


$object = '{“x”:{“y”:{“z”:”alpha”}}}}';
$key = 'x/y/z';


$object = '{“widget”:{“window”:{“image”:{”text”:”format”}}}}';
$key = 'widget/window/image/text';