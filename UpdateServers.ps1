Configuration UpdateServers
{
 

node ("update.iis.test")
 

    {
    WindowsFeature UpdateServices
        {
            Ensure = "Present"
            Name= "UpdateServices"
        }

    
}
}

UpdateServers

Start-DscConfiguration -path .\UpdateServers -Verbose -Wait
