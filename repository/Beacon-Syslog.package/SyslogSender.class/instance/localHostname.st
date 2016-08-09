accessing
localHostname
	"resolve local hostname. If no name is resolvable then we get back the IP address.
	We return either the hostname without domain or the IP address"
	| hostname |
	hostname := NetNameResolver localHostName.
	^ (hostname copyAfterLast: $.) isAllDigits
		ifTrue: [ hostname ]
		ifFalse: [ hostname copyUpTo: $. ]