$pintostart  =  "Pin To Start"

$pintotaskbar = "Pin To Taskbar"

$file = @((join-path -path $PSHOME -childpath "PowerShell.exe"),
          (join-path -path $PSHOME -childpath "powershell_ise.exe") )

Foreach($f in $file)
  { $path = Split-Path $f
    $shell = New-Object -com "Shell.Application"
    $folder = $shell.Namespace($path)
    $item = $folder.parsename((split-path $f -leaf))
    $verbs = $item.verbs()
    
    foreach ($v in $verbs)
    
    {if($v.Name.Replace("&","") -match $pintostart){$v.DoIt()}}
    
    foreach($v in $verbs)
    
    {if($v.Name.Replace("&","") -match $pintotaskbar) {$v.DoIt()}} }
        
