#### TLSY

Simple TCP to SSL proxy. Usage: `REMOTE_SERVER_URL="tls://server:port" PORT=3030 tlsy`

Simple upstart script :

````bash
start on startup 

description     "start tlsy" 
respawn 

script
REMOTE_SERVER_URL="tls://<>tcp_server_host>:<port>" PORT=1347 tlsy 
end script
````