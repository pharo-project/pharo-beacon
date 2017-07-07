*Beacon-Zinc
logToBeacon
	self stopLoggingToBeacon.
	^ self announcer when: ZnLogEvent do: [ :event | (ZnLogEventSignal on: event) emit ].