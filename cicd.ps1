##[Ps1 To Exe]
##
##NcDBCIWOCzWE8pGP3wFk4Fn9fnI/YcSftL+p+KW57OH4tDXlc44bBGFjnyX1EFKBc/sAVLg4scUQURw+LpI=

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName PresentationFramework
[System.Windows.Forms.Application]::EnableVisualStyles()


function startproject
 {

$Form1                           = New-Object system.Windows.Forms.Form
$Form1.ClientSize                 = '598,403'
$Form1.text                       = "Zero Touch Operations"
$Form1.TopMost                    = $false
$Icon 							 = New-Object system.drawing.icon (".\img\fabbi.ico")
$Form1.Icon = $Icon
$FormImage						 = [system.drawing.image]::FromFile(".\img\zto-bg1.png")
$Form1.BackgroundImage			 = $FormImage
$form1.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen


$PictureBox1                     = New-Object system.Windows.Forms.PictureBox
$PictureBox1.width               = 40
$PictureBox1.height              = 40
$PictureBox1.location            = New-Object System.Drawing.Point(275,190)
$PictureBox1.imageLocation       = ".\img\log.png"
$PictureBox1.SizeMode            = [System.Windows.Forms.PictureBoxSizeMode]::zoom
$PictureBox1.BackColor			 = "Transparent"

$PictureBox2                     = New-Object system.Windows.Forms.PictureBox
$PictureBox2.width               = 350
$PictureBox2.height              = 55
$PictureBox2.location            = New-Object System.Drawing.Point(110,325)
$PictureBox2.imageLocation       = ".\img\bar1.png"
$PictureBox2.SizeMode            = [System.Windows.Forms.PictureBoxSizeMode]::zoom
$PictureBox2.BackColor			 = "Transparent"
	

$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "Enter Your Devops Account Name"
$Label1.AutoSize                 = $true
$Label1.width                    = 25
$Label1.height                   = 10
$Label1.location                 = New-Object System.Drawing.Point(150,155)
$Label1.Font                     = 'Microsoft Sans Serif,15'
$Label1.BackColor				 = "Transparent"
$Label1.ForeColor                = "#ffffff"

	
$Form1.controls.AddRange(@($PictureBox1,$Label1,$PictureBox2))

$PictureBox1.Add_Click({ AccountDetails  })

[void]$Form1.ShowDialog()


}

function AccountDetails 
{	
    select_sub_screen
	 
 }


function select_sub_screen 
 {
	$Form1.close()

$Form                           = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '598,403'
$Form.text                       = "Zero Touch Operations"
$Form.TopMost                    = $false
$Icon 							 = New-Object system.drawing.icon (".\img\fabbi.ico")
$Form.Icon = $Icon
$FormImage						 = [system.drawing.image]::FromFile(".\img\zto-bg1.png")
$Form.BackgroundImage			 = $FormImage
$form.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen


$PictureBox2                     = New-Object system.Windows.Forms.PictureBox
$PictureBox2.width               = 32
$PictureBox2.height              = 32
$PictureBox2.location            = New-Object System.Drawing.Point(435,165)
$PictureBox2.imageLocation       = ".\img\checkbox.png"
$PictureBox2.SizeMode            = [System.Windows.Forms.PictureBoxSizeMode]::zoom
$PictureBox2.BackColor			 = "Transparent"
#$PictureBox2.Add_MouseHover({$PictureBox2.backcolor = [System.Drawing.ColorTranslator]::FromHtml("#7AB800")})

$textBox 						 = New-Object System.Windows.Forms.TextBox
$textBox.Location 				 = New-Object System.Drawing.Point(10,40)
$textBox.width                   = 300
$textBox.height                  = 20
$textBox.Font 					 = 'Microsoft Sans Serif,14'
$Form.Controls.Add($textBox)

$textBox1 						 = New-Object System.Windows.Forms.TextBox
$textBox1.Location 				 = New-Object System.Drawing.Point(10,40)
$textBox1.width                  = 300
$textBox1.height                 = 20
$textBox1.Font 					 = 'Microsoft Sans Serif,14'

$PictureBox3                     = New-Object system.Windows.Forms.PictureBox
$PictureBox3.width               = 350
$PictureBox3.height              = 55
$PictureBox3.location            = New-Object System.Drawing.Point(110,325)
$PictureBox3.imageLocation       = ".\img\bar2.png"
$PictureBox3.SizeMode            = [System.Windows.Forms.PictureBoxSizeMode]::zoom
$PictureBox3.BackColor			 = "Transparent"


$Form.controls.AddRange(@($PictureBox2,$PictureBox3,$textBox))

  $sub = Get-AzureRmSubscription  | select Name
    Foreach ($sub1 in $sub)
     {
        $ComboBox1.Items.Add($sub1.Name);
     }    
$PictureBox2.Add_Click({ select_sub  })
	 
  [void]$Form.ShowDialog()
	$form.close()
  
 }


function select_sub {

    if ( $ComboBox1.SelectedItem -eq $null )

	{
	[System.Windows.MessageBox]::Show('Subscription Not selected. Please select a subscription to continue')
	
	select_sub_screen
	}
	else
	{
	Select-AzureRmSubscription -Subscription $ComboBox1.SelectedItem -Force
	load
	}

	
}

function load 
 {	
 $form.close()
$Form                           = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '598,403'
$Form.text                       = "Zero Touch Operations"
$Form.TopMost                    = $false
$Icon 							 = New-Object system.drawing.icon (".\img\fabbi.ico")
$Form.Icon = $Icon
$FormImage						 = [system.drawing.image]::FromFile(".\img\zto-bg1.png")
$Form.BackgroundImage			 = $FormImage
$form.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen

$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "See Your Installation Progress Here"
$Label1.AutoSize                 = $true
$Label1.width                    = 25
$Label1.height                   = 10
$Label1.location                 = New-Object System.Drawing.Point(120,155)
$Label1.Font                     = 'Microsoft Sans Serif,16'
$Label1.ForeColor                = "#ffffff"
$Label1.BackColor				 = "Transparent"

$ProgressBar1                    = New-Object system.Windows.Forms.ProgressBar
$ProgressBar1.width              = 350
$ProgressBar1.height             = 20
$ProgressBar1.location           = New-Object System.Drawing.Point(120,200)

#$PictureBox3                     = New-Object system.Windows.Forms.PictureBox
#$PictureBox3.width               = 350
#$PictureBox3.height              = 55
#$PictureBox3.location            = New-Object System.Drawing.Point(110,325)
#$PictureBox3.imageLocation       = ".\img\bar3.png"
#$PictureBox3.SizeMode            = [System.Windows.Forms.PictureBoxSizeMode]::zoom
#$PictureBox3.BackColor			 = "Transparent"

$Form.controls.AddRange(@($ProgressBar1,$Label1))
[void]$form.Show()
#Requires -RunAsAdministrator
	<#	
	$ResourceGroup = "ZTO-rg"
	$AutomationAccountName = "ZTO-Automation-Account"
	$ApplicationDisplayName = "ZTO-Automation-Account-app-test"
	$SubId = Get-AzureRmSubscription -SubscriptionName $ComboBox1.SelectedItem | select Id
	$SubscriptionId = $SubId.Id 
	$CreateClassicRunAsAccount = $true
	$SelfSignedCertPlainPassword = "Nj8KrrG3gBT82Y5thrxNRmLeMMr7sf"
    $EnterpriseCertPathForRunAsAccount
    $EnterpriseCertPlainPasswordForRunAsAccount
    $EnterpriseCertPathForClassicRunAsAccount
    $EnterpriseCertPlainPasswordForClassicRunAsAccount
    $EnvironmentName = "AzureCloud"
	$SelfSignedCertNoOfMonthsUntilExpired = 12
	New-AzureRmAutomationAccount -ResourceGroupName $ResourceGroup -Name $AutomationAccountName -Location 'West Europe'
	Start-Sleep -s 15 

function CreateSelfSignedCertificate([string] $certificateName, [string] $selfSignedCertPlainPassword,
    [string] $certPath, [string] $certPathCer, [string] $selfSignedCertNoOfMonthsUntilExpired ) {
    $Cert = New-SelfSignedCertificate -DnsName $certificateName -CertStoreLocation cert:\LocalMachine\My `
        -KeyExportPolicy Exportable -Provider "Microsoft Enhanced RSA and AES Cryptographic Provider" `
        -NotAfter (Get-Date).AddMonths($selfSignedCertNoOfMonthsUntilExpired) -HashAlgorithm SHA256

    $CertPassword = ConvertTo-SecureString $selfSignedCertPlainPassword -AsPlainText -Force
    Export-PfxCertificate -Cert ("Cert:\localmachine\my\" + $Cert.Thumbprint) -FilePath $certPath -Password $CertPassword -Force | Write-Verbose
    Export-Certificate -Cert ("Cert:\localmachine\my\" + $Cert.Thumbprint) -FilePath $certPathCer -Type CERT | Write-Verbose
}

function CreateServicePrincipal([System.Security.Cryptography.X509Certificates.X509Certificate2] $PfxCert, [string] $applicationDisplayName) {  
    $keyValue = [System.Convert]::ToBase64String($PfxCert.GetRawCertData())
    $keyId = (New-Guid).Guid

    # Create an Azure AD application, AD App Credential, AD ServicePrincipal

    # Requires Application Developer Role, but works with Application administrator or GLOBAL ADMIN
    $Application = New-AzureRmADApplication -DisplayName $ApplicationDisplayName -HomePage ("http://" + $applicationDisplayName) -IdentifierUris ("http://" + $keyId) 
    # Requires Application administrator or GLOBAL ADMIN
    $ApplicationCredential = New-AzureRmADAppCredential -ApplicationId $Application.ApplicationId -CertValue $keyValue -StartDate $PfxCert.NotBefore -EndDate $PfxCert.NotAfter
    # Requires Application administrator or GLOBAL ADMIN
    $ServicePrincipal = New-AzureRMADServicePrincipal -ApplicationId $Application.ApplicationId 
    $GetServicePrincipal = Get-AzureRmADServicePrincipal -ObjectId $ServicePrincipal.Id

    # Sleep here for a few seconds to allow the service principal application to become active (ordinarily takes a few seconds)
    Sleep -s 15
    # Requires User Access Administrator or Owner.
    $NewRole = New-AzureRMRoleAssignment -RoleDefinitionName Contributor -ServicePrincipalName $Application.ApplicationId -ErrorAction SilentlyContinue
    $Retries = 0;
    While ($NewRole -eq $null -and $Retries -le 6) {
        Sleep -s 10
        New-AzureRMRoleAssignment -RoleDefinitionName Contributor -ServicePrincipalName $Application.ApplicationId | Write-Verbose -ErrorAction SilentlyContinue
        $NewRole = Get-AzureRMRoleAssignment -ServicePrincipalName $Application.ApplicationId -ErrorAction SilentlyContinue
        $Retries++;
    }
    return $Application.ApplicationId.ToString();
}

function CreateAutomationCertificateAsset ([string] $resourceGroup, [string] $automationAccountName, [string] $certifcateAssetName, [string] $certPath, [string] $certPlainPassword, [Boolean] $Exportable) {
    $CertPassword = ConvertTo-SecureString $certPlainPassword -AsPlainText -Force   
    Remove-AzureRmAutomationCertificate -ResourceGroupName $resourceGroup -AutomationAccountName $automationAccountName -Name $certifcateAssetName -ErrorAction SilentlyContinue
    New-AzureRmAutomationCertificate -ResourceGroupName $resourceGroup -AutomationAccountName $automationAccountName -Path $certPath -Name $certifcateAssetName -Password $CertPassword -Exportable:$Exportable  | write-verbose
}

function CreateAutomationConnectionAsset ([string] $resourceGroup, [string] $automationAccountName, [string] $connectionAssetName, [string] $connectionTypeName, [System.Collections.Hashtable] $connectionFieldValues ) {
    Remove-AzureRmAutomationConnection -ResourceGroupName $resourceGroup -AutomationAccountName $automationAccountName -Name $connectionAssetName -Force -ErrorAction SilentlyContinue
    New-AzureRmAutomationConnection -ResourceGroupName $ResourceGroup -AutomationAccountName $automationAccountName -Name $connectionAssetName -ConnectionTypeName $connectionTypeName -ConnectionFieldValues $connectionFieldValues
}

Import-Module AzureRM.Profile
Import-Module AzureRM.Resources

$AzureRMProfileVersion = (Get-Module AzureRM.Profile).Version
if (!(($AzureRMProfileVersion.Major -ge 3 -and $AzureRMProfileVersion.Minor -ge 4) -or ($AzureRMProfileVersion.Major -gt 3))) {
    Write-Error -Message "Please install the latest Azure PowerShell and retry. Relevant doc url : https://docs.microsoft.com/powershell/azureps-cmdlets-docs/ "
    return
}

# To use the new Az modules to create your Run As accounts please uncomment the following lines and ensure you comment out the previous two lines to avoid any issues. To learn about about using Az modules in your Automation Account see https://docs.microsoft.com/azure/automation/az-modules

# Import-Module Az.Automation
# Enable-AzureRmAlias 


# Create a Run As account by using a service principal
$CertifcateAssetName = "AzureRunAsCertificate"
$ConnectionAssetName = "AzureRunAsConnection"
$ConnectionTypeName = "AzureServicePrincipal"

if ($EnterpriseCertPathForRunAsAccount -and $EnterpriseCertPlainPasswordForRunAsAccount) {
    $PfxCertPathForRunAsAccount = $EnterpriseCertPathForRunAsAccount
    $PfxCertPlainPasswordForRunAsAccount = $EnterpriseCertPlainPasswordForRunAsAccount
}
else {
    $CertificateName = $AutomationAccountName + $CertifcateAssetName
    $PfxCertPathForRunAsAccount = Join-Path $env:TEMP ($CertificateName + ".pfx")
    $PfxCertPlainPasswordForRunAsAccount = $SelfSignedCertPlainPassword
    $CerCertPathForRunAsAccount = Join-Path $env:TEMP ($CertificateName + ".cer")
    CreateSelfSignedCertificate $CertificateName $PfxCertPlainPasswordForRunAsAccount $PfxCertPathForRunAsAccount $CerCertPathForRunAsAccount $SelfSignedCertNoOfMonthsUntilExpired
}

# Create a service principal
$PfxCert = New-Object -TypeName System.Security.Cryptography.X509Certificates.X509Certificate2 -ArgumentList @($PfxCertPathForRunAsAccount, $PfxCertPlainPasswordForRunAsAccount)
$ApplicationId = CreateServicePrincipal $PfxCert $ApplicationDisplayName

# Create the Automation certificate asset
CreateAutomationCertificateAsset $ResourceGroup $AutomationAccountName $CertifcateAssetName $PfxCertPathForRunAsAccount $PfxCertPlainPasswordForRunAsAccount $true

# Populate the ConnectionFieldValues
$SubscriptionInfo = Get-AzureRmSubscription -SubscriptionId $SubscriptionId
$TenantID = $SubscriptionInfo | Select TenantId -First 1
$Thumbprint = $PfxCert.Thumbprint
$ConnectionFieldValues = @{"ApplicationId" = $ApplicationId; "TenantId" = $TenantID.TenantId; "CertificateThumbprint" = $Thumbprint; "SubscriptionId" = $SubscriptionId}

# Create an Automation connection asset named AzureRunAsConnection in the Automation account. This connection uses the service principal.
CreateAutomationConnectionAsset $ResourceGroup $AutomationAccountName $ConnectionAssetName $ConnectionTypeName $ConnectionFieldValues

if ($CreateClassicRunAsAccount) {
    # Create a Run As account by using a service principal
    $ClassicRunAsAccountCertifcateAssetName = "AzureClassicRunAsCertificate"
    $ClassicRunAsAccountConnectionAssetName = "AzureClassicRunAsConnection"
    $ClassicRunAsAccountConnectionTypeName = "AzureClassicCertificate "
    $UploadMessage = "Please upload the .cer format of #CERT# to the Management store by following the steps below." + [Environment]::NewLine +
    "Log in to the Microsoft Azure portal (https://portal.azure.com) and select Subscriptions -> Management Certificates." + [Environment]::NewLine +
    "Then click Upload and upload the .cer format of #CERT#"

    if ($EnterpriseCertPathForClassicRunAsAccount -and $EnterpriseCertPlainPasswordForClassicRunAsAccount ) {
        $PfxCertPathForClassicRunAsAccount = $EnterpriseCertPathForClassicRunAsAccount
        $PfxCertPlainPasswordForClassicRunAsAccount = $EnterpriseCertPlainPasswordForClassicRunAsAccount
        $UploadMessage = $UploadMessage.Replace("#CERT#", $PfxCertPathForClassicRunAsAccount)
    }
    else {
        $ClassicRunAsAccountCertificateName = $AutomationAccountName + $ClassicRunAsAccountCertifcateAssetName
        $PfxCertPathForClassicRunAsAccount = Join-Path $env:TEMP ($ClassicRunAsAccountCertificateName + ".pfx")
        $PfxCertPlainPasswordForClassicRunAsAccount = $SelfSignedCertPlainPassword
        $CerCertPathForClassicRunAsAccount = Join-Path $env:TEMP ($ClassicRunAsAccountCertificateName + ".cer")
        $UploadMessage = $UploadMessage.Replace("#CERT#", $CerCertPathForClassicRunAsAccount)
        CreateSelfSignedCertificate $ClassicRunAsAccountCertificateName $PfxCertPlainPasswordForClassicRunAsAccount $PfxCertPathForClassicRunAsAccount $CerCertPathForClassicRunAsAccount $SelfSignedCertNoOfMonthsUntilExpired
    }

    # Create the Automation certificate asset
    CreateAutomationCertificateAsset $ResourceGroup $AutomationAccountName $ClassicRunAsAccountCertifcateAssetName $PfxCertPathForClassicRunAsAccount $PfxCertPlainPasswordForClassicRunAsAccount $false

    # Populate the ConnectionFieldValues
    $SubscriptionName = $subscription.Subscription.Name
    $ClassicRunAsAccountConnectionFieldValues = @{"SubscriptionName" = $SubscriptionName; "SubscriptionId" = $SubscriptionId; "CertificateAssetName" = $ClassicRunAsAccountCertifcateAssetName}

    # Create an Automation connection asset named AzureRunAsConnection in the Automation account. This connection uses the service principal.
    CreateAutomationConnectionAsset $ResourceGroup $AutomationAccountName $ClassicRunAsAccountConnectionAssetName $ClassicRunAsAccountConnectionTypeName   $ClassicRunAsAccountConnectionFieldValues

    }
	Sleep -s 10
	#>
	
	$path=get-content ".\variables\path.txt"
	$name=get-content ".\variables\name.txt"
	$rule=get-content ".\variables\rules.json"
	$au_rule=$rule
	$i=0
	do
	{
		$percent_complete=(($i+1)/($path.count))*100
		Import-AzureRmAutomationRunbook -AutomationAccountName ZTO-Automation-Account -Path $path[$i] -ResourceGroupName ZTO-rg -Type PowerShell -Name $name[$i]
        Publish-AzureRmAutomationRunbook -AutomationAccountName ZTO-Automation-Account -Name $name[$i] -ResourceGroupName ZTO-rg
        $res=New-AzureRmAutomationWebhook -AutomationAccountName ZTO-Automation-Account -ExpiryTime 10/2/2025 -IsEnabled $true -Name $name[$i] -ResourceGroupName ZTO-rg -RunbookName $name[$i] -Force | select WebhookURI
		$au_rule = $au_rule.Replace($name[$i] , $res.WebhookURI )
        $au_rule | Out-File -FilePath ".\Jira-Metadata\automation-rules.json"
		$progressbar1.Value = $percent_complete
		$form.refresh()
        $i=$i+1
	}while  ($i -le $path.count-1)


 
    
close_project
    
 }

 function close_project
 {
$form.close()
$Form                           = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '598,403'
$Form.text                       = "Zero Touch Operations"
$Form.TopMost                    = $false
$Icon 							 = New-Object system.drawing.icon (".\img\fabbi.ico")
$Form.Icon = $Icon
$FormImage						 = [system.drawing.image]::FromFile(".\img\zto-bg1.png")
$Form.BackgroundImage			 = $FormImage
$form.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen

$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "Hurray!! ZTO Setup Complete"
$Label1.AutoSize                 = $true
$Label1.width                    = 25
$Label1.height                   = 10
$Label1.location                 = New-Object System.Drawing.Point(150,140)
$Label1.Font                     = 'Microsoft Sans Serif,16'
$Label1.ForeColor                = "#ffffff"
$Label1.BackColor				 = "Transparent"

$Label2                          = New-Object system.Windows.Forms.Label
$Label2.text                     = "You can now close the window"
$Label2.AutoSize                 = $true
$Label2.width                    = 25
$Label2.height                   = 10
$Label2.location                 = New-Object System.Drawing.Point(160,170)
$Label2.Font                     = 'Microsoft Sans Serif,14'
$Label2.ForeColor                = "#ffffff"
$Label2.BackColor				 = "Transparent"


$PictureBox2                     = New-Object system.Windows.Forms.PictureBox
$PictureBox2.width               = 40
$PictureBox2.height              = 40
$PictureBox2.location            = New-Object System.Drawing.Point(275,215)
$PictureBox2.imageLocation       = ".\img\close.png"
$PictureBox2.SizeMode            = [System.Windows.Forms.PictureBoxSizeMode]::zoom
$PictureBox2.BackColor			 = "Transparent"

$PictureBox3                     = New-Object system.Windows.Forms.PictureBox
$PictureBox3.width               = 350
$PictureBox3.height              = 55
$PictureBox3.location            = New-Object System.Drawing.Point(110,325)
$PictureBox3.imageLocation       = ".\img\bar4.png"
$PictureBox3.SizeMode            = [System.Windows.Forms.PictureBoxSizeMode]::zoom
$PictureBox3.BackColor			 = "Transparent"

$Form.controls.AddRange(@($Label1,$Label2,$PictureBox2,$PictureBox3))
     $PictureBox2.Add_Click({ close_screen })
	 [void]$Form.Show()
 }
 function close_screen

 {
 $form.close()
 remove_data
 }


 function remove_data
 {
 Remove-Item -Path .\img -Force -Recurse
  Remove-Item -Path .\scripts -Force -Recurse
   Remove-Item -Path .\variables -Force -Recurse
   
 }


startproject


#commented line