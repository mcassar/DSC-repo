import-module ActiveDirectory
$groups = import-csv 'c:\temp\groups.csv'
foreach ($group in  $groups) {Add-ADGroupMember -Identity $group.team -Members $group.role -verbose}
