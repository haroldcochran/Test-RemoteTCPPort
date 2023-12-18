# Test-RemoteTCPPort
Basic TCP connection test to avoid waiting for ping when using Test-NetConnection

Import-Module Test-RemoteTCPPort
Test-RemoteTCPPort -target <fqdn_or_ip> -port <tcp_port>

Boolean-only response when buliding into an object
$my_Custom_Object = Test-RemoteTCPPort -target <fqdn_or_ip> -port <tcp_port> -returnbool
