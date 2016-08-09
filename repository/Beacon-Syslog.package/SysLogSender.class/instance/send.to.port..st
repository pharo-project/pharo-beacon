private
send: message to: host port: port
	"Send formatted UDP message to host and port."

	| sock |
	sock := Socket newUDP.
	sock sendData: message toHost: (NetNameResolver addressForName: host)   port: port. 
	sock waitForSendDoneFor: Socket standardTimeout.
	sock close