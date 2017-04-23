#STEPS TO BE EXECUTED INSIDE THE VM

#List disks connected
Get-PhysicalDisk | Sort Size | FT DeviceId, FriendlyName, CanPool, Size, MediaType -AutoSize

#create Pool with disks (SSD and HDD)
$s = Get-StorageSubSystem
New-StoragePool -StorageSubSystemId $s.UniqueId -FriendlyName Pool1 -PhysicalDisks (Get-PhysicalDisk -CanPool $true)

Get-StoragePool Pool1 | Get-PhysicalDisk | ? Size -lt 15GB | Set-PhysicalDisk –MediaType SSD
Get-StoragePool Pool1 | Get-PhysicalDisk | ? Size -gt 15GB | Set-PhysicalDisk –MediaType HDD

#checking
Get-StoragePool Pool1 | Get-PhysicalDisk | Sort Size | FT FriendlyName, Size, MediaType, HealthStatus, OperationalStatus -AutoSize
