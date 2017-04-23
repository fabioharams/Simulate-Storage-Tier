# STEPS TO EXECUTE ON HYPER-V HOST

# create 3 fixed disks to emulate SSD - 10GB each disk. You must create the directory before execute this script
1..3 | % { New-VHD -Path D:\VMS\STORAGE\SSD\SSD_$_.VHDX -Fixed –Size 10GB}

# create 3 fixed disks to emulate HDD - 20GB each disk. You must create the directory before execute this script
1..3 | % { New-VHD -Path D:\VMS\STORAGE\HDD\HDD_$_.VHDX -Fixed –Size 20GB}

#Adding disks. Replace the parameter VM01 to the name of the VM previously created
1..3 | % { Add-VMHardDiskDrive -VMName VM01 -ControllerType SCSI -Path D:\VMS\STORAGE\SSD\SSD_$_.VHDX }
1..3 | % { Add-VMHardDiskDrive -VMName VM01 -ControllerType SCSI -Path D:\VMS\STORAGE\HDD\HDD_$_.VHDX }