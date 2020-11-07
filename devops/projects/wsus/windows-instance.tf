resource "aws_key_pair" "mykey" {
  key_name   = "mykey2"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "win-example" {
  ami           = data.aws_ami.windows-ami.image_id
  instance_type = "t2.large"
  key_name      = aws_key_pair.mykey.key_name
  vpc_security_group_ids = [ "sg-0625789e611ebf3c4" ]
  user_data     = <<EOF
<powershell>
net user ${var.INSTANCE_USERNAME} '${var.INSTANCE_PASSWORD}' /add /y
net localgroup administrators ${var.INSTANCE_USERNAME} /add

Invoke-WebRequest -Uri "https://tekperfect-devops-uploads.s3-us-west-1.amazonaws.com/wsus-post-install.bat" -OutFile "C:\Windows\Temp\wsus-post-install.bat"
Invoke-WebRequest -Uri "https://tekperfect-devops-uploads.s3-us-west-1.amazonaws.com/UpdateServices-Services.xml" -OutFile "C:\Windows\Temp\UpdateServices-Services.xml"
Invoke-WebRequest -Uri "https://tekperfect-devops-uploads.s3-us-west-1.amazonaws.com/ndp48-x86-x64-allos-enu.exe" -OutFile "C:\Windows\Temp\ndp48-x86-x64-allos-enu.exe"
Install-WindowsFeature -Name UpdateServices, UpdateServices-WidDB, UpdateServices-Services, UpdateServices-RSAT, UpdateServices-API, UpdateServices-UI

cmd.exe /c 'C:\Windows\Temp\wsus-post-install.bat'

winrm quickconfig -q
winrm set winrm/config/winrs '@{MaxMemoryPerShellMB="300"}'
winrm set winrm/config '@{MaxTimeoutms="1800000"}'
winrm set winrm/config/service '@{AllowUnencrypted="true"}'
winrm set winrm/config/service/auth '@{Basic="true"}'

netsh advfirewall firewall add rule name="WinRM 5985" protocol=TCP dir=in localport=5985 action=allow
netsh advfirewall firewall add rule name="WinRM 5986" protocol=TCP dir=in localport=5986 action=allow

net stop winrm
sc.exe config winrm start=auto
net start winrm
</powershell>
EOF


  provisioner "file" {
    source = "dotnet-install.bat"
    destination = "C:/dotnet-install.bat"
  }
  connection {
    host = coalesce(self.public_ip, self.private_ip)
    type = "winrm"
    timeout = "10m"
    user = var.INSTANCE_USERNAME
    password = var.INSTANCE_PASSWORD
  }
}

