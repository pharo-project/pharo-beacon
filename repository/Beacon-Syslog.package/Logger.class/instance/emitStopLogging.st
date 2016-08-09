actions
emitStopLogging
	"Since a logger emits its own log entry"

	^ Log message: name asString , ' stopped to log' tag: 'SystemLogger'