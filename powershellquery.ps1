# To  get all available projects in account
$headers = @{
    'Authorization' = 'Basic OjJqenFvd25tb2NzMmZlYzViZnh2dmY2YzM3emxxaHR3bXNqaXl0dmdtN3J1eTNlcmpxM3E='
    'ContentType' = 'application/json'
}
$url= 'https://dev.azure.com/tintupjoy/_apis/projects?apiversion=5.1'

(Invoke-RestMethod -Uri $url -Method Get -Headers $headers).Value | select name

# to get the endpoints
$url1= 'https://dev.azure.com/tintupjoy/Newtest/_apis/serviceendpoint/endpoints?endpointNames=NewTestServicePrinciple'

(Invoke-RestMethod -Uri $url1 -Method Get -Headers $headers).Value | select name


# to create Build pipeline
$buildurl2 = 'https://dev.azure.com/tintupjoy/Newtest/_apis/build/definitions?api-version=5.1'

$buildpipelinename2 = "BuildPipelinefrompostman-v6"

$body2 = Get-Content .\buildpipelinebody.json -Force

$body2 = $body2.Replace('buildpipelinename',$buildpipelinename2)

Invoke-RestMethod -Uri $buildurl2 -Method Post -Headers $headers -Body $body2 -ContentType 'application/json'

# to create release pipeline

$releaseurl3 =  'https://vsrm.dev.azure.com/tintupjoy/Newtest/_apis/release/definitions?api-version=5.1'

$releasepipelinename3 = "ReleasePipelinefrompostman-v6"

$body3 = Get-Content .\releasepipelinebody.json -Force

$body3 = $body3.Replace('releasepipelinename',$releasepipelinename3)

Invoke-RestMethod -Uri $releaseurl3 -Method Post -Headers $headers -Body $body3 -ContentType 'application/json'