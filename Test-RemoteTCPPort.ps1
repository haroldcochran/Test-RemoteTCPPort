function Test-RemoteTCPPort {
    param (
        [Parameter(Position=0,Mandatory=$true)]
        [string]$target,
        [Parameter(Position=1,Mandatory=$true)]
        [int]$port,
        [Parameter(Position=2,Mandatory=$false)]
        [switch]$returnbool
    )
    # Get IP if hostname is passed
    if ($target -match '^\w\D.*$') {
        $target = ((Resolve-DNSName -Name $target -Type A)[0]).IPAddress
    }

    # Create the TCP Client object
    $tcp_Client = New-Object System.Net.Sockets.TcpClient

    # Send the connection request to the target
    $tcp_Client.Connect($target,$port)

    # Check to see if connection was successful
    $status = $tcp_Client.Connected
    $status_bool = $false
    
    # Dispose of the connection if it opened
    $tcp_Client.Dispose()
    if ($returnbool.IsPresent){
        if ($status -eq $true) {
            $status_bool = $true
        }
        return $status_bool
        break
    }
    else {
        if ($status -eq $true) {
            Write-Host "Connection successful to $target on port $port"
        }
        elseif ($status -ne $true) {
            Write-Host "Unable to connect to $target on port $port"
        }
    }
}
