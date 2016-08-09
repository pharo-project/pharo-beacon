instance creation
localhostOn: aPortNumber
	^ self new
		addHost: 'localhost'
		port: aPortNumber