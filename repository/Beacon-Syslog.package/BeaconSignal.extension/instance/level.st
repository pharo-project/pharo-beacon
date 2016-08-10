*beacon-syslog
level
	^ self properties at: #level ifAbsent: [ self defaultLevel ]