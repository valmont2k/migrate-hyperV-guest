Stop-VM -Name guestVM   -Force -ComputerName ServerHV.domain.local
Start-VMFailover –Prepare –VMName guestVM -ComputerName ServerHV.domain.local -Confirm:$false -ErrorAction Stop
Start-VMFailover –VMName guestVM -ComputerName ServerReplicaHV.domain.local -Confirm:$false -ErrorAction Stop
Set-VMReplication –Reverse –VMName guestVM -ComputerName ServerReplicaHV.domain.local -Confirm:$false -ErrorAction Stop
Start-VM –VMName guestVM -ComputerName ServerReplicaHV.domain.local -ErrorAction Stop
