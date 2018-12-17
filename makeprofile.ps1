# load data
$data=Import-Csv -Path .\vpnlist.csv -Encoding UTF8

foreach($d in $data){
    # load template
    $temp=Get-Content .\vpn.template -Encoding UTF8

    # merge template
    $temp=$temp -replace '{AuthName}',$d.AuthName
    $temp=$temp -replace '{AuthPassword}',$d.AuthPassword

    $file=$d.AuthName+'.mobileconfig'

    # output newfile
    $temp | out-file -FilePath $file -Encoding utf8
}