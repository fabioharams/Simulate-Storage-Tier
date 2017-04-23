
# Simulate-Storage-Tier
Steps to simulate Storage Tier on Windows Server 2012 R2/Windows Server 2016

This setup is intended to simulate Storage Tier (on virtualmachines) using Hyper-V as a HOST. Do not use these procedures in production environment

You will need these 2 scripts:
## step1host.ps1
- This script must be executed on HOST and will create 6 disks (3 SSD and 3 HDD)

## step2insidevm.ps1
- This script must be executed inside the VM and will create one pool with "SSD" and "HDD"

Now you can create an Storage Pool using these disks an can enable Storage Tier
