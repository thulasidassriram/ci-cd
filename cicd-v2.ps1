##[Ps1 To Exe]
##
##NcDBCIWOCzWE8pGP3wFk4Fn9fnI/YcSftL+p+KW57OH4tDXlc44bBGFjnyX1EFKBc/sAVLg4scUQURw+LpI=

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName PresentationFramework
[System.Windows.Forms.Application]::EnableVisualStyles()

$PathCurrent=pwd

function startproject
 {

		$Form1                           = New-Object system.Windows.Forms.Form
		$Form1.ClientSize                 = '598,403'
		$Form1.text                       = "Zero Touch Operations"
		$Form1.TopMost                    = $false
		$Icon 							 = New-Object system.drawing.icon ("$PathCurrent\img\fabbi.ico")
		$Form1.Icon 					 = $Icon
		$FormImage						 = [system.drawing.image]::FromFile("$PathCurrent\img\bg1.png")
		$Form1.BackgroundImage			 = $FormImage
		$form1.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen


		$PictureBox1                     = New-Object system.Windows.Forms.PictureBox
		$PictureBox1.width               = 40
		$PictureBox1.height              = 40
		$PictureBox1.location            = New-Object System.Drawing.Point(275,190)
		$PictureBox1.imageLocation       = "$PathCurrent\img\log.png"
		$PictureBox1.SizeMode            = [System.Windows.Forms.PictureBoxSizeMode]::zoom
		$PictureBox1.BackColor			 = "Transparent"

		$Label1                          = New-Object system.Windows.Forms.Label
		$Label1.text                     = "Enter Your Devops Account Details"
		$Label1.AutoSize                 = $true
		$Label1.width                    = 25
		$Label1.height                   = 10
		$Label1.location                 = New-Object System.Drawing.Point(150,155)
		$Label1.Font                     = 'Microsoft Sans Serif,15'
		$Label1.BackColor				 = "Transparent"
		$Label1.ForeColor                = "#ffffff"

			
		$Form1.controls.AddRange(@($PictureBox1,$Label1,$PictureBox2))

		$PictureBox1.Add_Click({ select_sub_screen})

		[void]$Form1.ShowDialog()


}


function select_sub_screen 
 {
		$Form1.close()
		$Form2                           = New-Object system.Windows.Forms.Form
		$Form2.ClientSize                 = '598,403'
		$Form2.text                       = "Zero Touch Operations"
		$Form2.TopMost                    = $false
		$Icon 							 = New-Object system.drawing.icon ("$PathCurrent\img\fabbi.ico")
		$Form2.Icon = $Icon
		$FormImage						 = [system.drawing.image]::FromFile("$PathCurrent\img\bg1.png")
		$Form2.BackgroundImage			 = $FormImage
		$Form2.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen


		$PictureBox2                     = New-Object system.Windows.Forms.PictureBox
		$PictureBox2.width               = 32
		$PictureBox2.height              = 32
		$PictureBox2.location            = New-Object System.Drawing.Point(435,165)
		$PictureBox2.imageLocation       = "$PathCurrent\img\checkbox.png"
		$PictureBox2.SizeMode            = [System.Windows.Forms.PictureBoxSizeMode]::zoom
		$PictureBox2.BackColor			 = "Transparent"

		#$PictureBox2.Add_MouseHover({$PictureBox2.backcolor = [System.Drawing.ColorTranslator]::FromHtml("#7AB800")})

		$Label2                          = New-Object system.Windows.Forms.Label
		$Label2.text                     = "Devops Account Name"
		$Label2.AutoSize                 = $true
		$Label2.width                    = 25
		$Label2.height                   = 10
		$Label2.location                 = New-Object System.Drawing.Point(10,80)
		$Label2.Font                     = 'Microsoft Sans Serif,10'
		$Label2.BackColor				 = "Transparent"
		$Label2.ForeColor                = "#ffffff"


		$textBox 						 = New-Object System.Windows.Forms.TextBox
		$textBox.Location 				 = New-Object System.Drawing.Point(250,80)
		$textBox.width                   = 250
		$textBox.height                  = 20
		$textBox.Font 					 = 'Microsoft Sans Serif,14'
		$textBox.Text 					 = "tintupjoy"
		
		$Label3                          = New-Object system.Windows.Forms.Label
		$Label3.text                     = "Devops Account Key in Base 64"
		$Label3.AutoSize                 = $true
		$Label3.width                    = 25
		$Label3.height                   = 10
		$Label3.location                 = New-Object System.Drawing.Point(10,120)
		$Label3.Font                     = 'Microsoft Sans Serif,10'
		$Label3.BackColor				 = "Transparent"
		$Label3.ForeColor                = "#ffffff"

		$textBox1 						 = New-Object System.Windows.Forms.TextBox
		$textBox1.Location 				 = New-Object System.Drawing.Point(250,120)
		$textBox1.width                  = 250
		$textBox1.height                 = 20
		$textBox1.Font 					 = 'Microsoft Sans Serif,14'
		$textBox1.text                   = "2jzqownmocs2fec5bfxvvf6c37zlqhtwmsjiytvgm7ruy3erjq3q"
		
		$OKButton 						= New-Object System.Windows.Forms.Button
		$OKButton.Location = New-Object System.Drawing.Point(75,120)
		$OKButton.Size = New-Object System.Drawing.Size(75,23)
		$OKButton.Text = 'OK'
		$OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
		$form.AcceptButton = $OKButton
		$form.Controls.Add($OKButton)
		
		$Form2.controls.AddRange(@($PictureBox2,$Label2,$textBox,$Label3,$textBox1))

			#$name 			= $textBox.Text # tintupjoy
			#$personalToken  = $textBox1.Text #"2jzqownmocs2fec5bfxvvf6c37zlqhtwmsjiytvgm7ruy3erjq3q"
			
		if ($result -eq [System.Windows.Forms.DialogResult]::OK)
			{
				$name = $textBox.Text
				$personalToken = $textBox1.Text
				
			}							
        $token = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes(":$($personalToken)"))
		$PictureBox2.Add_Click({ select_sub  })
			 
		  [void]$Form2.ShowDialog()

 }


function select_sub {

		
		$PictureBox2                     = New-Object system.Windows.Forms.PictureBox
		$PictureBox2.width               = 40
		$PictureBox2.height              = 40
		$PictureBox2.location            = New-Object System.Drawing.Point(275,215)
		$PictureBox2.imageLocation       = "$PathCurrent\img\close.png"
		$PictureBox2.SizeMode            = [System.Windows.Forms.PictureBoxSizeMode]::zoom
		$PictureBox2.BackColor			 = "Transparent"
		
		$Form3                           = New-Object system.Windows.Forms.Form
		$Form3.ClientSize                 = '598,403'
		$Form3.text                       = "Zero Touch Operations"
		$Form3.TopMost                    = $false
		$Icon 							 = New-Object system.drawing.icon ("$PathCurrent\img\fabbi.ico")
		$Form3.Icon = $Icon
		$FormImage						 = [system.drawing.image]::FromFile("$PathCurrent\img\bg4.png")
		$Form3.BackgroundImage			 = $FormImage
		$Form3.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen

		$ComboBox1                       = New-Object system.Windows.Forms.ComboBox
		$ComboBox1.text                  = "Choose your projects"
		$ComboBox1.width                 = 300
		$ComboBox1.height                = 20
		$ComboBox1.location              = New-Object System.Drawing.Point(120,165)
		$ComboBox1.Font                  = 'Microsoft Sans Serif,14'
		$ComboBox1.ForeColor             = "#8866a6"

		# To  get all available projects in account
		$header = @{authorization = "Basic $token"
        }

		$url = 'https://dev.azure.com/name/_apis/projects?apiversion=5.1'

		$url = $url.Replace('name',$name)
   
		$result = Invoke-RestMethod $url -Method Get -ContentType "application/json" -Headers $header   
		$availableprojects = $result.Value | select name
		
		Foreach ($ap1 in $availableprojects)
		{
				$ComboBox1.Items.Add($availableprojects.Name);
		} 
		$Form2.close()	 
		$Form3.controls.AddRange(@($ComboBox1,$PictureBox2))
		$PictureBox2.Add_Click({ select_project })
		[void]$Form3.Show()
			
		#C:\Users\tintu.joy\Documents\GitHub\CICDPipelineAutomation\powershellquery.ps1

}

 function select_project
 {
		 if ( $ComboBox1.SelectedItem -eq $null )

			{
			[System.Windows.MessageBox]::Show('Project Not selected. Please select a Project to continue')
			
			select_sub
			}
			else
			{
			$global:projctname1 = $ComboBox1.SelectedItem 
			close_screen
			}
			
		$Form3.close()
		$Form4                           = New-Object system.Windows.Forms.Form
		$Form4.ClientSize                 = '598,403'
		$Form4.text                       = "Zero Touch Operations"
		$Form4.TopMost                    = $false
		$Icon 							 = New-Object system.drawing.icon ("$PathCurrent\img\fabbi.ico")
		$Form4.Icon = $Icon
		$FormImage						 = [system.drawing.image]::FromFile("$PathCurrent\img\bg4.png")
		$Form4.BackgroundImage			 = $FormImage
		$Form4.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen

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
		$Label2.text                     = "Window will automatically close in 5 seconds"
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
		$PictureBox2.imageLocation       = "$PathCurrent\img\close.png"
		$PictureBox2.SizeMode            = [System.Windows.Forms.PictureBoxSizeMode]::zoom
		$PictureBox2.BackColor			 = "Transparent"


		$Form4.controls.AddRange(@($Label1,$Label2,$PictureBox2))
			 $PictureBox2.Add_Click({ close_screen })
			[void]$Form4.Show()
			start-sleep 5
			$Form4.close()
			close_project
 }
 
 function close_screen

 {
 
		$Form4.close()
 #remove_data
 }

startproject


#commented line